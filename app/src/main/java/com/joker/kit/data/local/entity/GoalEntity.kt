package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * 核心目标实体
 *
 * 对应 PRD Section 28 & Feature 1-3，承载个人目标的 WHY、Vision、Future Self 及生命周期状态。
 *
 * @property id 唯一主键
 * @property title 目标标题
 * @property why 核心动因陈述（The WHY）
 * @property vision 愿景描摹陈述
 * @property futureSelf 未来的自己陈述
 * @property targetDate 目标预期达成时间戳（毫秒）
 * @property isPrimary 是否为当前置顶的核心主目标
 * @property status 目标状态（ACTIVE, COMPLETED, ARCHIVED）
 * @property createdAt 创建时间戳（毫秒）
 * @property updatedAt 更新时间戳（毫秒）
 */
@Serializable
@Entity(tableName = "goals")
data class GoalEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val title: String,
    val why: String,
    val vision: String? = null,
    val futureSelf: String? = null,
    val targetDate: Long? = null,
    val isPrimary: Boolean = false,
    val status: String = "ACTIVE",
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)
