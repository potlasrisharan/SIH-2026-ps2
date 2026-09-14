package com.joker.kit.data.local.dao

import androidx.room.Dao
import androidx.room.Query
import com.joker.kit.data.local.entity.HabitCompletionEntity
import kotlinx.coroutines.flow.Flow

@Dao
interface InsightsDao {

    // --- Habit Completions ---
    @Query("SELECT * FROM habit_completions WHERE dateString LIKE :yearMonthPrefix || '%'")
    fun getHabitCompletionsForMonth(yearMonthPrefix: String): Flow<List<HabitCompletionEntity>>

    @Query("SELECT COUNT(*) FROM habit_completions WHERE dateString LIKE :yearMonthPrefix || '%'")
    fun getHabitCompletionCountForMonth(yearMonthPrefix: String): Flow<Int>

    // --- Task Completions ---
    // tasks.completedAt is a timestamp. We can query tasks completed in a timeframe.
    @Query("SELECT COUNT(*) FROM tasks WHERE completed = 1 AND completedAt >= :startOfMonth AND completedAt <= :endOfMonth")
    fun getCompletedTasksCountForMonth(startOfMonth: Long, endOfMonth: Long): Flow<Int>

    // --- Focus Sessions ---
    @Query("SELECT SUM(durationMinutes) FROM focus_sessions WHERE dateString LIKE :yearMonthPrefix || '%'")
    fun getTotalFocusMinutesForMonth(yearMonthPrefix: String): Flow<Int?>

    @Query("SELECT COUNT(*) FROM focus_sessions WHERE dateString LIKE :yearMonthPrefix || '%'")
    fun getFocusSessionCountForMonth(yearMonthPrefix: String): Flow<Int>

    // --- Reflections ---
    @Query("SELECT COUNT(*) FROM reflections WHERE dateString LIKE :yearMonthPrefix || '%'")
    fun getReflectionCountForMonth(yearMonthPrefix: String): Flow<Int>
}
