package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * 愿景板图片实体
 *
 * 对应 PRD Section 28 & 43，存储与目标相关的本地图片引用（支持沙盒内部存储或持久化 URI）。
 *
 * @property id 唯一主键
 * @property goalId 所属目标 ID
 * @property localUri 本地图片文件或 content 格式 URI 字符串
 * @property caption 图片说明文本（可选）
 * @property position 排列展示次序
 * @property createdAt 创建时间戳（毫秒）
 */
@Serializable
@Entity(
    tableName = "vision_images",
    foreignKeys = [
        ForeignKey(
            entity = GoalEntity::class,
            parentColumns = ["id"],
            childColumns = ["goalId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index("goalId")
    ]
)
data class VisionImageEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long,
    val localUri: String,
    val caption: String? = null,
    val position: Int = 0,
    val createdAt: Long = System.currentTimeMillis()
)
