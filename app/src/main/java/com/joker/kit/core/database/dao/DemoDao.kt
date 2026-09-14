package com.joker.kit.core.database.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.joker.kit.core.database.entity.DemoEntity
import kotlinx.coroutines.flow.Flow

/**
 * Demo 表 DAO：演示最基础的增删改查
 *
 * @author Joker.X
 */
@Dao
interface DemoDao {

    /**
     * 新增一条记录
     *
     * @param item Demo 实体
     * @return 插入后的行 ID
     * @author Joker.X
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItem(item: DemoEntity): Long

    /**
     * 更新整条记录
     *
     * @param item Demo 实体
     * @author Joker.X
     */
    @Update
    suspend fun updateItem(item: DemoEntity)

    /**
     * 根据主键删除
     *
     * @param id 记录主键
     * @author Joker.X
     */
    @Query("DELETE FROM demo_items WHERE id = :id")
    suspend fun deleteById(id: Long)

    /**
     * 也可以直接删除整个实体
     *
     * @param item Demo 实体
     * @author Joker.X
     */
    @Delete
    suspend fun delete(item: DemoEntity)

    /**
     * 清空演示表
     *
     * @author Joker.X
     */
    @Query("DELETE FROM demo_items")
    suspend fun clearAll()

    /**
     * 查询所有记录，按更新时间倒序
     *
     * @return Demo 列表 Flow
     * @author Joker.X
     */
    @Query("SELECT * FROM demo_items ORDER BY updatedAt DESC")
    fun getAllItems(): Flow<List<DemoEntity>>

    /**
     * 根据 ID 查询
     *
     * @param id 记录主键
     * @return Demo 实体或 null
     * @author Joker.X
     */
    @Query("SELECT * FROM demo_items WHERE id = :id")
    suspend fun getItemById(id: Long): DemoEntity?
}
