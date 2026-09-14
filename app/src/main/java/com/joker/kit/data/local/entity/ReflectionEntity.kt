package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable
import java.time.LocalDate

/**
 * 反思与复盘实体
 *
 * 对应 PRD Section 28 & Feature 14，支持每日复盘与每周复盘结构化问题记录。
 *
 * @property id 唯一主键
 * @property goalId 关联目标 ID（可选）
 * @property dateString 记录日期字符串（格式 YYYY-MM-DD）
 * @property type 反思类型（DAILY 或 WEEKLY）
 * @property mood 心情/状态评估（GREAT, GOOD, NEUTRAL, TOUGH 等）
 * @property accomplishment 今日成就或积极进展
 * @property difficulty 遇到的难点或阻碍
 * @property tomorrowFocus 明日核心攻坚焦点
 * @property content 自由反思文本或总结
 * @property timestamp 记录时间戳（毫秒）
 */
@Serializable
@Entity(
    tableName = "reflections",
    foreignKeys = [
        ForeignKey(
            entity = GoalEntity::class,
            parentColumns = ["id"],
            childColumns = ["goalId"],
            onDelete = ForeignKey.SET_NULL
        )
    ],
    indices = [
        Index("goalId"),
        Index("dateString")
    ]
)
data class ReflectionEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long? = null,
    val dateString: String = LocalDate.now().toString(),
    val type: String = "DAILY",
    val mood: String? = null,
    val accomplishment: String? = null,
    val difficulty: String? = null,
    val tomorrowFocus: String? = null,
    val content: String = "",
    val timestamp: Long = System.currentTimeMillis()
)
