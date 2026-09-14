package com.joker.kit.data.repository

import com.joker.kit.data.local.dao.GoalDao
import com.joker.kit.data.local.dao.MilestoneDao
import com.joker.kit.data.local.dao.TaskDao
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.data.local.entity.MilestoneEntity
import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.domain.repository.GoalRepository
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class GoalRepositoryImpl @Inject constructor(
    private val goalDao: GoalDao,
    private val milestoneDao: MilestoneDao,
    private val taskDao: TaskDao
) : GoalRepository {

    override fun getAllGoals(): Flow<List<GoalEntity>> = goalDao.getAllGoals()

    override fun getPrimaryGoal(): Flow<GoalEntity?> = goalDao.getPrimaryGoal()

    override fun getGoalById(id: Long): Flow<GoalEntity?> = goalDao.getGoalById(id)

    override suspend fun insertGoal(goal: GoalEntity): Long = goalDao.insertGoal(goal)

    override suspend fun updateGoal(goal: GoalEntity) = goalDao.updateGoal(goal)

    override suspend fun deleteGoal(goal: GoalEntity) = goalDao.deleteGoal(goal)

    override fun getMilestonesForGoal(goalId: Long): Flow<List<MilestoneEntity>> = 
        milestoneDao.getMilestonesForGoal(goalId)

    override fun getMilestoneById(id: Long): Flow<MilestoneEntity?> = 
        milestoneDao.getMilestoneById(id)

    override suspend fun insertMilestone(milestone: MilestoneEntity): Long = 
        milestoneDao.insertMilestone(milestone)

    override suspend fun updateMilestone(milestone: MilestoneEntity) = 
        milestoneDao.updateMilestone(milestone)

    override suspend fun deleteMilestone(milestone: MilestoneEntity) = 
        milestoneDao.deleteMilestone(milestone)

    override fun getTasksForGoal(goalId: Long): Flow<List<TaskEntity>> = 
        taskDao.getTasksForGoal(goalId)

    override fun getTasksForMilestone(milestoneId: Long): Flow<List<TaskEntity>> = 
        taskDao.getTasksForMilestone(milestoneId)

    override fun getTaskById(id: Long): Flow<TaskEntity?> = 
        taskDao.getTaskById(id)

    override suspend fun insertTask(task: TaskEntity): Long = 
        taskDao.insertTask(task)

    override suspend fun updateTask(task: TaskEntity) = 
        taskDao.updateTask(task)

    override suspend fun deleteTask(task: TaskEntity) =
        taskDao.deleteTask(task)

    override fun getCompletedTaskDays(): Flow<List<Long>> =
        goalDao.getCompletedTaskDays()

    override fun getCompletedTaskTimestamps(): Flow<List<Long>> =
        goalDao.getCompletedTaskTimestamps()

    override fun getAllIncompleteTasks(): Flow<List<TaskEntity>> =
        goalDao.getAllIncompleteTasks()

    override fun getTasksCompletedSince(fromMillis: Long): Flow<List<TaskEntity>> =
        goalDao.getTasksCompletedSince(fromMillis)

    override fun getAllTasks(): Flow<List<TaskEntity>> =
        goalDao.getAllTasks()

    override suspend fun getRandomIncompleteTask(): TaskEntity? =
        goalDao.getRandomIncompleteTask()
}
