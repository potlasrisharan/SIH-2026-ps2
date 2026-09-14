package com.joker.kit.feature.insights.view.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.joker.kit.domain.model.insights.HabitStat
import java.time.YearMonth

@Composable
fun HabitMatrix(habitStats: List<HabitStat>, month: YearMonth) {
    if (habitStats.isEmpty()) {
        Text(
            text = "No active habits for this month.",
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            fontSize = 14.sp
        )
        return
    }

    val daysInMonth = month.lengthOfMonth()
    val scrollState = rememberScrollState()

    val primaryColor = MaterialTheme.colorScheme.primary
    val outlineColor = MaterialTheme.colorScheme.outline
    val surfaceVariantColor = MaterialTheme.colorScheme.surfaceVariant
    val onSurfaceVariantColor = MaterialTheme.colorScheme.onSurfaceVariant
    val onBackgroundColor = MaterialTheme.colorScheme.onBackground

    Row(modifier = Modifier.fillMaxWidth()) {
        // Fixed column for habit names
        Column(modifier = Modifier.width(120.dp)) {
            // Header row spacer
            Spacer(modifier = Modifier.height(24.dp))
            habitStats.forEach { habit ->
                Box(
                    modifier = Modifier.height(24.dp).padding(end = 8.dp),
                    contentAlignment = Alignment.CenterStart
                ) {
                    Text(
                        text = habit.name,
                        fontSize = 12.sp,
                        color = onBackgroundColor,
                        maxLines = 1,
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }
        }

        // Scrollable matrix
        Row(
            modifier = Modifier
                .weight(1f)
                .horizontalScroll(scrollState)
        ) {
            for (day in 1..daysInMonth) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    modifier = Modifier.width(20.dp)
                ) {
                    // Header day number
                    Text(
                        text = day.toString(),
                        fontSize = 10.sp,
                        color = onSurfaceVariantColor,
                        modifier = Modifier.height(24.dp)
                    )

                    // Habit cells for this day
                    val date = month.atDay(day)
                    habitStats.forEach { habit ->
                        val completed = habit.completionsByDate[date]
                        Box(
                            modifier = Modifier
                                .height(24.dp)
                                .fillMaxWidth(),
                            contentAlignment = Alignment.Center
                        ) {
                            when (completed) {
                                true -> Box(
                                    modifier = Modifier
                                        .size(12.dp)
                                        .background(primaryColor)
                                )
                                false -> Box(
                                    modifier = Modifier
                                        .size(12.dp)
                                        .border(1.dp, outlineColor)
                                )
                                null -> Box(
                                    modifier = Modifier
                                        .size(12.dp)
                                        .background(surfaceVariantColor.copy(alpha = 0.5f)) // Not scheduled
                                )
                            }
                        }
                    }
                }
            }

            Spacer(modifier = Modifier.width(16.dp))

            // Fixed columns for total and percentage inside scroll
            Column(modifier = Modifier.width(40.dp), horizontalAlignment = Alignment.End) {
                Text("TOTAL", fontSize = 10.sp, color = onSurfaceVariantColor, modifier = Modifier.height(24.dp))
                habitStats.forEach { habit ->
                    Box(modifier = Modifier.height(24.dp), contentAlignment = Alignment.CenterEnd) {
                        Text(habit.completedOccurrences.toString(), fontSize = 12.sp, color = onBackgroundColor)
                    }
                }
            }

            Spacer(modifier = Modifier.width(8.dp))

            Column(modifier = Modifier.width(40.dp), horizontalAlignment = Alignment.End) {
                Text("%", fontSize = 10.sp, color = onSurfaceVariantColor, modifier = Modifier.height(24.dp))
                habitStats.forEach { habit ->
                    Box(modifier = Modifier.height(24.dp), contentAlignment = Alignment.CenterEnd) {
                        Text(
                            "${habit.completionPercentage}%",
                            fontSize = 12.sp,
                            color = onBackgroundColor,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
            }
        }
    }
}
