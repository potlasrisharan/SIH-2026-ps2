package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * 个人肯定语（宣言）实体
 *
 * 对应 PRD Section 28 & Feature 5，用于激励用户并与特定目标强绑定。
 *
 * @property id 唯一主键
 * @property goalId 所属目标 ID
 * @property text 肯定语句子文本
 * @property enabled 是否激活参与通知或每日激励展示
 * @property createdAt 创建时间戳（毫秒）
 */
@Serializable
@Entity(
    tableName = "affirmations",
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
data class AffirmationEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long,
    val text: String,
    val enabled: Boolean = true,
    val createdAt: Long = System.currentTimeMillis()
)
