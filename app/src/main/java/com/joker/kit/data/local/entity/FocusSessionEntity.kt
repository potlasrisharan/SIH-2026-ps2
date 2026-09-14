package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable
import java.time.LocalDate

/**
 * 专注会话实体
 *
 * 对应 PRD Section 28 & Feature 9，记录用户的计时专注历史。
 * 关联至目标及任务，支持番茄钟与自由计时统计。
 *
 * @property id 唯一主键
 * @property goalId 关联目标 ID（可选）
 * @property taskId 关联任务 ID（可选）
 * @property startedAt 专注开始时间戳（毫秒）
 * @property endedAt 专注结束时间戳（毫秒，可选）
 * @property durationMinutes 专注有效时长（分钟）
 * @property dateString 所属日期字符串（格式 YYYY-MM-DD，便于按日汇总）
 * @property timestamp 创建/记录时间戳（毫秒）
 */
@Serializable
@Entity(
    tableName = "focus_sessions",
    foreignKeys = [
        ForeignKey(
            entity = GoalEntity::class,
            parentColumns = ["id"],
            childColumns = ["goalId"],
            onDelete = ForeignKey.SET_NULL
        ),
        ForeignKey(
            entity = TaskEntity::class,
            parentColumns = ["id"],
            childColumns = ["taskId"],
            onDelete = ForeignKey.SET_NULL
        )
    ],
    indices = [
        Index("goalId"),
        Index("taskId"),
        Index("dateString")
    ]
)
data class FocusSessionEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long? = null,
    val taskId: Long? = null,
    val startedAt: Long = System.currentTimeMillis(),
    val endedAt: Long? = null,
    val durationMinutes: Int,
    val dateString: String = LocalDate.now().toString(),
    val timestamp: Long = System.currentTimeMillis()
)
