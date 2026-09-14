package com.joker.kit.domain.usecase

import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.domain.repository.GoalRepository
import kotlinx.coroutines.flow.Flow

import javax.inject.Inject

class GetPrimaryGoalUseCase @Inject constructor(
    private val goalRepository: GoalRepository
) {
    operator fun invoke(): Flow<GoalEntity?> {
        return goalRepository.getPrimaryGoal()
    }
}
