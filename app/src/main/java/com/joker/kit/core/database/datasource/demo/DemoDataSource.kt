package com.joker.kit.core.database.datasource.demo

import com.joker.kit.core.database.dao.DemoDao
import com.joker.kit.core.database.entity.DemoEntity
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Demo 数据源：演示最基础的增删改查写法
 *
 * @author Joker.X
 */
@Singleton
class DemoDataSource @Inject constructor(
    private val demoDao: DemoDao
) {

    /**
     * 新增一条记录
     *
     * @param title 标题
     * @param description 描述
     * @return 新建记录的 ID
     * @author Joker.X
     */
    suspend fun createItem(title: String, description: String = ""): Long {
        return demoDao.insertItem(
            DemoEntity(
                title = title,
                description = description
            )
        )
    }

    /**
     * 更新记录（会刷新更新时间）
     *
     * @param item Demo 实体
     * @author Joker.X
     */
    suspend fun updateItem(item: DemoEntity) {
        demoDao.updateItem(item.copy(updatedAt = System.currentTimeMillis()))
    }

    /**
     * 根据 id 删除
     *
     * @param id 记录主键
     * @author Joker.X
     */
    suspend fun deleteItem(id: Long) {
        demoDao.deleteById(id)
    }

    /**
     * 演示清空表
     *
     * @author Joker.X
     */
    suspend fun clearAll() {
        demoDao.clearAll()
    }

    /**
     * 监听所有数据
     *
     * @return Demo 列表 Flow
     * @author Joker.X
     */
    fun observeItems(): Flow<List<DemoEntity>> {
        return demoDao.getAllItems()
    }

    /**
     * 查询单条示例
     *
     * @param id 记录主键
     * @return Demo 实体或 null
     * @author Joker.X
     */
    suspend fun getItem(id: Long): DemoEntity? {
        return demoDao.getItemById(id)
    }
}
