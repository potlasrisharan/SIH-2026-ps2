package com.joker.kit.data.local.database

import androidx.room.Database
import androidx.room.RoomDatabase
import com.joker.kit.data.local.dao.AffirmationDao
import com.joker.kit.data.local.dao.FocusSessionDao
import com.joker.kit.data.local.dao.GoalDao
import com.joker.kit.data.local.dao.HabitDao
import com.joker.kit.data.local.dao.InsightsDao
import com.joker.kit.data.local.dao.JournalDao
import com.joker.kit.data.local.dao.MilestoneDao
import com.joker.kit.data.local.dao.ReflectionDao
import com.joker.kit.data.local.dao.ReminderDao
import com.joker.kit.data.local.dao.TaskDao
import com.joker.kit.data.local.dao.VisionImageDao
import com.joker.kit.data.local.entity.AffirmationEntity
import com.joker.kit.data.local.entity.FocusSessionEntity
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.data.local.entity.HabitCompletionEntity
import com.joker.kit.data.local.entity.HabitEntity
import com.joker.kit.data.local.entity.JournalEntryEntity
import com.joker.kit.data.local.entity.MilestoneEntity
import com.joker.kit.data.local.entity.ReflectionEntity
import com.joker.kit.data.local.entity.ReminderEntity
import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.data.local.entity.VisionImageEntity

@Database(
    entities = [
        GoalEntity::class,
        MilestoneEntity::class,
        TaskEntity::class,
        HabitEntity::class,
        HabitCompletionEntity::class,
        FocusSessionEntity::class,
        ReflectionEntity::class,
        AffirmationEntity::class,
        JournalEntryEntity::class,
        ReminderEntity::class,
        VisionImageEntity::class,
    ],
    version = 4,
    exportSchema = false
)
abstract class CompanionDatabase : RoomDatabase() {
    abstract fun goalDao(): GoalDao
    abstract fun milestoneDao(): MilestoneDao
    abstract fun taskDao(): TaskDao
    abstract fun habitDao(): HabitDao
    abstract fun focusSessionDao(): FocusSessionDao
    abstract fun reflectionDao(): ReflectionDao
    abstract fun insightsDao(): InsightsDao
    abstract fun affirmationDao(): AffirmationDao
    abstract fun journalDao(): JournalDao
    abstract fun reminderDao(): ReminderDao
    abstract fun visionImageDao(): VisionImageDao

    companion object {
        val MIGRATION_3_4 = object : androidx.room.migration.Migration(3, 4) {
            override fun migrate(db: androidx.sqlite.db.SupportSQLiteDatabase) {
                db.execSQL("ALTER TABLE tasks ADD COLUMN repeatRule TEXT NOT NULL DEFAULT 'NONE'")
                db.execSQL("ALTER TABLE tasks ADD COLUMN isFlagged INTEGER NOT NULL DEFAULT 0")
            }
        }
    }
}
