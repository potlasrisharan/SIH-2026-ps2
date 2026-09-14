package com.joker.kit.feature.progress

import androidx.compose.runtime.getValue
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation3.runtime.EntryProviderScope
import androidx.navigation3.runtime.NavKey
import com.joker.kit.feature.main.ProgressRoutes

fun EntryProviderScope<NavKey>.progressGraph() {
    entry<ProgressRoutes.Progress> {
        val viewModel: ProgressViewModel = hiltViewModel()
        val uiState by viewModel.uiState.collectAsStateWithLifecycle()
        ProgressScreen(uiState = uiState)
    }
}
