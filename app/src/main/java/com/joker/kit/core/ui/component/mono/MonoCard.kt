package com.joker.kit.core.ui.component.mono

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxScope
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

/**
 * 极简单色卡片组件
 * 采用1dp描边边框，0海拔（无投影），柔和圆角（默认8dp）
 *
 * @param modifier 修饰符
 * @param cornerRadius 圆角大小，默认8dp
 * @param padding 内边距，默认16dp
 * @param content 内容插槽
 */
@Composable
fun MonoCard(
    modifier: Modifier = Modifier,
    cornerRadius: Dp = 8.dp,
    padding: Dp = 16.dp,
    content: @Composable BoxScope.() -> Unit
) {
    val shape = RoundedCornerShape(cornerRadius)
    Box(
        modifier = modifier
            .fillMaxWidth()
            .clip(shape)
            .border(1.dp, MaterialTheme.colorScheme.outline, shape)
            .background(MaterialTheme.colorScheme.surface)
            .padding(padding),
        content = content
    )
}
