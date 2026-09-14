package com.joker.kit.core.ui.component.appbar

import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import com.joker.kit.R

/**
 * 回退按钮组件
 *
 * @param modifier 修饰符，用于自定义组件样式
 * @param tint 图标颜色，默认使用 MaterialTheme.colorScheme.onSurface
 * @param onClick 点击回调函数
 * @author Joker.X
 */
@Composable
fun BackButton(
    modifier: Modifier = Modifier,
    tint: Color = MaterialTheme.colorScheme.onSurface,
    onClick: () -> Unit = {}
) {
    IconButton(modifier = modifier, onClick = onClick) {
        Icon(
            painter = painterResource(id = R.drawable.ic_left),
            contentDescription = "Back",
            tint = tint
        )
    }
}
