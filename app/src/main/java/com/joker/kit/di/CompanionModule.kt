package com.joker.kit.di

import android.content.Context
import androidx.room.Room
import com.joker.kit.data.local.database.CompanionDatabase
import com.joker.kit.data.local.dao.*
import com.joker.kit.domain.repository.*
import com.joker.kit.data.repository.*
import com.joker.kit.domain.usecase.*
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object CompanionModule {
    @Provides
    @Singleton
    fun provideCompanionDatabase(@ApplicationContext context: Context): CompanionDatabase {
        return Room.databaseBuilder(context, CompanionDatabase::class.java, "companion_db")
            .addMigrations(CompanionDatabase.MIGRATION_3_4)
            .fallbackToDestructiveMigration()
            .build()
    }

    @Provides
    fun provideGoalDao(db: CompanionDatabase) = db.goalDao()
    
    @Provides
    fun provideMilestoneDao(db: CompanionDatabase) = db.milestoneDao()
    
    @Provides
    fun provideTaskDao(db: CompanionDatabase) = db.taskDao()
    
    @Provides
    fun provideHabitDao(db: CompanionDatabase) = db.habitDao()
    
    @Provides
    fun provideFocusSessionDao(db: CompanionDatabase) = db.focusSessionDao()
    
    @Provides
    fun provideReflectionDao(db: CompanionDatabase) = db.reflectionDao()
    
    @Provides
    fun provideInsightsDao(db: CompanionDatabase) = db.insightsDao()

    @Provides
    fun provideAffirmationDao(db: CompanionDatabase) = db.affirmationDao()

    @Provides
    fun provideJournalDao(db: CompanionDatabase) = db.journalDao()

    @Provides
    fun provideReminderDao(db: CompanionDatabase) = db.reminderDao()

    @Provides
    fun provideVisionImageDao(db: CompanionDatabase) = db.visionImageDao()

}
