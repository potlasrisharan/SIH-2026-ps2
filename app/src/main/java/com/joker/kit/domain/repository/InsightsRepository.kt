package com.joker.kit.domain.repository

import com.joker.kit.domain.model.insights.DailyStat
import com.joker.kit.domain.model.insights.FocusStats
import com.joker.kit.domain.model.insights.HabitStat
import com.joker.kit.domain.model.insights.MonthlyOverview
import com.joker.kit.domain.model.insights.WeeklyStat
import kotlinx.coroutines.flow.Flow
import java.time.YearMonth

interface InsightsRepository {
    fun getMonthlyOverview(month: YearMonth): Flow<MonthlyOverview>
    fun getDailyCompletionTrend(month: YearMonth): Flow<List<DailyStat>>
    fun getWeeklyHabitStats(month: YearMonth): Flow<List<WeeklyStat>>
    fun getHabitStats(month: YearMonth): Flow<List<HabitStat>>
    fun getFocusStats(month: YearMonth): Flow<FocusStats>
    fun getActiveDaysCount(month: YearMonth): Flow<Int>
    fun getTasksCompletedCount(month: YearMonth): Flow<Int>
}
