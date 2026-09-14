package com.joker.kit.feature.settings

import androidx.navigation3.runtime.EntryProviderScope
import androidx.navigation3.runtime.NavKey
import com.joker.kit.feature.main.SettingsRoutes

fun EntryProviderScope<NavKey>.settingsGraph() {
    entry<SettingsRoutes.Settings> {
        SettingsScreen()
    }
}
