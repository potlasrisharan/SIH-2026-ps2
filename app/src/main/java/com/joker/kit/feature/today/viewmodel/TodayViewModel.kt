package com.joker.kit.feature.today.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.domain.repository.GoalRepository
import com.joker.kit.domain.usecase.CalculateStreakUseCase
import com.joker.kit.domain.usecase.GetPrimaryGoalUseCase
import com.joker.kit.domain.usecase.MotivationEngineUseCase
import com.joker.kit.domain.usecase.MotivationQuotes
import com.joker.kit.core.notification.TaskAlarmScheduler
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import java.time.LocalDate
import java.time.LocalTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import javax.inject.Inject

object Greetings {
    private val morning = listOf(
        "Good morning — lock in early",
        "Rise and execute",
        "Morning — make today count",
        "Early hours win the war",
        "Good morning — attack the day",
        "Dawn is your advantage",
        "Good morning — zero excuses today"
    )
    private val afternoon = listOf(
        "Good afternoon — keep momentum high",
        "Afternoon push — stay relentless",
        "Good afternoon — lock back in",
        "Midday checkpoint — finish strong",
        "Afternoon focus — execute the plan",
        "Good afternoon — push through resistance"
    )
    private val evening = listOf(
        "Good evening — close out strong",
        "Evening review — complete the agenda",
        "Good evening — finish what you started",
        "Nightfall — earn your rest",
        "Good evening — stay consistent",
        "Final hours — leave nothing undone"
    )
    private val night = listOf(
        "Good night — victory in consistency",
        "Late hours — plan tomorrow's win",
        "Good night — rest and recharge",
        "End of day — review your execution",
        "Discipline never sleeps"
    )

    fun getGreeting(hour: Int = LocalTime.now().hour): String {
        val list = when (hour) {
            in 5..11 -> morning
            in 12..16 -> afternoon
            in 17..21 -> evening
            else -> night
        }
        return list.random()
    }
}

object AgendaQuotes {
    val emptyQuotes = listOf(
        "An empty agenda is a blank canvas. Add your first task and take control of today.",
        "Discipline starts with the first task. What will you conquer today?",
        "Clean slate. Decide what matters today and lock it in.",
        "Action cures hesitation. Add your first task to start your momentum.",
        "Small daily disciplines lead to massive lifetime victories. Add a task to begin.",
        "Your future self is built by what you do today. Add a task to set the pace."
    )

    val completedQuotes = listOf(
        "All tasks completed! You showed up, locked in, and delivered 100%.",
        "Mission accomplished. Consistency is what transforms average into excellence.",
        "Every task crushed today! The streak is safe—earn your rest or plan tomorrow's win.",
        "Flawless execution today. Victory is forged one completed checklist at a time.",
        "100% of today's tasks completed. Rest up, champions reload."
    )

    fun getRandomEmptyQuote(): String = emptyQuotes.random()
    fun getRandomCompletedQuote(): String = completedQuotes.random()
}

data class TodayUiState(
    val isLoading: Boolean = true,
    val primaryGoal: GoalEntity? = null,
    val availableGoals: List<GoalEntity> = emptyList(),
    val todayTasks: List<TaskEntity> = emptyList(),
    val goalTitles: Map<Long, String> = emptyMap(),
    val currentStreak: Int = 0,
    val dailyProgress: Float = 0f,
    val currentDate: String = "",
    val dailyQuote: String = "Remember what you're working toward.",
    val greeting: String = Greetings.getGreeting(),
    val emptyAgendaQuote: String = AgendaQuotes.getRandomEmptyQuote(),
    val completedAgendaQuote: String = AgendaQuotes.getRandomCompletedQuote()
) {
    val isAllTasksCompleted: Boolean
        get() = todayTasks.isNotEmpty() && todayTasks.all { it.completed }
}

@HiltViewModel
class TodayViewModel @Inject constructor(
    private val getPrimaryGoalUseCase: GetPrimaryGoalUseCase,
    private val goalRepository: GoalRepository,
    private val calculateStreakUseCase: CalculateStreakUseCase,
    private val motivationEngineUseCase: MotivationEngineUseCase,
    private val taskAlarmScheduler: TaskAlarmScheduler
) : ViewModel() {

    private val dateFormatter = DateTimeFormatter.ofPattern("MMMM d")
    private val _currentQuote = MutableStateFlow(MotivationQuotes.getRandomQuote())
    private val _currentGreeting = MutableStateFlow(Greetings.getGreeting())
    private val _currentEmptyQuote = MutableStateFlow(AgendaQuotes.getRandomEmptyQuote())
    private val _currentCompletedQuote = MutableStateFlow(AgendaQuotes.getRandomCompletedQuote())

    init {
        viewModelScope.launch {
            val goals = goalRepository.getAllGoals().first()
            if (goals.isEmpty()) {
                goalRepository.insertGoal(
                    GoalEntity(
                        title = "Daily Focus",
                        why = "Execute consistently and build momentum.",
                        vision = null,
                        futureSelf = null,
                        targetDate = null,
                        isPrimary = true
                    )
                )
            }
        }
    }

    fun shuffleQuote() {
        _currentQuote.value = MotivationQuotes.getRandomQuote()
        _currentEmptyQuote.value = AgendaQuotes.getRandomEmptyQuote()
        _currentCompletedQuote.value = AgendaQuotes.getRandomCompletedQuote()
    }

    fun shuffleGreeting() {
        _currentGreeting.value = Greetings.getGreeting()
    }

    // Emits periodically so dates, time-based greetings, and streaks auto-update across midnight
    private val timeTicker = flow {
        while (true) {
            emit(System.currentTimeMillis())
            delay(30_000)
        }
    }

    private data class QuotesBundle(
        val quote: String,
        val greeting: String,
        val emptyQuote: String,
        val completedQuote: String
    )

    private val quotesAndGreetingFlow = combine(
        _currentQuote,
        _currentGreeting,
        _currentEmptyQuote,
        _currentCompletedQuote
    ) { quote, greeting, emptyQuote, completedQuote ->
        QuotesBundle(quote, greeting, emptyQuote, completedQuote)
    }

    val uiState: StateFlow<TodayUiState> = combine(
        combine(
            goalRepository.getAllGoals(),
            goalRepository.getAllTasks(),
            ::Pair
        ),
        calculateStreakUseCase(),
        quotesAndGreetingFlow,
        timeTicker
    ) { (goals, allTasks), streakInfo, quotesBundle, _ ->
        val primaryGoal = goals.firstOrNull { it.isPrimary } ?: goals.firstOrNull()
        val goalTitles = goals.associate { it.id to it.title }

        val zone = ZoneId.systemDefault()
        val today = LocalDate.now(zone)
        val startOfToday = today.atStartOfDay(zone).toInstant().toEpochMilli()
        val endOfToday = today.plusDays(1).atStartOfDay(zone).toInstant().toEpochMilli() - 1

        val filteredTodayTasks = allTasks.filter { task ->
            if (task.dueDate != null) {
                val isDueToday = task.dueDate in startOfToday..endOfToday
                val isOverduePending = task.dueDate < startOfToday && !task.completed
                isDueToday || isOverduePending
            } else {
                if (!task.completed) {
                    true
                } else {
                    val completedTime = task.completedAt ?: task.createdAt
                    completedTime in startOfToday..endOfToday
                }
            }
        }

        // Incomplete tasks first (priority DESC, createdAt DESC), then completed tasks
        val sortedTasks = filteredTodayTasks.sortedWith(
            compareBy<TaskEntity> { it.completed }
                .thenByDescending { it.priority }
                .thenByDescending { it.createdAt }
        )

        val completedCount = filteredTodayTasks.count { it.completed }
        val progress = if (filteredTodayTasks.isEmpty()) 0f else completedCount.toFloat() / filteredTodayTasks.size

        TodayUiState(
            isLoading = false,
            primaryGoal = primaryGoal,
            availableGoals = goals,
            todayTasks = sortedTasks,
            goalTitles = goalTitles,
            currentStreak = streakInfo.current,
            dailyProgress = progress,
            currentDate = today.format(dateFormatter),
            dailyQuote = quotesBundle.quote,
            greeting = quotesBundle.greeting,
            emptyAgendaQuote = quotesBundle.emptyQuote,
            completedAgendaQuote = quotesBundle.completedQuote
        )
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5_000),
        initialValue = TodayUiState()
    )

    fun saveTask(
        taskId: Long = 0,
        title: String,
        description: String?,
        goalId: Long,
        priority: Int,
        dueDate: Long?,
        repeatRule: String
    ) {
        if (title.isBlank()) return
        val now = System.currentTimeMillis()
        if (taskId == 0L && dueDate != null && dueDate < now) {
            return
        }
        viewModelScope.launch {
            val allGoals = goalRepository.getAllGoals().first()
            val targetGoalId = if (goalId > 0 && allGoals.any { it.id == goalId }) {
                goalId
            } else {
                allGoals.firstOrNull { it.isPrimary }?.id
                    ?: allGoals.firstOrNull()?.id
                    ?: goalRepository.insertGoal(
                        GoalEntity(
                            title = "Daily Focus",
                            why = "Execute consistently and build momentum.",
                            vision = null,
                            futureSelf = null,
                            targetDate = null,
                            isPrimary = true
                        )
                    )
            }

            if (taskId > 0) {
                val existing = uiState.value.todayTasks.firstOrNull { it.id == taskId }
                val updated = (existing ?: TaskEntity(id = taskId, goalId = targetGoalId, title = title)).copy(
                    goalId = targetGoalId,
                    title = title.trim(),
                    description = description?.trim(),
                    priority = priority,
                    dueDate = dueDate,
                    repeatRule = repeatRule
                )
                goalRepository.updateTask(updated)
                taskAlarmScheduler.schedule(updated)
            } else {
                val newTask = TaskEntity(
                    goalId = targetGoalId,
                    milestoneId = null,
                    title = title.trim(),
                    description = description?.trim(),
                    priority = priority,
                    dueDate = dueDate,
                    repeatRule = repeatRule
                )
                val newId = goalRepository.insertTask(newTask)
                taskAlarmScheduler.schedule(newTask.copy(id = newId))
            }
        }
    }

    fun addTask(title: String) {
        saveTask(
            title = title,
            description = null,
            goalId = uiState.value.primaryGoal?.id ?: 0,
            priority = 0,
            dueDate = null,
            repeatRule = "NONE"
        )
    }

    fun toggleTask(task: TaskEntity, completed: Boolean) {
        viewModelScope.launch {
            val updated = task.copy(
                completed = completed,
                completedAt = if (completed) System.currentTimeMillis() else null
            )
            goalRepository.updateTask(updated)

            if (completed) {
                taskAlarmScheduler.cancel(task)

                // Recurring tasks: spawn next occurrence automatically
                if (task.repeatRule != "NONE") {
                    val allGoals = goalRepository.getAllGoals().first()
                    val validGoalId = if (allGoals.any { it.id == task.goalId }) {
                        task.goalId
                    } else {
                        allGoals.firstOrNull { it.isPrimary }?.id
                            ?: allGoals.firstOrNull()?.id
                            ?: goalRepository.insertGoal(
                                GoalEntity(
                                    title = "Daily Focus",
                                    why = "Execute consistently and build momentum.",
                                    vision = null,
                                    futureSelf = null,
                                    targetDate = null,
                                    isPrimary = true
                                )
                            )
                    }
                    val nextDueDate = calculateNextDueDate(task.dueDate, task.repeatRule)
                    val nextTask = TaskEntity(
                        goalId = validGoalId,
                        milestoneId = task.milestoneId,
                        title = task.title,
                        description = task.description,
                        priority = task.priority,
                        dueDate = nextDueDate,
                        repeatRule = task.repeatRule,
                        completed = false
                    )
                    val nextId = goalRepository.insertTask(nextTask)
                    taskAlarmScheduler.schedule(nextTask.copy(id = nextId))
                }
            } else {
                taskAlarmScheduler.schedule(updated)
            }
        }
    }

    fun deleteTask(task: TaskEntity) {
        viewModelScope.launch {
            taskAlarmScheduler.cancel(task)
            goalRepository.deleteTask(task)
        }
    }

    private fun calculateNextDueDate(currentDueDate: Long?, repeatRule: String): Long? {
        val zone = ZoneId.systemDefault()
        val baseDateTime = if (currentDueDate != null) {
            java.time.Instant.ofEpochMilli(currentDueDate).atZone(zone).toLocalDateTime()
        } else {
            LocalDate.now(zone).atTime(9, 0)
        }

        val nextDateTime = when (repeatRule) {
            "DAILY" -> baseDateTime.plusDays(1)
            "WEEKDAYS" -> {
                var next = baseDateTime.plusDays(1)
                while (next.dayOfWeek.value in 6..7) {
                    next = next.plusDays(1)
                }
                next
            }
            "WEEKENDS" -> {
                var next = baseDateTime.plusDays(1)
                while (next.dayOfWeek.value !in 6..7) {
                    next = next.plusDays(1)
                }
                next
            }
            "WEEKLY" -> baseDateTime.plusWeeks(1)
            "MONTHLY" -> baseDateTime.plusMonths(1)
            "YEARLY" -> baseDateTime.plusYears(1)
            else -> baseDateTime.plusDays(1)
        }
        return nextDateTime.atZone(zone).toInstant().toEpochMilli()
    }
}

