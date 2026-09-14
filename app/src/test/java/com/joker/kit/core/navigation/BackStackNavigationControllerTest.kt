package com.joker.kit.core.navigation

import androidx.navigation3.runtime.NavBackStack
import androidx.navigation3.runtime.NavKey
import com.joker.kit.feature.insights.navigation.InsightsRoutes
import com.joker.kit.feature.main.GoalsRoutes
import com.joker.kit.feature.main.ProgressRoutes
import com.joker.kit.feature.main.SettingsRoutes
import com.joker.kit.feature.today.navigation.TodayRoutes
import kotlinx.serialization.Serializable
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * [BackStackNavigationController] 单元测试
 *
 * 验证回退栈的核心导航行为：
 * 1. singleTop 去重（防止重复页面堆叠）
 * 2. navigateBack 安全出栈（size > 1 时出栈，size == 1 时安全守护不抛异常）
 * 3. popUpTo（支持 inclusive 与 non-inclusive 弹栈）
 * 4. 底部 Tab 切换模式（popUpTo 到根页面 + singleTop）
 * 5. 快速连续点击防护
 *
 * @author Joker.X
 */
class BackStackNavigationControllerTest {

    @Serializable
    private data object TestUnknownRoute : NavKey

    private lateinit var backStack: NavBackStack<NavKey>
    private lateinit var controller: NavigationController

    @Before
    fun setUp() {
        backStack = NavBackStack<NavKey>(TodayRoutes.Today)
        controller = createBackStackNavigationController(backStack = backStack)
    }

    @Test
    fun initialStack_containsRootDestination() {
        assertEquals(1, backStack.size)
        assertEquals(TodayRoutes.Today, backStack.lastOrNull())
    }

    @Test
    fun singleTop_preventsDuplicateConsecutiveDestinations_defaultOptions() {
        // 初始栈顶为 Today，再次导航到 Today（默认 launchSingleTop = true）
        controller.navigateTo(TodayRoutes.Today)
        assertEquals("栈中不应压入重复的 Today", 1, backStack.size)
        assertEquals(TodayRoutes.Today, backStack.lastOrNull())

        // 导航到 Insights
        controller.navigateTo(InsightsRoutes.Insights)
        assertEquals(2, backStack.size)
        assertEquals(InsightsRoutes.Insights, backStack.lastOrNull())

        // 再次导航到 Insights（模拟用户重复点击）
        controller.navigateTo(InsightsRoutes.Insights)
        assertEquals("栈顶已是 Insights 时不应重复添加", 2, backStack.size)
        assertEquals(InsightsRoutes.Insights, backStack.lastOrNull())
    }

    @Test
    fun singleTop_disabled_allowsDuplicateConsecutiveDestinations() {
        val nonSingleTopOptions = NavigationOptions(launchSingleTop = false)

        controller.navigateTo(TodayRoutes.Today, nonSingleTopOptions)
        assertEquals(2, backStack.size)

        controller.navigateTo(TodayRoutes.Today, nonSingleTopOptions)
        assertEquals(3, backStack.size)
    }

    @Test
    fun navigateBack_popsTopmostDestinationWhenSizeGreaterThanOne() {
        controller.navigateTo(InsightsRoutes.Insights)
        assertEquals(2, backStack.size)
        assertEquals(InsightsRoutes.Insights, backStack.lastOrNull())

        controller.navigateBack()
        assertEquals(1, backStack.size)
        assertEquals(TodayRoutes.Today, backStack.lastOrNull())
    }

    @Test
    fun navigateBack_safeNoOpWhenSizeIsOne() {
        assertEquals(1, backStack.size)

        // 栈底为 1 时，navigateBack 应该安全拦截，不能清空栈导致 NavDisplay 崩溃
        controller.navigateBack()
        assertEquals("栈底页面不应被弹出", 1, backStack.size)
        assertEquals(TodayRoutes.Today, backStack.lastOrNull())
        assertFalse("返回栈不可为空", backStack.isEmpty())
    }

    @Test
    fun popUpTo_nonInclusive_retainsTargetDestination() {
        controller.navigateTo(GoalsRoutes.Goals)
        controller.navigateTo(ProgressRoutes.Progress)
        assertEquals(3, backStack.size)

        // popUpTo Today, inclusive = false
        controller.navigateTo(
            route = SettingsRoutes.Settings,
            navOptions = NavigationOptions(
                popUpToRoute = TodayRoutes.Today,
                inclusive = false,
                launchSingleTop = true
            )
        )

        // 应弹出 Goals 和 Progress，保留 Today，并压入 Settings
        assertEquals(2, backStack.size)
        assertEquals(TodayRoutes.Today, backStack[0])
        assertEquals(SettingsRoutes.Settings, backStack[1])
    }

    @Test
    fun popUpTo_inclusive_removesTargetDestination() {
        controller.navigateTo(GoalsRoutes.Goals)
        controller.navigateTo(ProgressRoutes.Progress)
        assertEquals(3, backStack.size)

        // popUpTo Goals, inclusive = true
        controller.navigateTo(
            route = SettingsRoutes.Settings,
            navOptions = NavigationOptions(
                popUpToRoute = GoalsRoutes.Goals,
                inclusive = true,
                launchSingleTop = true
            )
        )

        // Goals 和其上的 Progress 均被弹出，保留 Today，压入 Settings
        assertEquals(2, backStack.size)
        assertEquals(TodayRoutes.Today, backStack[0])
        assertEquals(SettingsRoutes.Settings, backStack[1])
    }

    @Test
    fun tabSwitching_safeBottomNavigationPattern() {
        // 模拟底部 4-tab 切换逻辑
        fun switchTab(tabRoute: NavKey) {
            controller.navigateTo(
                route = tabRoute,
                navOptions = NavigationOptions(
                    popUpToRoute = TodayRoutes.Today,
                    inclusive = false,
                    launchSingleTop = true
                )
            )
        }

        // 1. 切换至 Goals
        switchTab(GoalsRoutes.Goals)
        assertEquals(2, backStack.size)
        assertEquals(GoalsRoutes.Goals, backStack.lastOrNull())

        // 2. 重复点击 Goals Tab，不应产生重复页面
        switchTab(GoalsRoutes.Goals)
        assertEquals(2, backStack.size)
        assertEquals(GoalsRoutes.Goals, backStack.lastOrNull())

        // 3. 切换至 Progress，栈应先回退至 Today 再压入 Progress
        switchTab(ProgressRoutes.Progress)
        assertEquals(2, backStack.size)
        assertEquals(ProgressRoutes.Progress, backStack.lastOrNull())
        assertEquals(TodayRoutes.Today, backStack[0])

        // 4. 切换至 Settings
        switchTab(SettingsRoutes.Settings)
        assertEquals(2, backStack.size)
        assertEquals(SettingsRoutes.Settings, backStack.lastOrNull())

        // 5. 切换回 Today，应只弹出 Settings，保留单个 Today
        switchTab(TodayRoutes.Today)
        assertEquals(1, backStack.size)
        assertEquals(TodayRoutes.Today, backStack.lastOrNull())
    }

    @Test
    fun navigateBackTo_routesCorrectly() {
        controller.navigateTo(GoalsRoutes.Goals)
        controller.navigateTo(ProgressRoutes.Progress)
        controller.navigateTo(SettingsRoutes.Settings)
        assertEquals(4, backStack.size)

        // navigateBackTo Goals (non-inclusive)
        controller.navigateBackTo(GoalsRoutes.Goals, inclusive = false)
        assertEquals(2, backStack.size)
        assertEquals(GoalsRoutes.Goals, backStack.lastOrNull())

        // navigateBackTo Goals (inclusive)
        controller.navigateBackTo(GoalsRoutes.Goals, inclusive = true)
        assertEquals(1, backStack.size)
        assertEquals(TodayRoutes.Today, backStack.lastOrNull())
    }

    @Test
    fun popUpTo_withUnknownRoute_doesNotCorruptStack() {
        controller.navigateTo(GoalsRoutes.Goals)
        assertEquals(2, backStack.size)

        // 目标路由不在栈中
        controller.navigateTo(
            route = SettingsRoutes.Settings,
            navOptions = NavigationOptions(
                popUpToRoute = TestUnknownRoute,
                inclusive = false,
                launchSingleTop = true
            )
        )

        // 未知路由不执行 popUpTo，正常追加 Settings
        assertEquals(3, backStack.size)
        assertEquals(SettingsRoutes.Settings, backStack.lastOrNull())
    }

    @Test
    fun rapidConsecutiveClicks_singleTopDeduplication_ensuresResponsiveBack() {
        // 模拟用户在 Today 快速连续点击 10 次 Insights 按钮
        repeat(10) {
            controller.navigateTo(
                route = InsightsRoutes.Insights,
                navOptions = NavigationOptions(launchSingleTop = true)
            )
        }

        // 栈中只应有 [Today, Insights]
        assertEquals(2, backStack.size)
        assertEquals(InsightsRoutes.Insights, backStack.lastOrNull())

        // 用户按一次返回键，即可立即返回 Today
        controller.navigateBack()
        assertEquals(1, backStack.size)
        assertEquals(TodayRoutes.Today, backStack.lastOrNull())
    }
}
