package com.joker.kit.core.database.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Demo 表：示例用途的数据结构
 *
 * @param id 自增主键
 * @param title 标题
 * @param description 说明
 * @param updatedAt 更新时间戳
 * @author Joker.X
 */
@Entity(tableName = "demo_items")
data class DemoEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val title: String,
    val description: String = "",
    val updatedAt: Long = System.currentTimeMillis()
)
