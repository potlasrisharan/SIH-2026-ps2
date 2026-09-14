package com.joker.kit.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.joker.kit.data.local.entity.JournalEntryEntity
import kotlinx.coroutines.flow.Flow

/**
 * 目标日志数据访问接口 (DAO)
 *
 * 对应 PRD Section 28 & 42，提供目标日志的增删改查和批量备份恢复查询支持。
 */
@Dao
interface JournalDao {

    @Query("SELECT * FROM journal_entries ORDER BY createdAt DESC")
    fun getAllJournalEntries(): Flow<List<JournalEntryEntity>>

    @Query("SELECT * FROM journal_entries ORDER BY createdAt DESC")
    suspend fun getAllJournalEntriesSync(): List<JournalEntryEntity>

    @Query("SELECT * FROM journal_entries WHERE goalId = :goalId ORDER BY createdAt DESC")
    fun getJournalEntriesForGoal(goalId: Long): Flow<List<JournalEntryEntity>>

    @Query("SELECT * FROM journal_entries WHERE id = :id")
    fun getJournalEntryById(id: Long): Flow<JournalEntryEntity?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertJournalEntry(entry: JournalEntryEntity): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(entries: List<JournalEntryEntity>)

    @Update
    suspend fun updateJournalEntry(entry: JournalEntryEntity)

    @Delete
    suspend fun deleteJournalEntry(entry: JournalEntryEntity)

    @Query("DELETE FROM journal_entries WHERE goalId = :goalId")
    suspend fun deleteJournalEntriesForGoal(goalId: Long)

    @Query("DELETE FROM journal_entries")
    suspend fun deleteAll()

    @Query("SELECT COUNT(*) FROM journal_entries")
    fun getJournalCount(): Flow<Int>
}
