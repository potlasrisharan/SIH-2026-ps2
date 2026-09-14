package com.joker.kit.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.data.local.entity.TaskEntity
import kotlinx.coroutines.flow.Flow

@Dao
interface GoalDao {
    @Query("SELECT * FROM goals")
    fun getAllGoals(): Flow<List<GoalEntity>>

    @Query("SELECT * FROM goals WHERE isPrimary = 1 LIMIT 1")
    fun getPrimaryGoal(): Flow<GoalEntity?>

    @Query("SELECT * FROM goals WHERE id = :id")
    fun getGoalById(id: Long): Flow<GoalEntity?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertGoal(goal: GoalEntity): Long

    @Update
    suspend fun updateGoal(goal: GoalEntity)

    @Delete
    suspend fun deleteGoal(goal: GoalEntity)

    /** Returns distinct epoch-day values (completedAt / 86400000) for all completed tasks, sorted DESC */
    @Query("SELECT DISTINCT (completedAt / 86400000) AS day FROM tasks WHERE completedAt IS NOT NULL ORDER BY day DESC")
    fun getCompletedTaskDays(): Flow<List<Long>>

    /** Returns raw completion epoch millis for all completed tasks, sorted DESC */
    @Query("SELECT completedAt FROM tasks WHERE completedAt IS NOT NULL AND completed = 1 ORDER BY completedAt DESC")
    fun getCompletedTaskTimestamps(): Flow<List<Long>>

    /** All incomplete tasks across all goals, ordered by priority then creation date */
    @Query("SELECT * FROM tasks WHERE completed = 0 ORDER BY priority DESC, dueDate ASC, createdAt ASC")
    fun getAllIncompleteTasks(): Flow<List<TaskEntity>>

    /** All tasks completed within the given epoch-millis window */
    @Query("SELECT * FROM tasks WHERE completedAt IS NOT NULL AND completedAt >= :fromMillis")
    fun getTasksCompletedSince(fromMillis: Long): Flow<List<TaskEntity>>

    /** All tasks across all goals */
    @Query("SELECT * FROM tasks ORDER BY createdAt DESC")
    fun getAllTasks(): Flow<List<TaskEntity>>

    /** Random incomplete task for Surprise Me */
    @Query("SELECT * FROM tasks WHERE completed = 0 ORDER BY RANDOM() LIMIT 1")
    suspend fun getRandomIncompleteTask(): TaskEntity?
}
