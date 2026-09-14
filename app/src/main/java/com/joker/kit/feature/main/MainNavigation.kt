package com.joker.kit.feature.main

import androidx.navigation3.runtime.EntryProviderScope
import androidx.navigation3.runtime.NavKey

/**
 * 注册主业务域与各 Tab 占位路由
 *
 * @author Joker.X
 */
fun EntryProviderScope<NavKey>.mainGraph() {
    entry<GoalsRoutes.Goals> {
        TabPlaceholderScreen(
            title = "Goals",
            description = "Track primary goals, vision board, and milestones."
        )
    }
    entry<ProgressRoutes.Progress> {
        TabPlaceholderScreen(
            title = "Progress",
            description = "Streaks, momentum score, and productivity insights."
        )
    }
    entry<SettingsRoutes.Settings> {
        TabPlaceholderScreen(
            title = "Settings",
            description = "Preferences, appearance, notifications, and data backup."
        )
    }
}
