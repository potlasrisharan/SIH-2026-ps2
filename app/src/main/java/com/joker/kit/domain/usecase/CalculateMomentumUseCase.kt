package com.joker.kit.domain.usecase

import com.joker.kit.domain.repository.GoalRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import java.util.concurrent.TimeUnit
import javax.inject.Inject

class CalculateMomentumUseCase @Inject constructor(
    private val goalRepository: GoalRepository,
    private val calculateStreakUseCase: CalculateStreakUseCase
) {
    /**
     * Momentum score 0-100:
     *   60% weight: task completion rate in the last 7 days
     *   40% weight: current streak (clamped to 10 days)
     */
    operator fun invoke(): Flow<Int> {
        val sevenDaysAgo = System.currentTimeMillis() - TimeUnit.DAYS.toMillis(7)
        return combine(
            goalRepository.getTasksCompletedSince(sevenDaysAgo),
            goalRepository.getAllTasks(),
            calculateStreakUseCase()
        ) { recentCompleted, allTasks, streakInfo ->
            val recentTotal = allTasks.count { task ->
                task.createdAt >= sevenDaysAgo || task.completedAt?.let { it >= sevenDaysAgo } == true
            }.coerceAtLeast(1)

            val completionRate = recentCompleted.size.toFloat() / recentTotal
            val streakComponent = streakInfo.current.coerceAtMost(10) / 10f

            ((completionRate * 60f) + (streakComponent * 40f)).toInt().coerceIn(0, 100)
        }
    }
}
