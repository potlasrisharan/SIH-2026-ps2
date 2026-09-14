package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * 目标日志条目实体
 *
 * 对应 PRD Section 28 & 42，用于记录与特定目标关联的个人反思与进展记录。
 * 遵循极简与私密设计原则，级联关联至 [GoalEntity]。
 *
 * @property id 唯一主键
 * @property goalId 所属目标 ID
 * @property content 日志文本内容
 * @property createdAt 创建时间戳（毫秒）
 * @property updatedAt 更新时间戳（毫秒）
 */
@Serializable
@Entity(
    tableName = "journal_entries",
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
data class JournalEntryEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val goalId: Long,
    val content: String,
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)
