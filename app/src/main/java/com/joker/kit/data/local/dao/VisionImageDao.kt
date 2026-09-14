package com.joker.kit.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.joker.kit.data.local.entity.VisionImageEntity
import kotlinx.coroutines.flow.Flow

/**
 * 愿景板图片数据访问接口 (DAO)
 *
 * 对应 PRD Section 28 & 43，提供与目标关联的愿景图片存取操作。
 */
@Dao
interface VisionImageDao {

    @Query("SELECT * FROM vision_images ORDER BY position ASC, createdAt DESC")
    fun getAllVisionImages(): Flow<List<VisionImageEntity>>

    @Query("SELECT * FROM vision_images ORDER BY position ASC, createdAt DESC")
    suspend fun getAllVisionImagesSync(): List<VisionImageEntity>

    @Query("SELECT * FROM vision_images WHERE goalId = :goalId ORDER BY position ASC, createdAt DESC")
    fun getVisionImagesForGoal(goalId: Long): Flow<List<VisionImageEntity>>

    @Query("SELECT * FROM vision_images WHERE id = :id")
    fun getVisionImageById(id: Long): Flow<VisionImageEntity?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertVisionImage(visionImage: VisionImageEntity): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(images: List<VisionImageEntity>)

    @Update
    suspend fun updateVisionImage(visionImage: VisionImageEntity)

    @Delete
    suspend fun deleteVisionImage(visionImage: VisionImageEntity)

    @Query("DELETE FROM vision_images WHERE goalId = :goalId")
    suspend fun deleteVisionImagesForGoal(goalId: Long)

    @Query("DELETE FROM vision_images")
    suspend fun deleteAll()
}
