package com.joker.kit.di

import com.joker.kit.data.repository.GoalRepositoryImpl
import com.joker.kit.data.repository.InsightsRepositoryImpl
import com.joker.kit.domain.repository.GoalRepository
import com.joker.kit.domain.repository.InsightsRepository
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
abstract class RepositoryModule {

    @Binds
    @Singleton
    abstract fun bindGoalRepository(
        goalRepositoryImpl: GoalRepositoryImpl
    ): GoalRepository

    @Binds
    @Singleton
    abstract fun bindInsightsRepository(
        insightsRepositoryImpl: InsightsRepositoryImpl
    ): InsightsRepository
}
