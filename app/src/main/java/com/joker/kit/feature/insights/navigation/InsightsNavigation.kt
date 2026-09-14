package com.joker.kit.feature.insights.navigation

import androidx.compose.runtime.getValue
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation3.runtime.EntryProviderScope
import androidx.navigation3.runtime.NavKey
import com.joker.kit.feature.insights.view.InsightsScreen
import com.joker.kit.feature.insights.viewmodel.InsightsViewModel

fun EntryProviderScope<NavKey>.insightsGraph(
    onNavigateBack: () -> Unit
) {
    entry<InsightsRoutes.Insights> {
        val viewModel: InsightsViewModel = hiltViewModel()
        val uiState by viewModel.uiState.collectAsStateWithLifecycle()
        InsightsScreen(
            uiState = uiState,
            onNavigateBack = onNavigateBack,
            onPreviousMonth = viewModel::previousMonth,
            onNextMonth = viewModel::nextMonth
        )
    }
}
