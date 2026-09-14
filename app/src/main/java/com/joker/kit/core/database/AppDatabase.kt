package com.joker.kit.core.database

import androidx.room.Database
import androidx.room.RoomDatabase
import com.joker.kit.core.database.dao.DemoDao
import com.joker.kit.core.database.entity.DemoEntity

/**
 * 应用数据库，仅保留一张 Demo 表用于演示 Room 的基本 CRUD
 *
 * @author Joker.X
 */
@Database(
    entities = [
        DemoEntity::class
    ],
    version = 2,
    exportSchema = false
)
abstract class AppDatabase : RoomDatabase() {

    /**
     * Demo DAO：用于演示最基础的数据库操作
     *
     * @return DemoDao
     * @author Joker.X
     */
    abstract fun demoDao(): DemoDao

    companion object {
        const val DATABASE_NAME = "app-database"
    }
}
