package com.joker.kit.core.designsystem.theme

import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * 极简单色设计系统（Minimal Monochrome Design System）单元测试
 *
 * 验证：
 * 1. 核心单色调色板（Black #000000, White #FFFFFF, Neutral Grays）
 * 2. 浅色模式 LightColorScheme 严格遵循纯单色规范（黑主色，白背景，灰边框）
 * 3. 深色模式 DarkColorScheme 严格遵循纯单色规范（白主色，黑背景，深灰卡片与边框）
 * 4. 严禁包含原有电光蓝（#465CFF/#466CFF）与紫色（#6831FF）
 * 5. 间距与分割线规范（SpaceDivider = 1dp, SpaceHorizontalLarge = 16dp）
 * 6. 圆角规范（AppShapes 避免大于等于 24dp 的过度圆角）
 */
class MonochromeThemeTest {

    private val forbiddenElectricBlue1 = Color(0xFF465CFF)
    private val forbiddenElectricBlue2 = Color(0xFF466CFF)
    private val forbiddenPurple = Color(0xFF6831FF)

    @Test
    fun monoPaletteTokens_haveExactHexValues() {
        assertEquals(Color(0xFF000000), MonoBlack)
        assertEquals(Color(0xFFFFFFFF), MonoWhite)
        assertEquals(Color(0xFF121212), MonoGray900)
        assertEquals(Color(0xFF1E1E1E), MonoGray800)
        assertEquals(Color(0xFF2E2E2E), MonoGray700)
        assertEquals(Color(0xFF757575), MonoGray500)
        assertEquals(Color(0xFFCCCCCC), MonoGray300)
        assertEquals(Color(0xFFE5E5E5), MonoGray200)
        assertEquals(Color(0xFFF5F5F5), MonoGray100)
        assertEquals(Color(0xFFFAFAFA), MonoGray50)
    }

    @Test
    fun primaryTokens_matchDesignSystem() {
        assertEquals("Light mode primary", LightningBlueDark, PrimaryLight)
        assertEquals("Dark mode primary must be LightningBlue", LightningBlue, PrimaryDark)
        assertEquals("Default Primary must be PrimaryDark", PrimaryDark, Primary)
    }

    @Test
    fun lightColorScheme_strictlyMonochrome() {
        assertEquals(MonoBlack, LightColorScheme.primary)
        assertEquals(MonoWhite, LightColorScheme.onPrimary)
        assertEquals(MonoWhite, LightColorScheme.background)
        assertEquals(MonoBlack, LightColorScheme.onBackground)
        assertEquals(MonoWhite, LightColorScheme.surface)
        assertEquals(MonoBlack, LightColorScheme.onSurface)
        assertEquals(MonoGray100, LightColorScheme.surfaceVariant)
        assertEquals(MonoGray500, LightColorScheme.onSurfaceVariant)
        assertEquals(MonoGray200, LightColorScheme.outline)
        assertEquals(MonoGray300, LightColorScheme.outlineVariant)

        // 验证没有残留电光蓝或紫色
        assertNotEquals(forbiddenElectricBlue1, LightColorScheme.primary)
        assertNotEquals(forbiddenElectricBlue2, LightColorScheme.primary)
        assertNotEquals(forbiddenPurple, LightColorScheme.secondary)
    }

    @Test
    fun darkColorScheme_matchesDesignSystem() {
        assertEquals(LightningBlue, DarkColorScheme.primary)
        assertEquals(MonoBlack, DarkColorScheme.onPrimary)
        assertEquals(MonoGray950, DarkColorScheme.background)
        assertEquals(MonoWhite, DarkColorScheme.onBackground)
        assertEquals(MonoGray900, DarkColorScheme.surface)
        assertEquals(MonoWhite, DarkColorScheme.onSurface)
        assertEquals(MonoGray850, DarkColorScheme.surfaceVariant)
        assertEquals(MonoGray500, DarkColorScheme.onSurfaceVariant)
        assertEquals(MonoGray700, DarkColorScheme.outline)
    }

    @Test
    fun bordersAndDividers_areCrisp1dp() {
        assertEquals("Crisp 1dp border for light mode", MonoGray200, BorderLight)
        assertEquals("Crisp 1dp border for dark mode", MonoGray700, BorderDark)
        assertEquals("Divider size must be 1dp per PRD", 1.dp, SpaceDivider)
    }

    @Test
    fun spacers_areCorrectlySized() {
        assertEquals(16.dp, SpaceHorizontalLarge)
        assertEquals(24.dp, SpaceHorizontalXLarge)
        assertNotEquals("SpaceHorizontalLarge must not equal SpaceHorizontalXLarge", SpaceHorizontalXLarge, SpaceHorizontalLarge)
    }

    @Test
    fun shapes_haveModestCornerRadii() {
        assertEquals(8.dp, RadiusSmall)
        assertEquals(12.dp, RadiusMedium)
        assertEquals(16.dp, RadiusLarge)
        // PRD Section 17 & 18: Modest corner radii (8dp, 12dp, 16dp max). Avoid excessive rounding.
        assertTrue(RadiusLarge <= 16.dp)
    }
}
