package com.joker.kit.feature.main

import androidx.annotation.DrawableRes
import androidx.navigation3.runtime.NavKey
import com.joker.kit.R
import com.joker.kit.feature.goals.GoalNavRoutes
import com.joker.kit.feature.insights.navigation.InsightsRoutes
import com.joker.kit.feature.today.navigation.TodayRoutes
import kotlinx.serialization.Serializable

/**
 * 主页面路由定义
 *
 * @author Joker.X
 */
object MainRoutes {
    @Serializable
    data object Main : NavKey
}

/**
 * 目标模块路由（占位）
 *
 * @author Joker.X
 */
object GoalsRoutes {
    @Serializable
    data object Goals : NavKey
}

/**
 * 进度模块路由（占位）
 *
 * @author Joker.X
 */
object ProgressRoutes {
    @Serializable
    data object Progress : NavKey
}

/**
 * 设置模块路由（占位）
 *
 * @author Joker.X
 */
object SettingsRoutes {
    @Serializable
    data object Settings : NavKey
}

/**
 * 底部导航栏 Tab 选项枚举
 *
 * @param title Tab 显示标题
 * @param route 对应的导航路由 NavKey
 * @param iconRes Tab 矢量图标资源 ID
 * @author Joker.X
 */
enum class MainTab(
    val title: String,
    val route: NavKey,
    @DrawableRes val iconRes: Int? = null,
) {
    TODAY("Today", TodayRoutes.Today, R.drawable.ic_tabbar_route),
    GOALS("Goals", GoalNavRoutes.GoalsList, R.drawable.ic_tabbar_hardware),
    INSIGHTS("Insights", InsightsRoutes.Insights, null),
    PROGRESS("Progress", ProgressRoutes.Progress, R.drawable.ic_tabbar_expand),
    SETTINGS("Settings", SettingsRoutes.Settings, R.drawable.ic_tabbar_team);

    companion object {
        /**
         * 根据当前路由匹配对应的底部 Tab
         *
         * @param route 当前路由
         * @return 匹配的 Tab，若未找到则返回 null
         */
        fun fromRoute(route: NavKey?): MainTab? {
            return entries.firstOrNull { it.route == route }
        }

        /**
         * 判断当前路由是否属于主底部导航 Tab
         *
         * @param route 待判断路由
         * @return 是否为主 Tab
         */
        fun isMainTabRoute(route: NavKey?): Boolean {
            return fromRoute(route) != null
        }
    }
}
