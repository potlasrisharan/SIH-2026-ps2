package com.joker.kit.domain.model.insights

import java.time.LocalDate
import java.time.YearMonth

data class MonthlyOverview(
    val daysTracked: Int,
    val activeHabitsCount: Int,
    val completionRatePercentage: Int,
    val totalCompleted: Int = 0,
    val totalLeft: Int = 0
)

data class DailyStat(
    val date: LocalDate,
    val completionPercentage: Int
)

data class WeeklyStat(
    val weekLabel: String,
    val dateRange: String,
    val completionPercentage: Int
)

data class HabitStat(
    val habitId: Long,
    val name: String,
    val completedOccurrences: Int,
    val expectedOccurrences: Int,
    val completionPercentage: Int,
    val completionsByDate: Map<LocalDate, Boolean>
)

data class GoalStat(
    val goalId: Long,
    val title: String,
    val progressPercentage: Int,
    val tasksCompleted: Int,
    val milestonesCompleted: Int,
    val focusHours: Int
)

data class StreakStats(
    val currentStreakDays: Int,
    val longestStreakDays: Int
)

data class FocusStats(
    val totalFocusMinutes: Int,
    val sessionsCount: Int,
    val averageSessionMinutes: Int
)

data class MonthlyComparison(
    val previousMonth: YearMonth,
    val completionRateDiff: Int,
    val tasksCompletedDiff: Int,
    val activeDaysDiff: Int
)

data class MonthlyInsightsState(
    val month: YearMonth = YearMonth.now(),
    val overview: MonthlyOverview? = null,
    val dailyStats: List<DailyStat> = emptyList(),
    val weeklyStats: List<WeeklyStat> = emptyList(),
    val habitStats: List<HabitStat> = emptyList(),
    val topHabits: List<HabitStat> = emptyList(),
    val goalStats: List<GoalStat> = emptyList(),
    val streakStats: StreakStats? = null,
    val focusStats: FocusStats? = null,
    val comparison: MonthlyComparison? = null,
    val selectedDay: LocalDate? = null,
    val isLoading: Boolean = true,
    val error: String? = null
)
