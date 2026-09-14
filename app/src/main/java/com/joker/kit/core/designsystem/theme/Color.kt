package com.joker.kit.core.designsystem.theme

import androidx.compose.ui.graphics.Color

/**
 * 颜色规范
 * 极简单色（Minimal Monochrome）设计系统颜色规范
 * 核心基色：纯黑（#000000）、纯白（#FFFFFF）、中性灰阶
 */

// 极简单色核心调色板
val MonoBlack = Color(0xFF000000)
val MonoWhite = Color(0xFFFFFFFF)
val MonoGray950 = Color(0xFF0A0A0A)
val MonoGray900 = Color(0xFF121212)
val MonoGray850 = Color(0xFF181818)
val MonoGray800 = Color(0xFF1E1E1E)
val MonoGray700 = Color(0xFF2E2E2E)
val MonoGray500 = Color(0xFF757575)
val MonoGray300 = Color(0xFFCCCCCC)
val MonoGray200 = Color(0xFFE5E5E5)
val MonoGray100 = Color(0xFFF5F5F5)
val MonoGray50 = Color(0xFFFAFAFA)

// 闪电蓝强调色（Lightning Blue Accents）
val LightningBlue = Color(0xFF00E5FF)
val LightningBlueMuted = Color(0xFF00B4D8)
val LightningBlueDark = Color(0xFF0091EA)
val LightningBlueGlow = Color(0x3300E5FF)
val LightningBlueContainer = Color(0x1F00E5FF)

/**
 * 品牌主色（普通模式）：闪电蓝暗调
 */
val PrimaryLight = LightningBlueDark

/**
 * 品牌主色（暗黑模式）：闪电蓝
 */
val PrimaryDark = LightningBlue

/**
 * 品牌主色
 */
val Primary = PrimaryDark


// 状态辅助色（纯单色灰度规范）
val ColorDanger = MonoGray800
val ColorDangerDark = MonoGray300
val ColorWarning = MonoGray500
val ColorWarningDark = MonoGray500
val ColorPurple = MonoGray800
val ColorPurpleDark = MonoGray300
val ColorSuccess = MonoBlack
val ColorSuccessDark = MonoWhite

// 字体颜色 - 浅色模式
val TextPrimaryLight = MonoBlack
val TextSecondaryLight = MonoGray800
val TextSubtitleLight = MonoGray500
val TextTertiaryLight = MonoGray500
val TextQuaternaryLight = MonoGray300
val TextWhite = MonoWhite

// 字体颜色 - 深色模式
val TextPrimaryDark = MonoWhite
val TextSecondaryDark = MonoGray300
val TextSubtitleDark = MonoGray500
val TextTertiaryDark = MonoGray500
val TextQuaternaryDark = MonoGray700

// 背景色 - 浅色模式
val BgGreyLight = MonoGray50
val BgWhiteLight = MonoWhite
val BgContentLight = MonoGray100
val BgRedLight = Color(0x0D000000)
val BgYellowLight = Color(0x0D000000)
val BgPurpleLight = Color(0x0D000000)
val BgGreenLight = Color(0x0D000000)

// 背景色 - 深色模式
val BgGreyDark = MonoBlack
val BgWhiteDark = MonoGray900
val BgContentDark = MonoGray800
val BgRedDark = MonoGray900
val BgYellowDark = MonoGray900
val BgPurpleDark = MonoGray900
val BgGreenDark = MonoGray900

// 遮罩与交互状态颜色
val MaskLight = Color(0x99000000)
val MaskDark = Color(0x99000000)
val PressLight = Color(0x1A000000)
val PressDark = Color(0x1AFFFFFF)
val PressLightSoft = Color(0x08000000)
val PressDarkSoft = Color(0x0DFFFFFF)
val ShadowLight = Color(0x0D000000)
val ShadowDark = Color(0x80000000)

// 边框颜色（1dp crisp borders）
val BorderLight = MonoGray200
val BorderDark = MonoGray700

// 单色中性阶梯（替代原彩色渐变）
val GradientPrimaryStart = MonoBlack
val GradientPrimaryEnd = MonoGray800
val GradientRedStart = MonoGray700
val GradientRedEnd = MonoGray900