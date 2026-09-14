package com.joker.kit.core.navigation

import android.app.Activity
import androidx.activity.compose.BackHandler
import androidx.compose.animation.ExperimentalSharedTransitionApi
import androidx.compose.animation.SharedTransitionLayout
import androidx.compose.animation.SharedTransitionScope
import androidx.compose.animation.core.FiniteAnimationSpec
import androidx.compose.animation.core.tween
import androidx.compose.animation.slideInHorizontally
import androidx.compose.animation.slideOutHorizontally
import androidx.compose.animation.togetherWith
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.IntOffset
import androidx.lifecycle.viewmodel.navigation3.rememberViewModelStoreNavEntryDecorator
import androidx.navigation3.runtime.NavKey
import androidx.navigation3.runtime.entryProvider
import androidx.navigation3.runtime.rememberNavBackStack
import androidx.navigation3.runtime.rememberSaveableStateHolderNavEntryDecorator
import androidx.navigation3.ui.NavDisplay
import com.joker.kit.feature.goals.GoalNavRoutes
import com.joker.kit.feature.goals.goalsGraph
import com.joker.kit.feature.insights.navigation.InsightsRoutes
import com.joker.kit.feature.insights.navigation.insightsGraph
import com.joker.kit.feature.main.MainNavigationBar
import com.joker.kit.feature.main.MainTab
import com.joker.kit.feature.main.GoalsRoutes
import com.joker.kit.feature.main.mainGraph
import com.joker.kit.feature.progress.progressGraph
import com.joker.kit.feature.settings.settingsGraph
import com.joker.kit.feature.today.navigation.TodayRoutes
import com.joker.kit.feature.today.navigation.todayGraph

/**
 * 页面切换动画时长（毫秒）
 */
private const val NAV_ANIMATION_DURATION = 300

/**
 * 页面切换动画规范
 */
private val NAV_ANIMATION_SPEC: FiniteAnimationSpec<IntOffset> =
    tween(durationMillis = NAV_ANIMATION_DURATION)

/**
 * 应用导航宿主
 *
 * @param navigator 导航管理器
 * @param modifier 修饰符
 * @author Joker.X
 */
@OptIn(ExperimentalSharedTransitionApi::class)
@Composable
fun AppNavHost(
    navigator: AppNavigator,
    modifier: Modifier = Modifier,
) {
    // 创建应用级回退栈，首个页面固定为 Today 主页面。
    val backStack = rememberNavBackStack(TodayRoutes.Today)
    // 基于当前回退栈构建导航控制器，供 AppNavigator 分发命令时使用。
    val navigationController = remember(backStack, navigator) {
        createBackStackNavigationController(backStack, navigator)
    }

    // 栈底根页面拦截返回键，将任务移至后台而不是直接销毁 Activity
    val context = LocalContext.current
    val activity = context as? Activity
    BackHandler(enabled = backStack.size <= 1) {
        activity?.moveTaskToBack(true)
    }

    // 在组合生命周期内绑定/解绑导航控制器，确保导航命令总是指向当前有效宿主。
    DisposableEffect(navigationController) {
        // 绑定到 AppNavigator，接收全局导航命令。
        navigator.attachController(navigationController)
        // 绑定到全局导航服务，支持业务层直接调用 navigate(...)。
        NavigationService.bind(navigator)
        onDispose {
            // 宿主销毁时先解绑导航服务，避免持有失效导航器引用。
            NavigationService.unbind(navigator)
            // 最后从 AppNavigator 注销控制器，防止后续命令误发到旧宿主。
            navigator.detachController(navigationController)
        }
    }

    val currentRoute = backStack.lastOrNull()
    val isMainTab = MainTab.isMainTabRoute(currentRoute)

    Scaffold(
        modifier = modifier.fillMaxSize(),
        bottomBar = {
            if (isMainTab) {
                MainNavigationBar(
                    selectedTab = MainTab.fromRoute(currentRoute) ?: MainTab.TODAY,
                    onTabSelected = { tab ->
                        navigationController.navigateTo(
                            route = tab.route,
                            navOptions = NavigationOptions(
                                popUpToRoute = TodayRoutes.Today,
                                inclusive = false,
                                launchSingleTop = true,
                            )
                        )
                    }
                )
            }
        }
    ) { innerPadding ->
        SharedTransitionLayout {
            NavDisplay(
                backStack = backStack,
                modifier = Modifier.padding(bottom = innerPadding.calculateBottomPadding()),
                onBack = { navigationController.navigateBack() },
                entryDecorators = listOf(
                    rememberSaveableStateHolderNavEntryDecorator(),
                    rememberViewModelStoreNavEntryDecorator(),
                ),
                transitionSpec = { createForwardTransition() },
                popTransitionSpec = { createBackwardTransition() },
                predictivePopTransitionSpec = { createBackwardTransition() },
                entryProvider = appEntryProvider(this@SharedTransitionLayout, navigationController),
            )
        }
    }
}

/**
 * 创建前进导航动画（右入左出）
 *
 * @return 前进导航动画
 * @author Joker.X
 */
private fun createForwardTransition() = slideInHorizontally(
    initialOffsetX = { it },
    animationSpec = NAV_ANIMATION_SPEC,
) togetherWith slideOutHorizontally(
    targetOffsetX = { -it },
    animationSpec = NAV_ANIMATION_SPEC,
)

/**
 * 创建返回导航动画（左入右出）
 *
 * @return 返回导航动画
 * @author Joker.X
 */
private fun createBackwardTransition() = slideInHorizontally(
    initialOffsetX = { -it },
    animationSpec = NAV_ANIMATION_SPEC,
) togetherWith slideOutHorizontally(
    targetOffsetX = { it },
    animationSpec = NAV_ANIMATION_SPEC,
)

/**
 * 构建应用级路由注册器
 *
 * 按模块聚合 graph，所有导航回调均通过 navigationController 统一分发，
 * 彻底消除直接操作底层 backStack 或未受保护的 removeLastOrNull 调用。
 *
 * @param scope 共享元素动画作用域
 * @param navigationController 导航控制器
 * @return 应用级 EntryProvider
 * @author Joker.X
 */
private fun appEntryProvider(
    scope: SharedTransitionScope,
    navigationController: NavigationController,
) = entryProvider<NavKey> {
    todayGraph(
        onNavigateToInsights = {
            navigationController.navigateTo(
                route = InsightsRoutes.Insights,
                navOptions = NavigationOptions(launchSingleTop = true),
            )
        }
    )
    insightsGraph(
        onNavigateBack = {
            navigationController.navigateBack()
        }
    )
    goalsGraph(
        onNavigateToGoalDetail = { goalId ->
            navigationController.navigateTo(
                route = GoalNavRoutes.GoalDetail(goalId),
                navOptions = NavigationOptions(launchSingleTop = true)
            )
        },
        onNavigateToGoalCreate = {
            navigationController.navigateTo(
                route = GoalNavRoutes.GoalCreate,
                navOptions = NavigationOptions(launchSingleTop = true)
            )
        },
        onNavigateBack = { navigationController.navigateBack() }
    )
    progressGraph()
    settingsGraph()
}
