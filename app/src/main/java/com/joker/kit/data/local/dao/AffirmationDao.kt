package com.joker.kit.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.joker.kit.data.local.entity.AffirmationEntity
import kotlinx.coroutines.flow.Flow

/**
 * 个人肯定语数据访问接口 (DAO)
 *
 * 对应 PRD Section 28 & Feature 5，提供肯定宣言的管理与检索。
 */
@Dao
interface AffirmationDao {

    @Query("SELECT * FROM affirmations ORDER BY createdAt DESC")
    fun getAllAffirmations(): Flow<List<AffirmationEntity>>

    @Query("SELECT * FROM affirmations ORDER BY createdAt DESC")
    suspend fun getAllAffirmationsSync(): List<AffirmationEntity>

    @Query("SELECT * FROM affirmations WHERE goalId = :goalId ORDER BY createdAt DESC")
    fun getAffirmationsForGoal(goalId: Long): Flow<List<AffirmationEntity>>

    @Query("SELECT * FROM affirmations WHERE enabled = 1 ORDER BY createdAt DESC")
    fun getEnabledAffirmations(): Flow<List<AffirmationEntity>>

    @Query("SELECT * FROM affirmations WHERE id = :id")
    fun getAffirmationById(id: Long): Flow<AffirmationEntity?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAffirmation(affirmation: AffirmationEntity): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(affirmations: List<AffirmationEntity>)

    @Update
    suspend fun updateAffirmation(affirmation: AffirmationEntity)

    @Delete
    suspend fun deleteAffirmation(affirmation: AffirmationEntity)

    @Query("DELETE FROM affirmations WHERE goalId = :goalId")
    suspend fun deleteAffirmationsForGoal(goalId: Long)

    @Query("DELETE FROM affirmations")
    suspend fun deleteAll()
}
