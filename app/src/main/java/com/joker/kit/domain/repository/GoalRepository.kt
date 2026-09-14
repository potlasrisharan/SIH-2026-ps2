package com.joker.kit.domain.repository

import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.data.local.entity.MilestoneEntity
import com.joker.kit.data.local.entity.TaskEntity
import kotlinx.coroutines.flow.Flow

interface GoalRepository {
    // Goals
    fun getAllGoals(): Flow<List<GoalEntity>>
    fun getPrimaryGoal(): Flow<GoalEntity?>
    fun getGoalById(id: Long): Flow<GoalEntity?>
    suspend fun insertGoal(goal: GoalEntity): Long
    suspend fun updateGoal(goal: GoalEntity)
    suspend fun deleteGoal(goal: GoalEntity)
    
    // Milestones
    fun getMilestonesForGoal(goalId: Long): Flow<List<MilestoneEntity>>
    fun getMilestoneById(id: Long): Flow<MilestoneEntity?>
    suspend fun insertMilestone(milestone: MilestoneEntity): Long
    suspend fun updateMilestone(milestone: MilestoneEntity)
    suspend fun deleteMilestone(milestone: MilestoneEntity)

    // Tasks
    fun getTasksForGoal(goalId: Long): Flow<List<TaskEntity>>
    fun getTasksForMilestone(milestoneId: Long): Flow<List<TaskEntity>>
    fun getTaskById(id: Long): Flow<TaskEntity?>
    suspend fun insertTask(task: TaskEntity): Long
    suspend fun updateTask(task: TaskEntity)
    suspend fun deleteTask(task: TaskEntity)

    // Cross-goal task queries (used by domain engines)
    fun getCompletedTaskDays(): Flow<List<Long>>
    fun getCompletedTaskTimestamps(): Flow<List<Long>>
    fun getAllIncompleteTasks(): Flow<List<TaskEntity>>
    fun getTasksCompletedSince(fromMillis: Long): Flow<List<TaskEntity>>
    fun getAllTasks(): Flow<List<TaskEntity>>
    suspend fun getRandomIncompleteTask(): TaskEntity?
}
