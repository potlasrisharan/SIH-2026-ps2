package com.joker.kit.feature.today.navigation

import androidx.navigation3.runtime.NavKey
import kotlinx.serialization.Serializable

object TodayRoutes {
    @Serializable
    data object Today : NavKey
}
