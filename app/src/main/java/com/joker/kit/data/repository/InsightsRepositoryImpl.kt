package com.joker.kit.data.repository

import com.joker.kit.data.local.dao.HabitDao
import com.joker.kit.data.local.dao.InsightsDao
import com.joker.kit.data.local.dao.TaskDao
import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.domain.model.insights.DailyStat
import com.joker.kit.domain.model.insights.FocusStats
import com.joker.kit.domain.model.insights.HabitStat
import com.joker.kit.domain.model.insights.MonthlyOverview
import com.joker.kit.domain.model.insights.WeeklyStat
import com.joker.kit.domain.repository.InsightsRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import java.time.Instant
import java.time.LocalDate
import java.time.YearMonth
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import javax.inject.Inject

class InsightsRepositoryImpl @Inject constructor(
    private val insightsDao: InsightsDao,
    private val taskDao: TaskDao,
    private val habitDao: HabitDao
) : InsightsRepository {

    private val yearMonthFormatter = DateTimeFormatter.ofPattern("yyyy-MM")

    private fun getMonthRange(month: YearMonth): Pair<Long, Long> {
        val zone = ZoneId.systemDefault()
        val startMillis = month.atDay(1).atStartOfDay(zone).toInstant().toEpochMilli()
        val endMillis = month.atEndOfMonth().atTime(23, 59, 59, 999_999_999).atZone(zone).toInstant().toEpochMilli()
        return startMillis to endMillis
    }

    private fun taskCompletionDate(task: TaskEntity): LocalDate? {
        val ts = task.completedAt ?: return null
        return Instant.ofEpochMilli(ts).atZone(ZoneId.systemDefault()).toLocalDate()
    }

    override fun getMonthlyOverview(month: YearMonth): Flow<MonthlyOverview> {
        val (startMillis, endMillis) = getMonthRange(month)
        return taskDao.getAllTasks().map { allTasks ->
            val monthTasks = allTasks.filter { it.createdAt <= endMillis }
            val completedTasks = monthTasks.filter { task ->
                task.completed && (task.completedAt == null || task.completedAt in startMillis..endMillis)
            }
            val totalCount = monthTasks.size
            val completedCount = completedTasks.size
            val leftCount = (totalCount - completedCount).coerceAtLeast(0)
            val completionRate = if (totalCount > 0) ((completedCount * 100) / totalCount) else 0

            val daysTracked = completedTasks.mapNotNull { taskCompletionDate(it) }
                .filter { it.year == month.year && it.month == month.month }
                .distinct()
                .size

            MonthlyOverview(
                daysTracked = daysTracked,
                activeHabitsCount = totalCount,
                completionRatePercentage = completionRate,
                totalCompleted = completedCount,
                totalLeft = leftCount
            )
        }
    }

    override fun getDailyCompletionTrend(month: YearMonth): Flow<List<DailyStat>> {
        val (_, endMillis) = getMonthRange(month)
        return taskDao.getAllTasks().map { allTasks ->
            val monthTasks = allTasks.filter { it.createdAt <= endMillis }
            val totalTasks = monthTasks.size.coerceAtLeast(1)

            (1..month.lengthOfMonth()).map { day ->
                val date = month.atDay(day)
                val completedOnDate = monthTasks.count { task ->
                    task.completed && taskCompletionDate(task) == date
                }
                val percentage = if (completedOnDate > 0) {
                    ((completedOnDate.toFloat() / totalTasks) * 100).toInt().coerceIn(10, 100)
                } else {
                    0
                }
                DailyStat(date = date, completionPercentage = percentage)
            }
        }
    }

    override fun getWeeklyHabitStats(month: YearMonth): Flow<List<WeeklyStat>> {
        val (_, endMillis) = getMonthRange(month)
        return taskDao.getAllTasks().map { allTasks ->
            val monthTasks = allTasks.filter { it.createdAt <= endMillis }
            val totalTasks = monthTasks.size.coerceAtLeast(1)
            val daysInMonth = month.lengthOfMonth()

            val weeks = listOf(
                Triple("WEEK 1", "1 - 7", 1..7),
                Triple("WEEK 2", "8 - 14", 8..14),
                Triple("WEEK 3", "15 - 21", 15..21),
                Triple("WEEK 4", "22 - 28", 22..28),
                Triple("WEEK 5", "29 - $daysInMonth", 29..daysInMonth)
            )

            weeks.map { (label, range, dayRange) ->
                val completedInWeek = monthTasks.count { task ->
                    val cDate = taskCompletionDate(task)
                    task.completed && cDate != null && cDate.month == month.month && cDate.year == month.year && cDate.dayOfMonth in dayRange
                }
                val pct = if (completedInWeek > 0) {
                    ((completedInWeek.toFloat() / totalTasks) * 100).toInt().coerceIn(0, 100)
                } else {
                    0
                }
                WeeklyStat(weekLabel = label, dateRange = range, completionPercentage = pct)
            }
        }
    }

    override fun getHabitStats(month: YearMonth): Flow<List<HabitStat>> {
        val (_, endMillis) = getMonthRange(month)
        return combine(
            taskDao.getAllTasks(),
            habitDao.getActiveHabits(),
            insightsDao.getHabitCompletionsForMonth(month.format(yearMonthFormatter))
        ) { allTasks, habits, habitCompletions ->
            val result = mutableListOf<HabitStat>()

            // Add tasks as trackable habit items
            val monthTasks = allTasks.filter { it.createdAt <= endMillis }
            monthTasks.forEach { task ->
                val compDate = taskCompletionDate(task)
                val completionsMap = mutableMapOf<LocalDate, Boolean>()
                if (compDate != null && compDate.month == month.month && compDate.year == month.year) {
                    completionsMap[compDate] = true
                }
                result.add(
                    HabitStat(
                        habitId = task.id,
                        name = task.title,
                        completedOccurrences = if (task.completed) 1 else 0,
                        expectedOccurrences = 1,
                        completionPercentage = if (task.completed) 100 else 0,
                        completionsByDate = completionsMap
                    )
                )
            }

            // Also merge habits if any exist
            val completionsByHabit = habitCompletions.groupBy { it.habitId }
            habits.forEach { habit ->
                val completions = completionsByHabit[habit.id] ?: emptyList()
                val compMap = completions.associate {
                    LocalDate.parse(it.dateString) to true
                }
                val pct = if (habit.targetDaysPerWeek > 0) {
                    ((completions.size.toFloat() / (habit.targetDaysPerWeek * 4)) * 100).toInt().coerceIn(0, 100)
                } else 0

                result.add(
                    HabitStat(
                        habitId = habit.id,
                        name = habit.title,
                        completedOccurrences = completions.size,
                        expectedOccurrences = habit.targetDaysPerWeek * 4,
                        completionPercentage = pct,
                        completionsByDate = compMap
                    )
                )
            }

            result
        }
    }

    override fun getFocusStats(month: YearMonth): Flow<FocusStats> {
        return insightsDao.getTotalFocusMinutesForMonth(month.format(yearMonthFormatter))
            .map { totalMinutes ->
                FocusStats(
                    totalFocusMinutes = totalMinutes ?: 0,
                    sessionsCount = if (totalMinutes != null && totalMinutes > 0) 1 else 0,
                    averageSessionMinutes = totalMinutes ?: 0
                )
            }
    }

    override fun getActiveDaysCount(month: YearMonth): Flow<Int> {
        val (startMillis, endMillis) = getMonthRange(month)
        return taskDao.getAllTasks().map { tasks ->
            tasks.filter { it.completed && it.completedAt in startMillis..endMillis }
                .mapNotNull { taskCompletionDate(it) }
                .distinct()
                .size
        }
    }

    override fun getTasksCompletedCount(month: YearMonth): Flow<Int> {
        val (startMillis, endMillis) = getMonthRange(month)
        return taskDao.getAllTasks().map { tasks ->
            tasks.count { it.completed && (it.completedAt == null || it.completedAt in startMillis..endMillis) }
        }
    }
}
