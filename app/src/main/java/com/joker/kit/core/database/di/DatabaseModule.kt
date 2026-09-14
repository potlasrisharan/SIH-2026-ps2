package com.joker.kit.core.database.di

import android.content.Context
import androidx.room.Room
import com.joker.kit.core.database.AppDatabase
import com.joker.kit.core.database.dao.DemoDao
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * 数据库模块
 * 负责提供数据库实例及相关DAO的依赖注入
 *
 * @author Joker.X
 */
@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {

    /**
     * 提供数据库实例
     *
     * @param context 应用上下文
     * @return 应用数据库实例
     * @author Joker.X
     */
    @Provides
    @Singleton
    fun provideDatabase(
        @ApplicationContext context: Context
    ): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            AppDatabase.DATABASE_NAME
        ).build()
    }

    /**
     * 提供 Demo DAO
     *
     * @param database Room 数据库
     * @return Demo DAO
     * @author Joker.X
     */
    @Provides
    @Singleton
    fun provideDemoDao(database: AppDatabase): DemoDao {
        return database.demoDao()
    }
}
