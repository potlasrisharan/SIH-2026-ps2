package com.joker.kit.feature.insights.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.joker.kit.domain.model.insights.MonthlyInsightsState
import com.joker.kit.domain.model.insights.StreakStats
import com.joker.kit.domain.repository.InsightsRepository
import com.joker.kit.domain.usecase.CalculateStreakUseCase
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.flatMapLatest
import kotlinx.coroutines.flow.onStart
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.flow.update
import java.time.YearMonth
import javax.inject.Inject

@HiltViewModel
class InsightsViewModel @Inject constructor(
    private val insightsRepository: InsightsRepository,
    private val calculateStreakUseCase: CalculateStreakUseCase
) : ViewModel() {

    private val _selectedMonth = MutableStateFlow(YearMonth.now())
    val selectedMonth = _selectedMonth.asStateFlow()

    @OptIn(ExperimentalCoroutinesApi::class)
    val uiState: StateFlow<MonthlyInsightsState> = _selectedMonth
        .flatMapLatest { month ->
            combine(
                combine(
                    insightsRepository.getMonthlyOverview(month),
                    insightsRepository.getDailyCompletionTrend(month),
                    ::Pair
                ),
                insightsRepository.getWeeklyHabitStats(month),
                insightsRepository.getHabitStats(month),
                insightsRepository.getFocusStats(month),
                calculateStreakUseCase()
            ) { (overview, daily), weekly, habits, focus, streakInfo ->
                MonthlyInsightsState(
                    month = month,
                    overview = overview,
                    dailyStats = daily,
                    weeklyStats = weekly,
                    habitStats = habits,
                    topHabits = habits.sortedByDescending { it.completionPercentage }.take(5),
                    streakStats = StreakStats(
                        currentStreakDays = streakInfo.current,
                        longestStreakDays = streakInfo.longest
                    ),
                    focusStats = focus,
                    isLoading = false,
                    error = null
                )
            }
            .onStart {
                emit(MonthlyInsightsState(month = month, isLoading = true))
            }
        }
        .catch { e ->
            emit(MonthlyInsightsState(isLoading = false, error = e.message))
        }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = MonthlyInsightsState()
        )

    fun previousMonth() {
        _selectedMonth.update { it.minusMonths(1) }
    }

    fun nextMonth() {
        _selectedMonth.update { it.plusMonths(1) }
    }
}
