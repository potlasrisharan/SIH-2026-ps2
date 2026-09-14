package com.joker.kit.feature.insights.view.components

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.joker.kit.domain.model.insights.DailyStat

@Composable
fun DailyTrendChart(dailyStats: List<DailyStat>) {
    if (dailyStats.isEmpty()) return

    val gridColor = MaterialTheme.colorScheme.outline
    val dataColor = MaterialTheme.colorScheme.primary
    val labelColor = MaterialTheme.colorScheme.onSurfaceVariant
    val chartBg = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.35f)
    val cornerShape = RoundedCornerShape(4.dp)

    Column(modifier = Modifier.fillMaxWidth().height(200.dp)) {
        Row(modifier = Modifier.fillMaxSize()) {
            // Y-axis
            Column(
                modifier = Modifier.fillMaxHeight().padding(end = 8.dp),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Text("100%", fontSize = 10.sp, color = labelColor)
                Text("75%", fontSize = 10.sp, color = labelColor)
                Text("50%", fontSize = 10.sp, color = labelColor)
                Text("25%", fontSize = 10.sp, color = labelColor)
                Text("0%", fontSize = 10.sp, color = labelColor)
            }

            // Chart area
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .clip(cornerShape)
                    .border(1.dp, gridColor, cornerShape)
                    .background(chartBg)
            ) {
                Canvas(modifier = Modifier.fillMaxSize()) {
                    val width = size.width
                    val height = size.height

                    // Draw grid lines
                    for (i in 0..4) {
                        val y = height * (i / 4f)
                        drawLine(
                            color = gridColor,
                            start = Offset(0f, y),
                            end = Offset(width, y),
                            strokeWidth = 1f
                        )
                    }

                    // Draw data line
                    if (dailyStats.isNotEmpty()) {
                        val pointSpacing = width / (dailyStats.size - 1).coerceAtLeast(1)
                        val path = Path()

                        dailyStats.forEachIndexed { index, stat ->
                            val x = index * pointSpacing
                            val y = height - (stat.completionPercentage / 100f * height)

                            if (index == 0) {
                                path.moveTo(x, y)
                            } else {
                                path.lineTo(x, y)
                            }

                            drawCircle(
                                color = dataColor,
                                radius = 4f,
                                center = Offset(x, y)
                            )
                        }

                        val fillPath = Path().apply {
                            addPath(path)
                            lineTo((dailyStats.size - 1) * pointSpacing, height)
                            lineTo(0f, height)
                            close()
                        }
                        drawPath(
                            path = fillPath,
                            color = dataColor.copy(alpha = 0.15f)
                        )

                        drawPath(
                            path = path,
                            color = dataColor,
                            style = Stroke(width = 2.dp.toPx())
                        )
                    }
                }

                // X-axis (days)
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .align(Alignment.BottomStart)
                        .padding(horizontal = 4.dp, vertical = 2.dp),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    dailyStats.forEachIndexed { index, stat ->
                        if (index == 0 || index == dailyStats.lastIndex || (index + 1) % 5 == 0) {
                            Text(stat.date.dayOfMonth.toString(), fontSize = 10.sp, color = labelColor)
                        } else {
                            Spacer(modifier = Modifier.width(10.dp))
                        }
                    }
                }
            }
        }
    }
}
