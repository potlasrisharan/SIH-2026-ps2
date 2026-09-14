package com.joker.kit.core.designsystem.theme

import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.material3.dynamicLightColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalContext

/**
 * 深色主题配色方案
 * 定义MaterialTheme中极简单色深色模式下的各种语义颜色
 */
val DarkColorScheme = darkColorScheme(
    primary = LightningBlue,
    onPrimary = MonoBlack,
    primaryContainer = LightningBlueContainer,
    onPrimaryContainer = LightningBlue,
    inversePrimary = MonoBlack,
    secondary = LightningBlueMuted,
    onSecondary = MonoBlack,
    secondaryContainer = MonoGray800,
    onSecondaryContainer = MonoWhite,
    tertiary = MonoGray300,
    onTertiary = MonoBlack,
    tertiaryContainer = MonoGray800,
    onTertiaryContainer = MonoWhite,
    background = MonoGray950,
    onBackground = MonoWhite,
    surface = MonoGray900,
    onSurface = MonoWhite,
    surfaceVariant = MonoGray850,
    onSurfaceVariant = MonoGray500,
    surfaceTint = LightningBlue,
    inverseSurface = MonoWhite,
    inverseOnSurface = MonoBlack,
    error = ColorDangerDark,
    onError = MonoBlack,
    errorContainer = MonoGray800,
    onErrorContainer = ColorDangerDark,
    outline = MonoGray700,
    outlineVariant = MonoGray800,
    scrim = MaskDark,
    surfaceBright = MonoGray800,
    surfaceContainer = MonoGray900,
    surfaceContainerHigh = MonoGray800,
    surfaceContainerHighest = MonoGray700,
    surfaceContainerLow = MonoGray900,
    surfaceContainerLowest = MonoBlack,
    surfaceDim = MonoBlack,
    primaryFixed = MonoWhite,
    primaryFixedDim = MonoWhite,
    onPrimaryFixed = MonoBlack,
    onPrimaryFixedVariant = MonoBlack,
    secondaryFixed = MonoGray300,
    secondaryFixedDim = MonoGray300,
    onSecondaryFixed = MonoBlack,
    onSecondaryFixedVariant = MonoBlack,
    tertiaryFixed = MonoGray500,
    tertiaryFixedDim = MonoGray500,
    onTertiaryFixed = MonoBlack,
    onTertiaryFixedVariant = MonoBlack
)

/**
 * 浅色主题配色方案
 * 定义MaterialTheme中极简单色浅色模式下的各种语义颜色
 */
val LightColorScheme = lightColorScheme(
    primary = MonoBlack,
    onPrimary = MonoWhite,
    primaryContainer = MonoGray100,
    onPrimaryContainer = MonoBlack,
    inversePrimary = MonoWhite,
    secondary = MonoGray800,
    onSecondary = MonoWhite,
    secondaryContainer = MonoGray100,
    onSecondaryContainer = MonoBlack,
    tertiary = MonoGray700,
    onTertiary = MonoWhite,
    tertiaryContainer = MonoGray100,
    onTertiaryContainer = MonoBlack,
    background = MonoWhite,
    onBackground = MonoBlack,
    surface = MonoWhite,
    onSurface = MonoBlack,
    surfaceVariant = MonoGray100,
    onSurfaceVariant = MonoGray500,
    surfaceTint = MonoBlack,
    inverseSurface = MonoGray900,
    inverseOnSurface = MonoWhite,
    error = ColorDanger,
    onError = MonoWhite,
    errorContainer = MonoGray100,
    onErrorContainer = ColorDanger,
    outline = MonoGray200,
    outlineVariant = MonoGray300,
    scrim = MaskLight,
    surfaceBright = MonoWhite,
    surfaceContainer = MonoWhite,
    surfaceContainerHigh = MonoGray50,
    surfaceContainerHighest = MonoGray100,
    surfaceContainerLow = MonoWhite,
    surfaceContainerLowest = MonoWhite,
    surfaceDim = MonoGray100,
    primaryFixed = MonoBlack,
    primaryFixedDim = MonoBlack,
    onPrimaryFixed = MonoWhite,
    onPrimaryFixedVariant = MonoWhite,
    secondaryFixed = MonoGray800,
    secondaryFixedDim = MonoGray800,
    onSecondaryFixed = MonoWhite,
    onSecondaryFixedVariant = MonoWhite,
    tertiaryFixed = MonoGray700,
    tertiaryFixedDim = MonoGray700,
    onTertiaryFixed = MonoWhite,
    onTertiaryFixedVariant = MonoWhite
)

/**
 * 应用主题 Composable 函数
 * 根据系统设置决定使用深色或浅色主题，并应用所有设计系统元素
 *
 * @param darkTheme 是否使用深色主题，默认跟随系统设置
 * @param dynamicColor 是否使用动态颜色（Android 12+特性），默认关闭保持纯单色系统
 * @param content 需要应用主题的内容
 * @author Joker.X
 */
@Composable
fun AppTheme(
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false,
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }

        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = Typography,
        shapes = AppShapes,
        content = content
    )
}