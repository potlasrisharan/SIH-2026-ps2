package com.joker.kit.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.joker.kit.data.local.entity.ReminderEntity
import kotlinx.coroutines.flow.Flow

/**
 * 提醒数据访问接口 (DAO)
 *
 * 对应 PRD Section 28 & 34–36，提供定时提醒查询与状态更新支持。
 */
@Dao
interface ReminderDao {

    @Query("SELECT * FROM reminders ORDER BY scheduledAt ASC")
    fun getAllReminders(): Flow<List<ReminderEntity>>

    @Query("SELECT * FROM reminders ORDER BY scheduledAt ASC")
    suspend fun getAllRemindersSync(): List<ReminderEntity>

    @Query("SELECT * FROM reminders WHERE goalId = :goalId ORDER BY scheduledAt ASC")
    fun getRemindersForGoal(goalId: Long): Flow<List<ReminderEntity>>

    @Query("SELECT * FROM reminders WHERE status = 'PENDING' ORDER BY scheduledAt ASC")
    fun getPendingReminders(): Flow<List<ReminderEntity>>

    @Query("SELECT * FROM reminders WHERE status = 'PENDING' AND scheduledAt <= :scheduledTime ORDER BY scheduledAt ASC")
    suspend fun getPendingRemindersBefore(scheduledTime: Long): List<ReminderEntity>

    @Query("SELECT * FROM reminders WHERE id = :id")
    fun getReminderById(id: Long): Flow<ReminderEntity?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertReminder(reminder: ReminderEntity): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(reminders: List<ReminderEntity>)

    @Update
    suspend fun updateReminder(reminder: ReminderEntity)

    @Delete
    suspend fun deleteReminder(reminder: ReminderEntity)

    @Query("UPDATE reminders SET status = :newStatus WHERE id = :id")
    suspend fun updateReminderStatus(id: Long, newStatus: String)

    @Query("DELETE FROM reminders WHERE goalId = :goalId")
    suspend fun deleteRemindersForGoal(goalId: Long)

    @Query("DELETE FROM reminders")
    suspend fun deleteAll()
}
