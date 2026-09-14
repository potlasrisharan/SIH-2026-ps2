package com.joker.kit.feature.main

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject

/**
 * 主界面 UI 状态
 *
 * @param selectedTab 当前选中的底部 Tab
 * @author Joker.X
 */
data class MainUiState(
    val selectedTab: MainTab = MainTab.TODAY,
)

/**
 * 主界面与底部导航 ViewModel
 *
 * 管理底部 Tab 切换及状态流。
 *
 * @author Joker.X
 */
@HiltViewModel
class MainViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(MainUiState())

    /**
     * 主界面可观察状态流
     */
    val uiState: StateFlow<MainUiState> = _uiState.asStateFlow()

    /**
     * 切换底部 Tab
     *
     * @param tab 目标 Tab
     */
    fun selectTab(tab: MainTab) {
        _uiState.value = _uiState.value.copy(selectedTab = tab)
    }
}
