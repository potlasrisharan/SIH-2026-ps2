package com.joker.kit.core.notification

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import com.joker.kit.data.local.entity.TaskEntity
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class TaskAlarmScheduler @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as? AlarmManager

    fun schedule(task: TaskEntity) {
        val due = task.dueDate ?: return
        if (due <= System.currentTimeMillis() || task.completed) return

        val intent = Intent(context, MotivationNotificationReceiver::class.java).apply {
            action = MotivationNotificationReceiver.ACTION_TASK_REMINDER
            putExtra(MotivationNotificationReceiver.EXTRA_TASK_ID, task.id)
            putExtra(MotivationNotificationReceiver.EXTRA_TASK_TITLE, task.title)
            putExtra(MotivationNotificationReceiver.EXTRA_TASK_DESC, task.description ?: "")
            putExtra(MotivationNotificationReceiver.EXTRA_TASK_PRIORITY, task.priority)
        }

        val pendingIntent = PendingIntent.getBroadcast(
            context,
            (task.id % Int.MAX_VALUE).toInt(),
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        alarmManager?.let { am ->
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    if (am.canScheduleExactAlarms()) {
                        am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, due, pendingIntent)
                    } else {
                        am.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, due, pendingIntent)
                    }
                } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, due, pendingIntent)
                } else {
                    am.setExact(AlarmManager.RTC_WAKEUP, due, pendingIntent)
                }
            } catch (e: SecurityException) {
                try {
                    am.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, due, pendingIntent)
                } catch (_: Exception) {
                    // Ignored
                }
            }
        }
    }

    fun cancel(task: TaskEntity) {
        val intent = Intent(context, MotivationNotificationReceiver::class.java).apply {
            action = MotivationNotificationReceiver.ACTION_TASK_REMINDER
        }
        val pendingIntent = PendingIntent.getBroadcast(
            context,
            (task.id % Int.MAX_VALUE).toInt(),
            intent,
            PendingIntent.FLAG_NO_CREATE or PendingIntent.FLAG_IMMUTABLE
        )
        if (pendingIntent != null) {
            alarmManager?.cancel(pendingIntent)
            pendingIntent.cancel()
        }
    }
}
