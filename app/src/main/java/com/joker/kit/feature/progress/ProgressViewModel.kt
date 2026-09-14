package com.joker.kit.feature.progress

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.joker.kit.domain.usecase.CalculateMomentumUseCase
import com.joker.kit.domain.usecase.CalculateStreakUseCase
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn
import javax.inject.Inject

data class ProgressUiState(
    val currentStreak: Int = 0,
    val longestStreak: Int = 0,
    val momentumScore: Int = 0,
    val isLoading: Boolean = true
)

@HiltViewModel
class ProgressViewModel @Inject constructor(
    calculateStreakUseCase: CalculateStreakUseCase,
    calculateMomentumUseCase: CalculateMomentumUseCase
) : ViewModel() {

    val uiState: StateFlow<ProgressUiState> = combine(
        calculateStreakUseCase(),
        calculateMomentumUseCase()
    ) { streakInfo, momentum ->
        ProgressUiState(
            currentStreak = streakInfo.current,
            longestStreak = streakInfo.longest,
            momentumScore = momentum,
            isLoading = false
        )
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5_000),
        initialValue = ProgressUiState()
    )
}
