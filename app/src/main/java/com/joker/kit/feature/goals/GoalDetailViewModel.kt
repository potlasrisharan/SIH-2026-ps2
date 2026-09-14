package com.joker.kit.feature.goals

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.data.local.entity.MilestoneEntity
import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.domain.repository.GoalRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.flatMapLatest
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

data class GoalDetailUiState(
    val isLoading: Boolean = true,
    val goal: GoalEntity? = null,
    val milestones: List<MilestoneEntity> = emptyList(),
    val tasks: List<TaskEntity> = emptyList()
)

@HiltViewModel
class GoalDetailViewModel @Inject constructor(
    private val goalRepository: GoalRepository
) : ViewModel() {

    private val goalId = MutableStateFlow<Long?>(null)

    @OptIn(ExperimentalCoroutinesApi::class)
    val uiState: StateFlow<GoalDetailUiState> = goalId.flatMapLatest { id ->
        if (id == null) return@flatMapLatest flowOf(GoalDetailUiState())
        combine(
            goalRepository.getGoalById(id),
            goalRepository.getMilestonesForGoal(id),
            goalRepository.getTasksForGoal(id)
        ) { goal, milestones, tasks ->
            GoalDetailUiState(
                isLoading = false,
                goal = goal,
                milestones = milestones,
                tasks = tasks
            )
        }
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5_000),
        initialValue = GoalDetailUiState()
    )

    fun loadGoal(id: Long) { goalId.value = id }

    fun toggleMilestone(milestone: MilestoneEntity, completed: Boolean) {
        viewModelScope.launch {
            goalRepository.updateMilestone(
                milestone.copy(status = if (completed) "COMPLETED" else "PENDING")
            )
        }
    }

    fun toggleTask(task: TaskEntity, completed: Boolean) {
        viewModelScope.launch {
            goalRepository.updateTask(
                task.copy(
                    completed = completed,
                    completedAt = if (completed) System.currentTimeMillis() else null
                )
            )
        }
    }

    fun addTask(title: String) {
        val targetGoalId = goalId.value ?: return
        if (title.isBlank()) return
        viewModelScope.launch {
            goalRepository.insertTask(
                TaskEntity(
                    goalId = targetGoalId,
                    milestoneId = null,
                    title = title.trim(),
                    description = null,
                    dueDate = null,
                    estimatedMinutes = null
                )
            )
        }
    }

    fun deleteTask(task: TaskEntity) {
        viewModelScope.launch {
            goalRepository.deleteTask(task)
        }
    }

    fun deleteGoal(goal: GoalEntity, onDeleted: () -> Unit = {}) {
        viewModelScope.launch {
            goalRepository.deleteGoal(goal)
            if (goal.isPrimary) {
                val remaining = goalRepository.getAllGoals().first()
                if (remaining.isNotEmpty()) {
                    goalRepository.updateGoal(remaining.first().copy(isPrimary = true))
                }
            }
            onDeleted()
        }
    }
}
