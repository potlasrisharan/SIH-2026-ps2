package com.joker.kit.core.notification

import android.app.AlarmManager
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.core.app.NotificationCompat
import com.joker.kit.MainActivity
import com.joker.kit.R
import com.joker.kit.domain.usecase.MotivationQuotes
import java.util.Calendar
import kotlin.random.Random

class MotivationNotificationReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent?) {
        if (intent?.action == ACTION_TASK_REMINDER) {
            val taskId = intent.getLongExtra(EXTRA_TASK_ID, 0L)
            val title = intent.getStringExtra(EXTRA_TASK_TITLE) ?: "Task Reminder"
            val desc = intent.getStringExtra(EXTRA_TASK_DESC)
            val priority = intent.getIntExtra(EXTRA_TASK_PRIORITY, 0)
            showTaskReminder(context, taskId, title, desc, priority)
        } else {
            showNotification(context)
            scheduleNext(context)
        }
    }

    private fun showTaskReminder(
        context: Context,
        taskId: Long,
        title: String,
        desc: String?,
        priority: Int
    ) {
        val notificationManager =
            context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                TASK_CHANNEL_ID,
                "Task Reminders",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "Due date and time alerts for tasks"
                enableLights(true)
                lightColor = 0xFF00E5FF.toInt()
                enableVibration(true)
            }
            notificationManager.createNotificationChannel(channel)
        }

        val contentIntent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            context,
            taskId.toInt(),
            contentIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val priorityPrefix = when (priority) {
            3 -> "🚨 "
            2 -> "⚡ "
            1 -> "📌 "
            else -> "✓ "
        }

        val notification = NotificationCompat.Builder(context, TASK_CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_tabbar_route)
            .setContentTitle("$priorityPrefix$title")
            .setContentText(if (!desc.isNullOrBlank()) desc else "Due now")
            .setStyle(NotificationCompat.BigTextStyle().bigText(if (!desc.isNullOrBlank()) desc else title))
            .setColor(0xFF00E5FF.toInt())
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setContentIntent(pendingIntent)
            .setAutoCancel(true)
            .build()

        notificationManager.notify((10000 + taskId).toInt(), notification)
    }

    private fun showNotification(context: Context) {
        val notificationManager =
            context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        // Notification channel setup for Android 8.0+
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Task Motivation",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "Daily and random motivational nudges to finish your tasks"
                enableLights(true)
                lightColor = 0xFF00E5FF.toInt()
                enableVibration(true)
            }
            notificationManager.createNotificationChannel(channel)
        }

        val contentIntent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            context,
            0,
            contentIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val quote = MotivationQuotes.getRandomQuote()

        val notification = NotificationCompat.Builder(context, CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_tabbar_route)
            .setContentTitle("⚡ Time to Lock In")
            .setContentText(quote)
            .setStyle(NotificationCompat.BigTextStyle().bigText(quote))
            .setColor(0xFF00E5FF.toInt())
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setContentIntent(pendingIntent)
            .setAutoCancel(true)
            .build()

        notificationManager.notify(NOTIFICATION_ID, notification)
    }

    companion object {
        const val CHANNEL_ID = "motivation_channel"
        const val TASK_CHANNEL_ID = "task_reminder_channel"
        const val NOTIFICATION_ID = 7001
        const val ACTION_TRIGGER = "com.joker.kit.ACTION_MOTIVATION_REMINDER"
        const val ACTION_TASK_REMINDER = "com.joker.kit.ACTION_TASK_REMINDER"

        const val EXTRA_TASK_ID = "extra_task_id"
        const val EXTRA_TASK_TITLE = "extra_task_title"
        const val EXTRA_TASK_DESC = "extra_task_desc"
        const val EXTRA_TASK_PRIORITY = "extra_task_priority"

        /**
         * Schedules the next notification at a randomized interval between 9:00 AM and 9:00 PM.
         */
        fun scheduleNext(context: Context) {
            val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as? AlarmManager ?: return
            val intent = Intent(context, MotivationNotificationReceiver::class.java).apply {
                action = ACTION_TRIGGER
            }
            val pendingIntent = PendingIntent.getBroadcast(
                context,
                1001,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )

            val target = Calendar.getInstance()

            // Random delay between 3 and 6 hours
            val randomHours = Random.nextInt(3, 7)
            val randomMinutes = Random.nextInt(0, 60)
            target.add(Calendar.HOUR_OF_DAY, randomHours)
            target.add(Calendar.MINUTE, randomMinutes)

            val targetHour = target.get(Calendar.HOUR_OF_DAY)
            if (targetHour < 9) {
                target.set(Calendar.HOUR_OF_DAY, 9 + Random.nextInt(0, 2))
                target.set(Calendar.MINUTE, Random.nextInt(0, 60))
            } else if (targetHour >= 21) {
                target.add(Calendar.DAY_OF_YEAR, 1)
                target.set(Calendar.HOUR_OF_DAY, 9 + Random.nextInt(0, 3))
                target.set(Calendar.MINUTE, Random.nextInt(0, 60))
            }

            val triggerTime = target.timeInMillis

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                alarmManager.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerTime, pendingIntent)
            } else {
                alarmManager.set(AlarmManager.RTC_WAKEUP, triggerTime, pendingIntent)
            }
        }

        /**
         * Triggers an immediate notification for testing or explicit user action.
         */
        fun triggerNow(context: Context) {
            val receiver = MotivationNotificationReceiver()
            receiver.showNotification(context)
        }
    }
}
