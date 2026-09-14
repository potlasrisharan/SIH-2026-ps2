package com.joker.kit.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "habits")
data class HabitEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val title: String,
    val frequencyType: String, // DAILY, WEEKDAYS, CUSTOM
    val targetDaysPerWeek: Int = 7,
    val archived: Boolean = false,
    val createdAt: Long = System.currentTimeMillis()
)
