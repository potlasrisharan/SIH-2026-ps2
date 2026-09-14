package com.joker.kit.feature.today.view

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import com.joker.kit.data.local.entity.GoalEntity
import com.joker.kit.data.local.entity.TaskEntity
import java.time.Instant
import java.time.LocalDate
import java.time.LocalTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import java.util.Calendar

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AppleRemindersTaskSheet(
    initialTask: TaskEntity? = null,
    availableGoals: List<GoalEntity> = emptyList(),
    defaultGoalId: Long? = null,
    onDismiss: () -> Unit,
    onSaveTask: (
        title: String,
        description: String?,
        goalId: Long,
        priority: Int,
        dueDate: Long?,
        repeatRule: String
    ) -> Unit,
    onDeleteTask: ((TaskEntity) -> Unit)? = null
) {
    val sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)

    var title by remember { mutableStateOf(initialTask?.title ?: "") }
    var notes by remember { mutableStateOf(initialTask?.description ?: "") }
    var selectedGoalId by remember {
        mutableStateOf(
            initialTask?.goalId
                ?: defaultGoalId
                ?: availableGoals.firstOrNull { it.isPrimary }?.id
                ?: availableGoals.firstOrNull()?.id
                ?: 0L
        )
    }
    var priority by remember { mutableStateOf(initialTask?.priority ?: 0) }
    var repeatRule by remember { mutableStateOf(initialTask?.repeatRule ?: "NONE") }

    val zone = ZoneId.systemDefault()
    val today = LocalDate.now(zone)
    val now = LocalTime.now(zone)
    val defaultUpcomingTime = if (now.hour < 23) now.plusHours(1).withMinute(0) else LocalTime.of(23, 59)

    // Date & Time states
    var hasDate by remember { mutableStateOf(initialTask?.dueDate != null) }
    var selectedDate by remember {
        val initialEpoch = initialTask?.dueDate
        if (initialEpoch != null) {
            mutableStateOf(Instant.ofEpochMilli(initialEpoch).atZone(zone).toLocalDate())
        } else {
            mutableStateOf(today)
        }
    }

    var hasTime by remember {
        val initialEpoch = initialTask?.dueDate
        if (initialEpoch != null) {
            val zdt = Instant.ofEpochMilli(initialEpoch).atZone(zone)
            mutableStateOf(zdt.hour != 0 || zdt.minute != 0)
        } else {
            mutableStateOf(false)
        }
    }
    var selectedTime by remember {
        val initialEpoch = initialTask?.dueDate
        if (initialEpoch != null) {
            val zdt = Instant.ofEpochMilli(initialEpoch).atZone(zone)
            mutableStateOf(zdt.toLocalTime())
        } else {
            mutableStateOf(defaultUpcomingTime)
        }
    }

    // Dialog pickers
    var showDatePickerDialog by remember { mutableStateOf(false) }
    var showTimePickerDialog by remember { mutableStateOf(false) }

    val dateFormatter = remember { DateTimeFormatter.ofPattern("EEE, d MMM yyyy") }
    val timeFormatter = remember { DateTimeFormatter.ofPattern("h:mm a") }

    val isDark = isSystemInDarkTheme()
    val appleSwitchColors = SwitchDefaults.colors(
        checkedThumbColor = Color.White,
        checkedTrackColor = MaterialTheme.colorScheme.primary,
        checkedBorderColor = Color.Transparent,
        uncheckedThumbColor = Color(0xFF121214),
        uncheckedTrackColor = Color(0xFF333338),
        uncheckedBorderColor = Color(0xFF444448)
    )

    val computedDueDate = if (hasDate) {
        val time = if (hasTime) selectedTime else LocalTime.of(23, 59, 59)
        selectedDate.atTime(time).atZone(zone).toInstant().toEpochMilli()
    } else {
        null
    }
    val currentEpoch = System.currentTimeMillis()
    val isDueDateInPast = hasDate && computedDueDate != null && computedDueDate < currentEpoch &&
        (initialTask == null || computedDueDate != initialTask.dueDate)

    val canSave = title.isNotBlank() && !isDueDateInPast

    ModalBottomSheet(
        onDismissRequest = onDismiss,
        sheetState = sheetState,
        containerColor = MaterialTheme.colorScheme.surface,
        dragHandle = {
            Surface(
                modifier = Modifier.padding(vertical = 10.dp),
                color = MaterialTheme.colorScheme.outline,
                shape = RoundedCornerShape(2.dp)
            ) {
                Box(modifier = Modifier.size(width = 36.dp, height = 4.dp))
            }
        }
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp)
                .padding(bottom = 36.dp)
                .verticalScroll(rememberScrollState())
        ) {
            // Top Action Bar: Cancel, Title, Add/Done
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                TextButton(onClick = onDismiss) {
                    Text("Cancel", color = MaterialTheme.colorScheme.onSurfaceVariant, fontSize = 15.sp)
                }

                Text(
                    text = if (initialTask == null) "New Task" else "Task Details",
                    fontWeight = FontWeight.Bold,
                    fontSize = 17.sp,
                    color = MaterialTheme.colorScheme.onBackground
                )

                Button(
                    onClick = {
                        if (canSave) {
                            onSaveTask(
                                title.trim(),
                                notes.trim().ifEmpty { null },
                                selectedGoalId,
                                priority,
                                computedDueDate,
                                repeatRule
                            )
                            onDismiss()
                        }
                    },
                    enabled = canSave,
                    shape = RoundedCornerShape(8.dp),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MaterialTheme.colorScheme.primary,
                        contentColor = MaterialTheme.colorScheme.onPrimary,
                        disabledContainerColor = MaterialTheme.colorScheme.surfaceVariant,
                        disabledContentColor = MaterialTheme.colorScheme.onSurfaceVariant
                    ),
                    contentPadding = PaddingValues(horizontal = 16.dp, vertical = 6.dp)
                ) {
                    Text(
                        text = if (initialTask == null) "Add" else "Done",
                        fontWeight = FontWeight.Bold,
                        fontSize = 14.sp
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Card 1: Title & Notes (Grouped Container)
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    TextField(
                        value = title,
                        onValueChange = { title = it },
                        placeholder = { Text("Title", color = MaterialTheme.colorScheme.onSurfaceVariant, fontSize = 17.sp) },
                        singleLine = true,
                        colors = TextFieldDefaults.colors(
                            focusedContainerColor = Color.Transparent,
                            unfocusedContainerColor = Color.Transparent,
                            focusedIndicatorColor = Color.Transparent,
                            unfocusedIndicatorColor = Color.Transparent,
                            focusedTextColor = MaterialTheme.colorScheme.onBackground,
                            unfocusedTextColor = MaterialTheme.colorScheme.onBackground
                        ),
                        modifier = Modifier.fillMaxWidth()
                    )

                    HorizontalDivider(
                        modifier = Modifier.padding(vertical = 4.dp),
                        color = MaterialTheme.colorScheme.outline.copy(alpha = 0.5f)
                    )

                    TextField(
                        value = notes,
                        onValueChange = { notes = it },
                        placeholder = { Text("Notes", color = MaterialTheme.colorScheme.onSurfaceVariant, fontSize = 14.sp) },
                        minLines = 2,
                        maxLines = 5,
                        colors = TextFieldDefaults.colors(
                            focusedContainerColor = Color.Transparent,
                            unfocusedContainerColor = Color.Transparent,
                            focusedIndicatorColor = Color.Transparent,
                            unfocusedIndicatorColor = Color.Transparent,
                            focusedTextColor = MaterialTheme.colorScheme.onBackground,
                            unfocusedTextColor = MaterialTheme.colorScheme.onBackground
                        ),
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Card 2: Date & Time
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    // Date Toggle Row
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text(
                                text = "Date",
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 15.sp,
                                color = MaterialTheme.colorScheme.onBackground
                            )
                            if (hasDate) {
                                Text(
                                    text = selectedDate.format(dateFormatter),
                                    fontSize = 12.sp,
                                    color = MaterialTheme.colorScheme.primary
                                )
                            }
                        }
                        Switch(
                            checked = hasDate,
                            onCheckedChange = {
                                hasDate = it
                                if (it && selectedDate.isBefore(today)) {
                                    selectedDate = today
                                }
                            },
                            colors = appleSwitchColors
                        )
                    }

                    if (hasDate) {
                        Spacer(modifier = Modifier.height(12.dp))
                        // Quick Date Chips
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            val tomorrow = today.plusDays(1)
                            val weekend = today.plusDays((6 - today.dayOfWeek.value.toLong()).coerceAtLeast(1))

                            QuickChip(
                                label = "Today",
                                isSelected = selectedDate == today,
                                onClick = {
                                    selectedDate = today
                                    val currentTime = LocalTime.now(zone)
                                    if (hasTime && selectedTime.isBefore(currentTime)) {
                                        selectedTime = if (currentTime.hour < 23) currentTime.plusHours(1).withMinute(0) else LocalTime.of(23, 59)
                                    }
                                }
                            )
                            QuickChip(
                                label = "Tomorrow",
                                isSelected = selectedDate == tomorrow,
                                onClick = { selectedDate = tomorrow }
                            )
                            QuickChip(
                                label = "Weekend",
                                isSelected = selectedDate == weekend,
                                onClick = { selectedDate = weekend }
                            )
                            QuickChip(
                                label = "Custom...",
                                isSelected = selectedDate != today && selectedDate != tomorrow && selectedDate != weekend,
                                onClick = { showDatePickerDialog = true }
                            )
                        }
                    }

                    HorizontalDivider(
                        modifier = Modifier.padding(vertical = 12.dp),
                        color = MaterialTheme.colorScheme.outline.copy(alpha = 0.5f)
                    )

                    // Time Toggle Row
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text(
                                text = "Time",
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 15.sp,
                                color = MaterialTheme.colorScheme.onBackground
                            )
                            if (hasTime) {
                                Text(
                                    text = selectedTime.format(timeFormatter),
                                    fontSize = 12.sp,
                                    color = MaterialTheme.colorScheme.primary,
                                    modifier = Modifier.clickable { showTimePickerDialog = true }
                                )
                            }
                        }
                        Switch(
                            checked = hasTime,
                            onCheckedChange = {
                                hasTime = it
                                if (it) {
                                    if (!hasDate) hasDate = true
                                    val currentTime = LocalTime.now(zone)
                                    if (selectedDate == today && selectedTime.isBefore(currentTime)) {
                                        selectedTime = if (currentTime.hour < 23) currentTime.plusHours(1).withMinute(0) else LocalTime.of(23, 59)
                                    }
                                    showTimePickerDialog = true
                                }
                            },
                            colors = appleSwitchColors
                        )
                    }
                }
            }

            if (isDueDateInPast) {
                Spacer(modifier = Modifier.height(6.dp))
                Text(
                    text = "Due date and time cannot be in the past",
                    color = MaterialTheme.colorScheme.error,
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.padding(horizontal = 4.dp)
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Card 3: Repeat / Recurrence
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = "REPEAT",
                        fontWeight = FontWeight.Bold,
                        fontSize = 11.sp,
                        letterSpacing = 1.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.height(10.dp))

                    val repeatOptions = listOf(
                        "NONE" to "Never",
                        "DAILY" to "Daily",
                        "WEEKDAYS" to "Weekdays",
                        "WEEKENDS" to "Weekends",
                        "WEEKLY" to "Weekly",
                        "MONTHLY" to "Monthly"
                    )

                    LazyRow(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        items(repeatOptions) { (rule, label) ->
                            val isSelected = repeatRule == rule
                            Surface(
                                modifier = Modifier.clickable { repeatRule = rule },
                                shape = RoundedCornerShape(8.dp),
                                color = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface,
                                border = BorderStroke(
                                    1.dp,
                                    if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.outline
                                )
                            ) {
                                Text(
                                    text = label,
                                    fontSize = 13.sp,
                                    fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Normal,
                                    color = if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onBackground,
                                    modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp)
                                )
                            }
                        }
                    }
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Card 4: Priority & Goal Assignment
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant),
                border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = "PRIORITY",
                        fontWeight = FontWeight.Bold,
                        fontSize = 11.sp,
                        letterSpacing = 1.sp,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.height(10.dp))

                    val priorities = listOf(
                        0 to "None",
                        1 to "Low (!)",
                        2 to "Medium (!!)",
                        3 to "High (!!!)"
                    )

                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        priorities.forEach { (level, label) ->
                            val isSelected = priority == level
                            val activeColor = when (level) {
                                3 -> Color(0xFFFF5252) // High Red
                                2 -> Color(0xFFFFB74D) // Medium Orange
                                1 -> MaterialTheme.colorScheme.primary
                                else -> MaterialTheme.colorScheme.onSurfaceVariant
                            }

                            Surface(
                                modifier = Modifier
                                    .weight(1f)
                                    .clickable { priority = level },
                                shape = RoundedCornerShape(8.dp),
                                color = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface,
                                border = BorderStroke(
                                    1.dp,
                                    if (isSelected) activeColor else MaterialTheme.colorScheme.outline
                                )
                            ) {
                                Box(
                                    modifier = Modifier.padding(vertical = 10.dp),
                                    contentAlignment = Alignment.Center
                                ) {
                                    Text(
                                        text = label,
                                        fontSize = 12.sp,
                                        fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Normal,
                                        color = if (isSelected) activeColor else MaterialTheme.colorScheme.onBackground
                                    )
                                }
                            }
                        }
                    }

                    if (availableGoals.isNotEmpty()) {
                        HorizontalDivider(
                            modifier = Modifier.padding(vertical = 14.dp),
                            color = MaterialTheme.colorScheme.outline.copy(alpha = 0.5f)
                        )

                        Text(
                            text = "ASSIGN TO GOAL",
                            fontWeight = FontWeight.Bold,
                            fontSize = 11.sp,
                            letterSpacing = 1.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.height(10.dp))

                        LazyRow(
                            horizontalArrangement = Arrangement.spacedBy(8.dp),
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            items(availableGoals) { goal ->
                                val isSelected = selectedGoalId == goal.id
                                Surface(
                                    modifier = Modifier.clickable { selectedGoalId = goal.id },
                                    shape = RoundedCornerShape(8.dp),
                                    color = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface,
                                    border = BorderStroke(
                                        1.dp,
                                        if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.outline
                                    )
                                ) {
                                    Text(
                                        text = goal.title.uppercase(),
                                        fontSize = 12.sp,
                                        fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Medium,
                                        color = if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onBackground,
                                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp)
                                    )
                                }
                            }
                        }
                    }
                }
            }

            // Delete Task Button (if editing)
            if (initialTask != null && onDeleteTask != null) {
                Spacer(modifier = Modifier.height(20.dp))
                OutlinedButton(
                    onClick = {
                        onDeleteTask(initialTask)
                        onDismiss()
                    },
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(8.dp),
                    colors = ButtonDefaults.outlinedButtonColors(
                        contentColor = Color(0xFFFF5252)
                    ),
                    border = BorderStroke(1.dp, Color(0xFFFF5252).copy(alpha = 0.5f))
                ) {
                    Text("Delete Task", fontWeight = FontWeight.SemiBold)
                }
            }
        }
    }

    // Material 3 Date Picker Dialog
    if (showDatePickerDialog) {
        val todayUtcMidnightMillis = today
            .atStartOfDay(ZoneId.of("UTC"))
            .toInstant()
            .toEpochMilli()

        val datePickerState = rememberDatePickerState(
            initialSelectedDateMillis = selectedDate.atStartOfDay(ZoneId.of("UTC")).toInstant().toEpochMilli(),
            selectableDates = object : SelectableDates {
                override fun isSelectableDate(utcTimeMillis: Long): Boolean {
                    return utcTimeMillis >= todayUtcMidnightMillis
                }

                override fun isSelectableYear(year: Int): Boolean {
                    return year >= today.year
                }
            }
        )
        DatePickerDialog(
            onDismissRequest = { showDatePickerDialog = false },
            confirmButton = {
                TextButton(
                    onClick = {
                        datePickerState.selectedDateMillis?.let { millis ->
                            val picked = Instant.ofEpochMilli(millis).atZone(ZoneId.of("UTC")).toLocalDate()
                            if (!picked.isBefore(today)) {
                                selectedDate = picked
                                val currentTime = LocalTime.now(zone)
                                if (selectedDate == today && selectedTime.isBefore(currentTime)) {
                                    selectedTime = if (currentTime.hour < 23) currentTime.plusHours(1).withMinute(0) else LocalTime.of(23, 59)
                                }
                            }
                        }
                        showDatePickerDialog = false
                    }
                ) {
                    Text("OK", color = MaterialTheme.colorScheme.primary)
                }
            },
            dismissButton = {
                TextButton(onClick = { showDatePickerDialog = false }) {
                    Text("Cancel")
                }
            }
        ) {
            DatePicker(state = datePickerState)
        }
    }

    // Material 3 Time Picker Dialog
    if (showTimePickerDialog) {
        val timePickerState = rememberTimePickerState(
            initialHour = selectedTime.hour,
            initialMinute = selectedTime.minute,
            is24Hour = false
        )
        val pickedTime = LocalTime.of(timePickerState.hour, timePickerState.minute)
        val isPastTimeToday = selectedDate == today && pickedTime.isBefore(LocalTime.now(zone))

        Dialog(onDismissRequest = { showTimePickerDialog = false }) {
            Surface(
                shape = RoundedCornerShape(16.dp),
                color = MaterialTheme.colorScheme.surface,
                border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline),
                modifier = Modifier.padding(16.dp)
            ) {
                Column(
                    modifier = Modifier.padding(20.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        text = "Select Time",
                        fontWeight = FontWeight.Bold,
                        fontSize = 16.sp,
                        color = MaterialTheme.colorScheme.onBackground
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                    TimePicker(state = timePickerState)

                    if (isPastTimeToday) {
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "Selected time has already passed",
                            color = MaterialTheme.colorScheme.error,
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Medium
                        )
                    }

                    Spacer(modifier = Modifier.height(16.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.End
                    ) {
                        TextButton(onClick = { showTimePickerDialog = false }) {
                            Text("Cancel", color = MaterialTheme.colorScheme.onSurfaceVariant)
                        }
                        Spacer(modifier = Modifier.width(8.dp))
                        Button(
                            onClick = {
                                selectedTime = pickedTime
                                showTimePickerDialog = false
                            },
                            enabled = !isPastTimeToday,
                            colors = ButtonDefaults.buttonColors(
                                containerColor = MaterialTheme.colorScheme.primary,
                                contentColor = MaterialTheme.colorScheme.onPrimary,
                                disabledContainerColor = MaterialTheme.colorScheme.surfaceVariant,
                                disabledContentColor = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        ) {
                            Text("Set Time")
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun QuickChip(
    label: String,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier.clickable { onClick() },
        shape = RoundedCornerShape(8.dp),
        color = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface,
        border = BorderStroke(
            1.dp,
            if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.outline
        )
    ) {
        Text(
            text = label,
            fontSize = 12.sp,
            fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Normal,
            color = if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onBackground,
            modifier = Modifier.padding(horizontal = 10.dp, vertical = 6.dp)
        )
    }
}
