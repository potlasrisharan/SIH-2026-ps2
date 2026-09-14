package com.joker.kit.feature.goals

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.domain.repository.GoalRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

data class GoalsUiState(
    val isLoading: Boolean = true,
    val goals: List<GoalEntity> = emptyList()
)

@HiltViewModel
class GoalsViewModel @Inject constructor(
    private val goalRepository: GoalRepository
) : ViewModel() {

    val uiState: StateFlow<GoalsUiState> = goalRepository.getAllGoals()
        .map { goals -> GoalsUiState(isLoading = false, goals = goals) }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5_000),
            initialValue = GoalsUiState()
        )

    fun deleteGoal(goal: GoalEntity) {
        viewModelScope.launch {
            goalRepository.deleteGoal(goal)
            if (goal.isPrimary) {
                val remaining = goalRepository.getAllGoals().first()
                if (remaining.isNotEmpty()) {
                    goalRepository.updateGoal(remaining.first().copy(isPrimary = true))
                }
            }
        }
    }

    fun setPrimary(goal: GoalEntity) {
        viewModelScope.launch {
            // Clear existing primary
            uiState.value.goals.filter { it.isPrimary }.forEach { g ->
                goalRepository.updateGoal(g.copy(isPrimary = false))
            }
            goalRepository.updateGoal(goal.copy(isPrimary = true))
        }
    }
}
