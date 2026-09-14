package com.joker.kit.core.data.repository

import com.joker.kit.core.database.datasource.demo.DemoDataSource
import com.joker.kit.core.database.entity.DemoEntity
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOn
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Demo 仓库
 * 暴露对 Demo 表的增删改查，供示例代码调用
 *
 * @param demoDataSource Demo 数据源
 * @author Joker.X
 */
@Singleton
class DemoRepository @Inject constructor(
    private val demoDataSource: DemoDataSource
) {

    /**
     * 新增记录
     *
     * @param title 标题
     * @param description 描述
     * @return 记录 ID
     * @author Joker.X
     */
    suspend fun createItem(title: String, description: String = ""): Long {
        return demoDataSource.createItem(title, description)
    }

    /**
     * 更新记录
     *
     * @param item Demo 实体
     * @author Joker.X
     */
    suspend fun updateItem(item: DemoEntity) {
        demoDataSource.updateItem(item)
    }

    /**
     * 根据 id 删除
     *
     * @param id 记录主键
     * @author Joker.X
     */
    suspend fun deleteItem(id: Long) {
        demoDataSource.deleteItem(id)
    }

    /**
     * 清空示例表
     *
     * @author Joker.X
     */
    suspend fun clearAll() {
        demoDataSource.clearAll()
    }

    /**
     * 监听 Demo 表的全部数据
     *
     * @return Demo 列表 Flow
     * @author Joker.X
     */
    fun observeItems(): Flow<List<DemoEntity>> {
        return demoDataSource.observeItems().flowOn(Dispatchers.IO)
    }

    /**
     * 查询单条记录
     *
     * @param id 记录主键
     * @return Demo 实体或 null
     * @author Joker.X
     */
    suspend fun getItem(id: Long): DemoEntity? {
        return demoDataSource.getItem(id)
    }
}
