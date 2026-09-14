package com.joker.kit.feature.today.navigation

import androidx.compose.runtime.getValue
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation3.runtime.EntryProviderScope
import androidx.navigation3.runtime.NavKey
import com.joker.kit.feature.today.view.TodayScreen
import com.joker.kit.feature.today.viewmodel.TodayViewModel

fun EntryProviderScope<NavKey>.todayGraph(
    onNavigateToInsights: () -> Unit
) {
    entry<TodayRoutes.Today> {
        val viewModel: TodayViewModel = hiltViewModel()
        val uiState by viewModel.uiState.collectAsStateWithLifecycle()
        TodayScreen(
            uiState = uiState,
            onNavigateToInsights = onNavigateToInsights,
            onSaveTask = viewModel::saveTask,
            onAddTask = viewModel::addTask,
            onToggleTask = viewModel::toggleTask,
            onDeleteTask = viewModel::deleteTask,
            onRefreshQuote = viewModel::shuffleQuote,
            onRefreshGreeting = viewModel::shuffleGreeting
        )
    }
}
