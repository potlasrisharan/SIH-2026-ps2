# ⚡ Whyward — Personal Goal Companion

> A disciplined, offline-first personal growth and productivity application for Android, built with modern **Kotlin** and **Jetpack Compose**.

[![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)](https://android.com)
[![Kotlin](https://img.shields.io/badge/Kotlin-2.0+-7F52FF?logo=kotlin&logoColor=white)](https://kotlinlang.org)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2F%20MVI-00ACC1)]()
[![Database](https://img.shields.io/badge/Storage-Room%20(Offline--First)-4285F4?logo=sqlite&logoColor=white)](https://developer.android.com/training/data-storage/room)
[![UI](https://img.shields.io/badge/UI-Jetpack%20Compose%20M3-4285F4?logo=jetpackcompose&logoColor=white)](https://developer.android.com/jetpack/compose)

---

## 🎯 Overview

**Whyward** is an intentional, distraction-free goal execution system. It pairs daily habit execution with long-term vision, grounding task completion in intrinsic motivation ("Why") rather than endless, overwhelming todo lists.

Designed with a bespoke **Monochrome Stealth Dark** aesthetic, Whyward ensures focus remains on execution.

---

## 🏗️ Architecture

Whyward follows **Clean Architecture** principles with unidirectional data flow (UDF) powered by Kotlin Coroutines and `StateFlow`:

```
app/src/main/java/com/joker/kit/
├── core/
│   ├── designsystem/     # Theme, Typography, Stealth Dark Color Palette
│   ├── navigation/       # Navigation routes and type-safe arguments
│   ├── notification/     # AlarmManager schedulers & BroadcastReceivers
│   └── ui/               # Reusable Mono primitives (MonoCard, MonoButton, MonoProgressBar)
├── data/
│   ├── local/
│   │   ├── dao/          # GoalDao, TaskDao (Room)
│   │   ├── database/     # CompanionDatabase with schema migrations
│   │   └── entity/       # GoalEntity, TaskEntity, MilestoneEntity
│   └── repository/       # Repository implementations
├── di/                   # Hilt dependency injection modules
├── domain/
│   ├── repository/       # Abstract repository interfaces
│   └── usecase/          # CalculateStreakUseCase, MotivationEngineUseCase
└── feature/
    ├── goals/            # Goal management, detail breakdown, creation
    ├── insights/         # Consistency trends & execution analytics
    ├── main/             # Bottom navigation shell & scaffold
    ├── progress/         # Long-term milestone visualization
    ├── settings/         # App preferences & notification settings
    └── today/            # Daily agenda, dynamic quotes, Apple Reminders task sheet
```

---

## ✨ Key Features

- **Today's Focus**: Intelligent day-scoped task filtering (`startOfToday..endOfToday`), pending overdue roll-forward, and real-time progress calculations.
- **Apple Reminders Task Sheet**: iOS Reminders-inspired task sheet featuring quick date chips (*Today*, *Tomorrow*, *Weekend*, *Custom*), recurrence engine (*Daily*, *Weekdays*, *Weekends*, *Weekly*, *Monthly*), and priority flags.
- **Anti-Procrastination Rules**: Strict time/date validation preventing scheduling tasks in the past, with automatic time-forwarding and inline error guards.
- **Streak & Motivation Engine**: Tracks active execution streaks, calculates consistency scores, and rotates dynamic architectural quotes based on time of day and completion state.
- **Goal Hierarchy**: Organizes daily tasks under core directives (*Vision*, *Why*, *Milestones*).
- **100% Offline-First**: Zero external dependencies or mandatory cloud sync. Your data lives exclusively in an encrypted, optimized local SQLite database.

---

## 🛠️ Tech Stack

| Layer | Technologies |
|---|---|
| **Language** | Kotlin 2.x (100% null-safe) |
| **UI Toolkit** | Jetpack Compose (Material 3) |
| **Architecture** | Clean Architecture + MVVM / UDF |
| **Dependency Injection** | Hilt (Dagger) |
| **Database** | Room SQLite with TypeConverters |
| **Asynchronous** | Kotlin Coroutines, StateFlow, SharedFlow |
| **Scheduling** | Android `AlarmManager` + `BroadcastReceiver` |
| **Testing** | JUnit 4/5, MockK, AndroidX Test |

---

## 🚀 Getting Started

### Prerequisites
- **Android Studio Ladybug (2024.2+)** or later
- **JDK 21** (JetBrains Runtime recommended)
- Android device or emulator running **Android 8.0 (API 26)** or higher (Target: Android 16 / SDK 36)

### Clone & Build

```bash
# 1. Clone repository
git clone https://github.com/potlasrisharan/personal-goal-companion.git
cd personal-goal-companion

# 2. Build Debug APK
./gradlew assembleDebug

# 3. Run Unit Tests
./gradlew testDebugUnitTest
```

### Generated Artifacts
After running `assembleDebug`, the generated APKs are located at:
- `app/build/outputs/apk/debug/app-universal-debug.apk`
- `app/build/outputs/apk/debug/app-arm64-v8a-debug.apk`

---

## 🧪 Testing

Execute the unit test suite:
```bash
./gradlew :app:testDebugUnitTest
```

---

## 📄 License

This repository is maintained privately by **Potla Sri Sharan**. All rights reserved.
