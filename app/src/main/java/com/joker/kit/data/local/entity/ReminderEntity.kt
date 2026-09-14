package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * 提醒实体
 *
 * 对应 PRD Section 28 & 34–36，记录系统或用户配置的自适应提醒任务。
 *
 * @property id 唯一主键
 * @property goalId 关联目标 ID（可选，全局提醒可为空）
 * @property type 提醒类型（如 MORNING_WHY, ACTION, EVENING_REFLECTION, CUSTOM）
 * @property scheduledAt 计划触发时间戳（毫秒）
 * @property message 提醒通知正文
 * @property status 提醒状态（PENDING, SENT, DISMISSED）
 * @property createdAt 创建时间戳（毫秒）
 */
@Serializable
@Entity(
    tableName = "reminders",
    foreignKeys = [
        ForeignKey(
            entity = GoalEntity::class,
            parentColumns = ["id"],
            childColumns = ["goalId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index("goalId"),
        Index("scheduledAt"),
        Index("status")
    ]
)
data class ReminderEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long? = null,
    val type: String,
    val scheduledAt: Long,
    val message: String,
    val status: String = "PENDING",
    val createdAt: Long = System.currentTimeMillis()
)
