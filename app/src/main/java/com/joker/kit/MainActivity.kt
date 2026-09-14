package com.joker.kit

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.content.ContextCompat
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import com.joker.kit.core.designsystem.theme.AppTheme
import com.joker.kit.core.navigation.AppNavHost
import com.joker.kit.core.navigation.AppNavigator
import com.joker.kit.core.notification.MotivationNotificationReceiver
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * 应用的主Activity
 * 使用@AndroidEntryPoint注解标记为Hilt依赖注入的入口点
 */
@AndroidEntryPoint
class MainActivity : ComponentActivity() {

    @Inject
    lateinit var navigator: AppNavigator

    private val requestPermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted: Boolean ->
        if (isGranted) {
            MotivationNotificationReceiver.scheduleNext(this)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        val splashScreen = installSplashScreen()
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        // 检查通知权限并初始化随机动力提醒调度
        checkNotificationPermissionAndSchedule()

        setContent {
            AppTheme {
                AppNavHost(navigator = navigator)
            }
        }

        splashScreen.setKeepOnScreenCondition {
            false
        }
    }

    private fun checkNotificationPermissionAndSchedule() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            if (ContextCompat.checkSelfPermission(
                    this,
                    Manifest.permission.POST_NOTIFICATIONS
                ) == PackageManager.PERMISSION_GRANTED
            ) {
                MotivationNotificationReceiver.scheduleNext(this)
            } else {
                requestPermissionLauncher.launch(Manifest.permission.POST_NOTIFICATIONS)
            }
        } else {
            MotivationNotificationReceiver.scheduleNext(this)
        }
    }
}