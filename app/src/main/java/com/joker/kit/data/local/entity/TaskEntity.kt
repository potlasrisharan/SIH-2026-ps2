package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * 任务行动实体
 *
 * 对应 PRD Section 28 & Feature 2，目标推进的具体执行单元。
 *
 * @property id 唯一主键
 * @property goalId 所属目标 ID
 * @property milestoneId 所属里程碑 ID（可选）
 * @property title 任务标题
 * @property description 任务描述（可选）
 * @property priority 优先级（0: 普通, 1: 中, 2: 高, 3: 紧急）
 * @property dueDate 截止时间戳（毫秒，可选）
 * @property estimatedMinutes 预估耗时（分钟，可选）
 * @property completed 是否已完成
 * @property createdAt 创建时间戳（毫秒）
 * @property completedAt 完成时间戳（毫秒，可选）
 */
@Serializable
@Entity(
    tableName = "tasks",
    foreignKeys = [
        ForeignKey(
            entity = GoalEntity::class,
            parentColumns = ["id"],
            childColumns = ["goalId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = MilestoneEntity::class,
            parentColumns = ["id"],
            childColumns = ["milestoneId"],
            onDelete = ForeignKey.SET_NULL
        )
    ],
    indices = [
        Index("goalId"),
        Index("milestoneId"),
        Index("completed")
    ]
)
data class TaskEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long,
    val milestoneId: Long? = null,
    val title: String,
    val description: String? = null,
    val priority: Int = 0,
    val dueDate: Long? = null,
    val estimatedMinutes: Int? = null,
    val completed: Boolean = false,
    val repeatRule: String = "NONE",
    val isFlagged: Boolean = false,
    val createdAt: Long = System.currentTimeMillis(),
    val completedAt: Long? = null
)
