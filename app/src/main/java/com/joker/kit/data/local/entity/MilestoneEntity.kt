package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * 目标里程碑实体
 *
 * 对应 PRD Section 28 & Feature 2，将大目标拆解为阶段性关键结果。
 * 级联关联至 [GoalEntity]。
 *
 * @property id 唯一主键
 * @property goalId 所属目标 ID
 * @property title 里程碑标题
 * @property description 里程碑说明（可选）
 * @property targetDate 预期完成时间戳（毫秒，可选）
 * @property position 顺序权重
 * @property status 状态（PENDING, COMPLETED）
 * @property createdAt 创建时间戳（毫秒）
 */
@Serializable
@Entity(
    tableName = "milestones",
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
data class MilestoneEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long,
    val title: String,
    val description: String? = null,
    val targetDate: Long? = null,
    val position: Int = 0,
    val status: String = "PENDING",
    val createdAt: Long = System.currentTimeMillis()
)
