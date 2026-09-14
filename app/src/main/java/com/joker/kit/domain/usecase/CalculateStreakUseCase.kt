package com.joker.kit.domain.usecase

import com.joker.kit.domain.model.StreakInfo
import com.joker.kit.domain.repository.GoalRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId
import javax.inject.Inject

class CalculateStreakUseCase @Inject constructor(
    private val goalRepository: GoalRepository
) {
    /**
     * Derives real streaks from days where the user completed at least one task.
     * Calculated in user's local timezone (ZoneId.systemDefault()) to prevent midnight drift.
     * Returns StreakInfo(current, longest).
     */
    operator fun invoke(): Flow<StreakInfo> {
        return goalRepository.getCompletedTaskTimestamps().map { timestamps ->
            if (timestamps.isEmpty()) return@map StreakInfo(0, 0)

            val zone = ZoneId.systemDefault()
            val daySet = timestamps.map { millis ->
                Instant.ofEpochMilli(millis).atZone(zone).toLocalDate().toEpochDay()
            }.toSortedSet()
            val todayEpochDay = LocalDate.now(zone).toEpochDay()

            // Current streak: count consecutive days backward from today
            var current = 0
            var day = todayEpochDay
            while (daySet.contains(day)) {
                current++
                day--
            }
            // If today not yet tracked, check if yesterday started a streak
            if (current == 0) {
                day = todayEpochDay - 1
                while (daySet.contains(day)) {
                    current++
                    day--
                }
            }

            // Longest streak: scan all days
            var longest = 0
            var runLength = 0
            var prev = Long.MIN_VALUE
            for (d in daySet) {
                runLength = if (d == prev + 1) runLength + 1 else 1
                if (runLength > longest) longest = runLength
                prev = d
            }

            StreakInfo(current = current, longest = longest)
        }
    }
}
