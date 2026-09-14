package com.joker.kit.domain.usecase

import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.domain.repository.GoalRepository
import javax.inject.Inject

class SurpriseMeUseCase @Inject constructor(
    private val goalRepository: GoalRepository
) {
    /** Returns a random incomplete task from any goal. Null if no tasks exist. */
    suspend operator fun invoke(): TaskEntity? {
        return goalRepository.getRandomIncompleteTask()
    }
}
