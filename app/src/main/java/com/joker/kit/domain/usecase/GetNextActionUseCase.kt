package com.joker.kit.domain.usecase

import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.domain.repository.GoalRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flatMapLatest
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.flow.map
import javax.inject.Inject

class GetNextActionUseCase @Inject constructor(
    private val goalRepository: GoalRepository,
    private val getPrimaryGoalUseCase: GetPrimaryGoalUseCase
) {
    /**
     * Returns the single highest-priority incomplete task for the primary goal.
     * Priority: overdue first, then priority DESC, dueDate ASC NULLS LAST, createdAt ASC.
     */
    @OptIn(kotlinx.coroutines.ExperimentalCoroutinesApi::class)
    operator fun invoke(): Flow<TaskEntity?> {
        return getPrimaryGoalUseCase().flatMapLatest { goal ->
            if (goal == null) return@flatMapLatest flowOf(null)
            goalRepository.getTasksForGoal(goal.id).map { tasks ->
                val now = System.currentTimeMillis()
                tasks.filter { !it.completed }
                    .sortedWith(
                        compareByDescending<TaskEntity> { it.dueDate != null && it.dueDate < now }
                            .thenByDescending { it.priority }
                            .thenBy { it.dueDate ?: Long.MAX_VALUE }
                            .thenBy { it.createdAt }
                    )
                    .firstOrNull()
            }
        }
    }
}
