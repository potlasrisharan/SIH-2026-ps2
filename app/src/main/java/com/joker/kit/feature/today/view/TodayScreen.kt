package com.joker.kit.feature.today.view

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import com.joker.kit.core.ui.component.mono.MonoCard
import com.joker.kit.core.ui.component.mono.MonoOutlinedButton
import com.joker.kit.core.ui.component.mono.MonoProgressBar
import com.joker.kit.data.local.entity.TaskEntity
import com.joker.kit.feature.today.viewmodel.TodayUiState

@Composable
fun TodayScreen(
    uiState: TodayUiState,
    onNavigateToInsights: () -> Unit,
    onSaveTask: (
        taskId: Long,
        title: String,
        description: String?,
        goalId: Long,
        priority: Int,
        dueDate: Long?,
        repeatRule: String
    ) -> Unit = { _, _, _, _, _, _, _ -> },
    onAddTask: (String) -> Unit = {},
    onToggleTask: (TaskEntity, Boolean) -> Unit = { _, _ -> },
    onDeleteTask: (TaskEntity) -> Unit = {},
    onRefreshQuote: () -> Unit = {},
    onRefreshGreeting: () -> Unit = {}
) {
    var showTaskSheet by remember { mutableStateOf(false) }
    var activeTaskForSheet by remember { mutableStateOf<TaskEntity?>(null) }

    if (showTaskSheet) {
        AppleRemindersTaskSheet(
            initialTask = activeTaskForSheet,
            availableGoals = uiState.availableGoals,
            defaultGoalId = uiState.primaryGoal?.id,
            onDismiss = {
                showTaskSheet = false
                activeTaskForSheet = null
            },
            onSaveTask = { title, description, goalId, priority, dueDate, repeatRule ->
                onSaveTask(
                    activeTaskForSheet?.id ?: 0L,
                    title,
                    description,
                    goalId,
                    priority,
                    dueDate,
                    repeatRule
                )
                showTaskSheet = false
                activeTaskForSheet = null
            },
            onDeleteTask = { task ->
                onDeleteTask(task)
                showTaskSheet = false
                activeTaskForSheet = null
            }
        )
    }

    if (uiState.isLoading) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .windowInsetsPadding(WindowInsets.systemBars),
            contentAlignment = Alignment.Center
        ) {
            CircularProgressIndicator(color = MaterialTheme.colorScheme.primary)
        }
        return
    }

    Scaffold(
        modifier = Modifier.fillMaxSize(),
        containerColor = MaterialTheme.colorScheme.background
    ) { innerPadding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
                .padding(horizontal = 20.dp),
            contentPadding = PaddingValues(top = 16.dp, bottom = 32.dp)
        ) {
            // Header Bar: Date badge, Greeting & Insights Button
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(
                        modifier = Modifier
                            .weight(1f)
                            .clickable { onRefreshGreeting() }
                    ) {
                        Text(
                            text = uiState.currentDate.uppercase(),
                            fontSize = 11.sp,
                            fontWeight = FontWeight.Bold,
                            letterSpacing = 1.5.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.height(2.dp))
                        Text(
                            text = uiState.greeting,
                            fontSize = 22.sp,
                            fontWeight = FontWeight.Light,
                            letterSpacing = (-0.5).sp,
                            color = MaterialTheme.colorScheme.onBackground
                        )
                    }
                    Spacer(modifier = Modifier.width(12.dp))

                    // Repositioned Insights Button from bottom to top-right header
                    OutlinedButton(
                        onClick = onNavigateToInsights,
                        shape = RoundedCornerShape(8.dp),
                        border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline),
                        colors = ButtonDefaults.outlinedButtonColors(
                            contentColor = MaterialTheme.colorScheme.onBackground
                        ),
                        contentPadding = PaddingValues(horizontal = 14.dp, vertical = 6.dp)
                    ) {
                        Text(
                            text = "Insights",
                            fontSize = 12.sp,
                            fontWeight = FontWeight.SemiBold,
                            letterSpacing = 0.5.sp
                        )
                    }
                }

                Spacer(modifier = Modifier.height(16.dp))

                // Streak & Consistency Quick Bar
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(
                            MaterialTheme.colorScheme.surfaceVariant,
                            RoundedCornerShape(8.dp)
                        )
                        .padding(horizontal = 16.dp, vertical = 10.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        BlueFireIcon(
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "ACTIVE STREAK",
                            fontSize = 11.sp,
                            fontWeight = FontWeight.Bold,
                            letterSpacing = 1.sp,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    Text(
                        text = "${uiState.currentStreak} DAYS",
                        fontSize = 13.sp,
                        fontWeight = FontWeight.Bold,
                        letterSpacing = 0.5.sp,
                        color = MaterialTheme.colorScheme.onBackground
                    )
                }

                Spacer(modifier = Modifier.height(20.dp))
            }

            // Primary Goal Card
            item {
                MonoCard(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "PRIMARY FOCUS",
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onSurfaceVariant,
                                letterSpacing = 1.sp
                            )
                            Text(
                                text = "${(uiState.dailyProgress * 100).toInt()}%",
                                fontSize = 12.sp,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.primary
                            )
                        }
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = uiState.primaryGoal?.title ?: "No primary goal set",
                            fontSize = 18.sp,
                            fontWeight = FontWeight.SemiBold,
                            color = MaterialTheme.colorScheme.onBackground
                        )
                        Spacer(modifier = Modifier.height(14.dp))
                        MonoProgressBar(
                            progress = uiState.dailyProgress,
                            modifier = Modifier.fillMaxWidth(),
                            height = 6.dp
                        )
                    }
                }
                Spacer(modifier = Modifier.height(24.dp))
            }

            // Today Tasks Header with REPOSITIONED "+ Add Task" button directly on the right
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Text(
                            text = "TODAY'S AGENDA",
                            fontSize = 11.sp,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            letterSpacing = 1.sp
                        )
                        Spacer(modifier = Modifier.width(6.dp))
                        Text(
                            text = "(${uiState.todayTasks.size})",
                            fontSize = 11.sp,
                            fontWeight = FontWeight.Medium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    // Repositioned Add Task button from bottom to right beside the header
                    FilledTonalButton(
                        onClick = {
                            activeTaskForSheet = null
                            showTaskSheet = true
                        },
                        shape = RoundedCornerShape(6.dp),
                        colors = ButtonDefaults.filledTonalButtonColors(
                            containerColor = MaterialTheme.colorScheme.primaryContainer,
                            contentColor = MaterialTheme.colorScheme.primary
                        ),
                        contentPadding = PaddingValues(horizontal = 12.dp, vertical = 4.dp)
                    ) {
                        Text(
                            text = "+ Add Task",
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
                Spacer(modifier = Modifier.height(12.dp))
                HorizontalDivider(color = MaterialTheme.colorScheme.outline)
                Spacer(modifier = Modifier.height(12.dp))
            }

            // Task list or empty state
            if (uiState.todayTasks.isEmpty()) {
                item {
                    MonoCard(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable {
                                activeTaskForSheet = null
                                showTaskSheet = true
                            }
                    ) {
                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(24.dp),
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Text(
                                text = "🎯",
                                fontSize = 28.sp
                            )
                            Spacer(modifier = Modifier.height(10.dp))
                            Text(
                                text = "Empty agenda",
                                fontSize = 16.sp,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onBackground
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                text = "“${uiState.emptyAgendaQuote}”",
                                fontSize = 13.sp,
                                fontStyle = FontStyle.Italic,
                                textAlign = TextAlign.Center,
                                color = MaterialTheme.colorScheme.onSurfaceVariant,
                                lineHeight = 18.sp,
                                modifier = Modifier.padding(horizontal = 8.dp)
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                            FilledTonalButton(
                                onClick = {
                                    activeTaskForSheet = null
                                    showTaskSheet = true
                                },
                                shape = RoundedCornerShape(8.dp),
                                colors = ButtonDefaults.filledTonalButtonColors(
                                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                                    contentColor = MaterialTheme.colorScheme.primary
                                )
                            ) {
                                Text(
                                    text = "+ Add First Task",
                                    fontSize = 13.sp,
                                    fontWeight = FontWeight.Bold
                                )
                            }
                        }
                    }
                    Spacer(modifier = Modifier.height(24.dp))
                }
            } else {
                if (uiState.isAllTasksCompleted) {
                    item {
                        MonoCard(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(bottom = 12.dp)
                        ) {
                            Column(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(18.dp),
                                horizontalAlignment = Alignment.CenterHorizontally
                            ) {
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.Center
                                ) {
                                    BlueFireIcon(
                                        modifier = Modifier.size(20.dp),
                                        tint = MaterialTheme.colorScheme.primary
                                    )
                                    Spacer(modifier = Modifier.width(8.dp))
                                    Text(
                                        text = "Tasks completed! 🔥",
                                        fontSize = 16.sp,
                                        fontWeight = FontWeight.Bold,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                }
                                Spacer(modifier = Modifier.height(8.dp))
                                Text(
                                    text = "“${uiState.completedAgendaQuote}”",
                                    fontSize = 13.sp,
                                    fontStyle = FontStyle.Italic,
                                    textAlign = TextAlign.Center,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    lineHeight = 18.sp
                                )
                            }
                        }
                    }
                }

                items(uiState.todayTasks, key = { it.id }) { task ->
                    val isOverdue = task.dueDate != null && task.dueDate < System.currentTimeMillis() && !task.completed
                    val formattedDue = formatDueDate(task.dueDate)

                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 4.dp)
                            .background(
                                MaterialTheme.colorScheme.surface,
                                RoundedCornerShape(8.dp)
                            )
                            .border(
                                1.dp,
                                MaterialTheme.colorScheme.outline,
                                RoundedCornerShape(8.dp)
                            )
                            .clickable {
                                activeTaskForSheet = task
                                showTaskSheet = true
                            }
                            .padding(horizontal = 12.dp, vertical = 10.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Checkbox(
                            checked = task.completed,
                            onCheckedChange = { checked -> onToggleTask(task, checked) },
                            colors = CheckboxDefaults.colors(
                                checkedColor = MaterialTheme.colorScheme.primary,
                                checkmarkColor = MaterialTheme.colorScheme.onPrimary,
                                uncheckedColor = MaterialTheme.colorScheme.outline
                            )
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Column(modifier = Modifier.weight(1f)) {
                            // Top metadata row: Goal title + Priority badge
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(6.dp)
                            ) {
                                val goalTitle = uiState.goalTitles[task.goalId]
                                if (!goalTitle.isNullOrBlank()) {
                                    Text(
                                        text = goalTitle.uppercase(),
                                        fontSize = 9.sp,
                                        fontWeight = FontWeight.Bold,
                                        letterSpacing = 0.8.sp,
                                        color = MaterialTheme.colorScheme.primary
                                    )
                                }
                                if (task.priority > 0) {
                                    val (priorityText, priorityColor) = when (task.priority) {
                                        3 -> "!!!" to Color(0xFFFF453A)
                                        2 -> "!!" to Color(0xFFFF9F0A)
                                        else -> "!" to MaterialTheme.colorScheme.primary
                                    }
                                    Text(
                                        text = priorityText,
                                        fontSize = 11.sp,
                                        fontWeight = FontWeight.Black,
                                        color = priorityColor
                                    )
                                }
                            }

                            Spacer(modifier = Modifier.height(2.dp))

                            Text(
                                text = task.title,
                                fontSize = 14.sp,
                                fontWeight = FontWeight.Medium,
                                color = if (task.completed) MaterialTheme.colorScheme.onSurfaceVariant else MaterialTheme.colorScheme.onBackground,
                                style = if (task.completed) {
                                    TextStyle(textDecoration = TextDecoration.LineThrough)
                                } else {
                                    TextStyle()
                                }
                            )

                            if (!task.description.isNullOrBlank()) {
                                Spacer(modifier = Modifier.height(2.dp))
                                Text(
                                    text = task.description,
                                    fontSize = 12.sp,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    maxLines = 1
                                )
                            }

                            // Sub-badges: Due Date & Repeat rule
                            if (formattedDue != null || task.repeatRule != "NONE") {
                                Spacer(modifier = Modifier.height(4.dp))
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    if (formattedDue != null) {
                                        Text(
                                            text = if (isOverdue) "⚠️ Overdue ($formattedDue)" else "📅 $formattedDue",
                                            fontSize = 11.sp,
                                            fontWeight = if (isOverdue) FontWeight.Bold else FontWeight.Normal,
                                            color = if (isOverdue) Color(0xFFFF453A) else MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                    if (task.repeatRule != "NONE") {
                                        Text(
                                            text = "↻ ${task.repeatRule.lowercase().replaceFirstChar { it.uppercase() }}",
                                            fontSize = 11.sp,
                                            fontWeight = FontWeight.SemiBold,
                                            color = MaterialTheme.colorScheme.primary
                                        )
                                    }
                                }
                            }
                        }
                        IconButton(
                            onClick = { onDeleteTask(task) },
                            modifier = Modifier.size(28.dp)
                        ) {
                            Text(
                                text = "✕",
                                fontSize = 13.sp,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
                item {
                    Spacer(modifier = Modifier.height(24.dp))
                }
            }

            // Architectural Quote Footer
            item {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .border(
                            1.dp,
                            MaterialTheme.colorScheme.outline,
                            RoundedCornerShape(8.dp)
                        )
                        .clickable { onRefreshQuote() }
                        .padding(16.dp)
                ) {
                    Column {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "CORE PURPOSE & DIRECTIVE",
                                fontSize = 10.sp,
                                fontWeight = FontWeight.Bold,
                                letterSpacing = 1.2.sp,
                                color = MaterialTheme.colorScheme.primary
                            )
                            Text(
                                text = "TAP TO SHUFFLE ⚡",
                                fontSize = 9.sp,
                                fontWeight = FontWeight.SemiBold,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "“${uiState.dailyQuote}”",
                            fontSize = 14.sp,
                            fontStyle = FontStyle.Italic,
                            lineHeight = 20.sp,
                            color = MaterialTheme.colorScheme.onBackground
                        )
                    }
                }
            }
        }
    }
}

private fun formatDueDate(dueDateMillis: Long?): String? {
    if (dueDateMillis == null) return null
    val localDateTime = Instant.ofEpochMilli(dueDateMillis)
        .atZone(ZoneId.systemDefault())
        .toLocalDateTime()
    val today = LocalDate.now()
    val date = localDateTime.toLocalDate()
    val time = localDateTime.toLocalTime()
    val hasTime = time.hour != 0 || time.minute != 0

    val dateStr = when {
        date.isEqual(today) -> "Today"
        date.isEqual(today.plusDays(1)) -> "Tomorrow"
        date.isEqual(today.minusDays(1)) -> "Yesterday"
        date.year == today.year -> date.format(DateTimeFormatter.ofPattern("MMM d"))
        else -> date.format(DateTimeFormatter.ofPattern("MMM d, yyyy"))
    }

    val timeStr = if (hasTime) {
        ", ${time.format(DateTimeFormatter.ofPattern("h:mm a"))}"
    } else {
        ""
    }
    return "$dateStr$timeStr"
}

/**
 * 闪电蓝火焰图标组件 (取代旧小圆点)
 */
@Composable
fun BlueFireIcon(
    modifier: Modifier = Modifier,
    tint: Color = MaterialTheme.colorScheme.primary
) {
    Canvas(modifier = modifier.size(16.dp)) {
        val w = size.width
        val h = size.height

        // Outer Flame Shape
        val outerFlame = Path().apply {
            moveTo(w * 0.50f, h * 0.98f)
            // Left base curve
            cubicTo(w * 0.20f, h * 0.98f, w * 0.05f, h * 0.76f, w * 0.08f, h * 0.54f)
            // Left flame shoulder
            cubicTo(w * 0.10f, h * 0.38f, w * 0.22f, h * 0.26f, w * 0.36f, h * 0.30f)
            // Left inner flame tongue dip
            cubicTo(w * 0.28f, h * 0.42f, w * 0.32f, h * 0.50f, w * 0.42f, h * 0.44f)
            // Central sharp flame tip
            cubicTo(w * 0.45f, h * 0.26f, w * 0.48f, h * 0.04f, w * 0.52f, 0f)
            // Right outer peak
            cubicTo(w * 0.58f, h * 0.18f, w * 0.84f, h * 0.30f, w * 0.92f, h * 0.52f)
            // Right base curve
            cubicTo(w * 0.98f, h * 0.74f, w * 0.80f, h * 0.98f, w * 0.50f, h * 0.98f)
            close()
        }
        drawPath(path = outerFlame, color = tint)

        // Inner Flame Core Lick (Bright White-Blue Core)
        val innerFlame = Path().apply {
            moveTo(w * 0.50f, h * 0.90f)
            cubicTo(w * 0.36f, h * 0.90f, w * 0.28f, h * 0.74f, w * 0.32f, h * 0.62f)
            cubicTo(w * 0.35f, h * 0.52f, w * 0.46f, h * 0.44f, w * 0.50f, h * 0.34f)
            cubicTo(w * 0.54f, h * 0.44f, w * 0.65f, h * 0.54f, w * 0.66f, h * 0.64f)
            cubicTo(w * 0.68f, h * 0.76f, w * 0.60f, h * 0.90f, w * 0.50f, h * 0.90f)
            close()
        }
        drawPath(path = innerFlame, color = Color(0xFFE0F7FA))
    }
}
