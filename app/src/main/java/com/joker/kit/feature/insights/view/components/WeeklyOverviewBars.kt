package com.joker.kit.feature.insights.view.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.joker.kit.domain.model.insights.WeeklyStat

@Composable
fun WeeklyOverviewBars(weeklyStats: List<WeeklyStat>) {
    if (weeklyStats.isEmpty()) return

    val trackBg = MaterialTheme.colorScheme.surfaceVariant
    val fillBg = MaterialTheme.colorScheme.primary
    val outlineColor = MaterialTheme.colorScheme.outline
    val onBackgroundColor = MaterialTheme.colorScheme.onBackground
    val onSurfaceVariantColor = MaterialTheme.colorScheme.onSurfaceVariant
    val barShape = RoundedCornerShape(2.dp)

    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(120.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.Bottom
    ) {
        weeklyStats.forEach { stat ->
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier.weight(1f)
            ) {
                Text(stat.weekLabel, fontSize = 10.sp, color = onBackgroundColor, fontWeight = FontWeight.Bold)
                Text(stat.dateRange, fontSize = 10.sp, color = onSurfaceVariantColor)

                Spacer(modifier = Modifier.height(8.dp))

                Box(
                    modifier = Modifier
                        .fillMaxWidth(0.6f)
                        .height(80.dp)
                        .border(1.dp, outlineColor, barShape)
                        .background(trackBg, barShape),
                    contentAlignment = Alignment.BottomCenter
                ) {
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .fillMaxHeight(stat.completionPercentage / 100f)
                            .background(fillBg)
                    )
                }

                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    "${stat.completionPercentage}%",
                    fontSize = 12.sp,
                    color = onBackgroundColor,
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}
