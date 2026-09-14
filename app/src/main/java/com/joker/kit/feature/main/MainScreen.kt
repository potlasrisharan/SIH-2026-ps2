package com.joker.kit.feature.main

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle

/**
 * 主页面路由层（Route）
 *
 * 负责收集 ViewModel 状态并分发底部导航事件。
 *
 * @param onTabSelected Tab 切换回调
 * @param viewModel 主页面 ViewModel
 * @author Joker.X
 */
@Composable
fun MainRoute(
    onTabSelected: (MainTab) -> Unit,
    viewModel: MainViewModel = hiltViewModel(),
) {
    // 收集主页面当前选中的 Tab 状态
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    MainScreen(
        selectedTab = uiState.selectedTab,
        onTabSelected = { tab ->
            viewModel.selectTab(tab)
            onTabSelected(tab)
        }
    )
}

/**
 * 主页面骨架层（Screen）
 *
 * 顶级容器页面，负责组合主内容与底部导航栏。
 *
 * @param selectedTab 当前选中的 Tab
 * @param onTabSelected Tab 点击回调
 * @param modifier 修饰符
 * @param content 主页面内容区 Composable
 * @author Joker.X
 */
@Composable
fun MainScreen(
    selectedTab: MainTab,
    onTabSelected: (MainTab) -> Unit,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit = {},
) {
    MainContent(
        selectedTab = selectedTab,
        onTabSelected = onTabSelected,
        modifier = modifier,
        content = content,
    )
}

/**
 * 主页面内容与布局层（Content）
 *
 * @param selectedTab 当前选中的 Tab
 * @param onTabSelected Tab 点击回调
 * @param modifier 修饰符
 * @param content 内容区
 * @author Joker.X
 */
@Composable
fun MainContent(
    selectedTab: MainTab,
    onTabSelected: (MainTab) -> Unit,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit = {},
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
    ) {
        Box(
            modifier = Modifier
                .weight(1f)
                .fillMaxWidth()
        ) {
            content()
        }
        MainNavigationBar(
            selectedTab = selectedTab,
            onTabSelected = onTabSelected,
        )
    }
}

/**
 * 极简单色底部导航栏组件
 *
 * 严格遵循 Master PRD 极简单色规范：
 * - 顶部 1dp outline 分割线
 * - surface 背景与零多余投影
 * - 选中项使用 primary，未选中项使用 onSurfaceVariant
 * - 规范触控区域与沉浸式导航栏适配
 *
 * @param selectedTab 当前选中的 Tab
 * @param onTabSelected Tab 点击回调
 * @param modifier 修饰符
 * @author Joker.X
 */
@Composable
fun MainNavigationBar(
    selectedTab: MainTab,
    onTabSelected: (MainTab) -> Unit,
    modifier: Modifier = Modifier,
) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .background(MaterialTheme.colorScheme.surface)
            .navigationBarsPadding()
    ) {
        // 顶部 1dp 单色边框分割线
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(1.dp)
                .background(MaterialTheme.colorScheme.outline)
        )

        Row(
            modifier = Modifier
                .fillMaxWidth()
                .height(56.dp)
                .padding(horizontal = 4.dp, vertical = 4.dp),
            horizontalArrangement = Arrangement.SpaceAround,
            verticalAlignment = Alignment.CenterVertically,
        ) {
            MainTab.entries.forEach { tab ->
                val isSelected = tab == selectedTab
                val isHeroTab = tab == MainTab.INSIGHTS
                val iconColor = when {
                    isSelected -> MaterialTheme.colorScheme.primary
                    isHeroTab -> MaterialTheme.colorScheme.primary
                    else -> MaterialTheme.colorScheme.onSurfaceVariant
                }
                val textColor = if (isSelected) {
                    MaterialTheme.colorScheme.primary
                } else {
                    MaterialTheme.colorScheme.onSurfaceVariant
                }
                val interactionSource = remember { MutableInteractionSource() }

                Box(
                    modifier = Modifier
                        .weight(1f)
                        .height(48.dp)
                        .padding(horizontal = 4.dp)
                        .then(
                            if (isSelected) {
                                Modifier.background(
                                    MaterialTheme.colorScheme.primaryContainer,
                                    RoundedCornerShape(8.dp)
                                )
                            } else {
                                Modifier
                            }
                        )
                        .clickable(
                            interactionSource = interactionSource,
                            indication = null,
                            onClick = { onTabSelected(tab) }
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center,
                    ) {
                        if (tab.iconRes != null) {
                            Icon(
                                painter = painterResource(id = tab.iconRes),
                                contentDescription = tab.title,
                                modifier = Modifier.size(20.dp),
                                tint = iconColor,
                            )
                        } else {
                            InsightsBarIcon(
                                tint = iconColor,
                                modifier = Modifier.size(20.dp),
                            )
                        }
                        Spacer(modifier = Modifier.height(2.dp))
                        Text(
                            text = tab.title,
                            color = textColor,
                            fontSize = 10.sp,
                            fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Medium,
                            letterSpacing = 0.5.sp
                        )
                    }
                }
            }
        }
    }
}

/**
 * 洞察分析 3 柱状图表图标组件
 */
@Composable
fun InsightsBarIcon(
    tint: Color,
    modifier: Modifier = Modifier,
) {
    Canvas(modifier = modifier.size(20.dp)) {
        val w = size.width
        val h = size.height
        val barWidth = w * 0.22f
        val corner = CornerRadius(2.dp.toPx(), 2.dp.toPx())

        // Bar 1 (Left - 48% height)
        drawRoundRect(
            color = tint,
            topLeft = Offset(x = w * 0.08f, y = h * 0.52f),
            size = Size(barWidth, h * 0.48f),
            cornerRadius = corner,
        )
        // Bar 2 (Middle - 72% height)
        drawRoundRect(
            color = tint,
            topLeft = Offset(x = w * 0.39f, y = h * 0.28f),
            size = Size(barWidth, h * 0.72f),
            cornerRadius = corner,
        )
        // Bar 3 (Right - 95% height)
        drawRoundRect(
            color = tint,
            topLeft = Offset(x = w * 0.70f, y = h * 0.05f),
            size = Size(barWidth, h * 0.95f),
            cornerRadius = corner,
        )
    }
}

/**
 * 占位 Tab 页面组件
 *
 * 用于尚未进入具体里程碑实现的 Tab 模块。
 *
 * @param title 页面标题
 * @param description 页面描述
 * @param modifier 修饰符
 * @author Joker.X
 */
@Composable
fun TabPlaceholderScreen(
    title: String,
    description: String,
    modifier: Modifier = Modifier,
) {
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
            .padding(24.dp),
        contentAlignment = Alignment.Center,
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.headlineMedium,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onBackground,
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = description,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
        }
    }
}
