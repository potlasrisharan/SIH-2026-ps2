package com.joker.kit.feature.goals

import androidx.compose.runtime.getValue
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation3.runtime.EntryProviderScope
import androidx.navigation3.runtime.NavKey
import com.joker.kit.data.local.entity.GoalEntity
import kotlinx.serialization.Serializable

object GoalNavRoutes {
    @Serializable data object GoalsList : NavKey
    @Serializable data class GoalDetail(val goalId: Long) : NavKey
    @Serializable data object GoalCreate : NavKey
}

fun EntryProviderScope<NavKey>.goalsGraph(
    onNavigateToGoalDetail: (Long) -> Unit,
    onNavigateToGoalCreate: () -> Unit,
    onNavigateBack: () -> Unit
) {
    entry<GoalNavRoutes.GoalsList> {
        val viewModel: GoalsViewModel = hiltViewModel()
        val uiState by viewModel.uiState.collectAsStateWithLifecycle()
        GoalsScreen(
            uiState = uiState,
            onGoalClick = onNavigateToGoalDetail,
            onNewGoalClick = onNavigateToGoalCreate,
            onSetPrimary = viewModel::setPrimary,
            onDelete = viewModel::deleteGoal
        )
    }
    entry<GoalNavRoutes.GoalDetail> { key ->
        val viewModel: GoalDetailViewModel = hiltViewModel()
        androidx.compose.runtime.LaunchedEffect(key.goalId) {
            viewModel.loadGoal(key.goalId)
        }
        val uiState by viewModel.uiState.collectAsStateWithLifecycle()
        GoalDetailScreen(
            uiState = uiState,
            onBack = onNavigateBack,
            onToggleMilestone = viewModel::toggleMilestone,
            onToggleTask = viewModel::toggleTask,
            onAddTask = viewModel::addTask,
            onDeleteTask = viewModel::deleteTask,
            onDeleteGoal = { goal ->
                viewModel.deleteGoal(goal) {
                    onNavigateBack()
                }
            }
        )
    }
    entry<GoalNavRoutes.GoalCreate> {
        val viewModel: GoalCreateEditViewModel = hiltViewModel()
        val uiState by viewModel.uiState.collectAsStateWithLifecycle()
        GoalCreateEditScreen(
            uiState = uiState,
            onTitleChange = viewModel::setTitle,
            onWhyChange = viewModel::setWhy,
            onVisionChange = viewModel::setVision,
            onSave = viewModel::save,
            onBack = onNavigateBack,
            onSaved = onNavigateBack
        )
    }
}
