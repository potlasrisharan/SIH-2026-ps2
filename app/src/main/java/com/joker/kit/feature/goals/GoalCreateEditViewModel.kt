package com.joker.kit.feature.goals

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.domain.repository.GoalRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

data class GoalCreateEditUiState(
    val title: String = "",
    val why: String = "",
    val vision: String = "",
    val isSaving: Boolean = false,
    val saved: Boolean = false
)

@HiltViewModel
class GoalCreateEditViewModel @Inject constructor(
    private val goalRepository: GoalRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(GoalCreateEditUiState())
    val uiState: StateFlow<GoalCreateEditUiState> = _uiState

    fun setTitle(v: String) { _uiState.value = _uiState.value.copy(title = v) }
    fun setWhy(v: String) { _uiState.value = _uiState.value.copy(why = v) }
    fun setVision(v: String) { _uiState.value = _uiState.value.copy(vision = v) }

    fun save() {
        val state = _uiState.value
        if (state.title.isBlank()) return
        _uiState.value = state.copy(isSaving = true)
        viewModelScope.launch {
            goalRepository.insertGoal(
                GoalEntity(
                    title = state.title.trim(),
                    why = state.why.trim(),
                    vision = state.vision.trim().takeIf { it.isNotBlank() },
                    futureSelf = null,
                    targetDate = null,
                    isPrimary = false
                )
            )
            _uiState.value = _uiState.value.copy(isSaving = false, saved = true)
        }
    }
}
