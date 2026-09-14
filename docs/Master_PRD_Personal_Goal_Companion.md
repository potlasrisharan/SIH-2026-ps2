# PERSONAL GOAL COMPANION
## Master Product Requirements Document & Technical Specification

**Version:** 1.0  
**Platform:** Android  
**Product Type:** Offline-first personal growth / productivity application  
**Business Model:** Free  
**Core Philosophy:** Goals → Action → Reflection → Progress  
**Primary Language:** Kotlin  
**UI:** Jetpack Compose  
**Backend:** No backend required for core V1; optional backend architecture reserved for future sync  
**Design Philosophy:** Minimal, calm, functional, human

---

# 1. EXECUTIVE SUMMARY

Personal Goal Companion is a free, offline-first Android application designed to help people turn long-term aspirations into daily action.

The application combines:

- Goal setting
- Personal WHY
- Vision / manifestation-style visualization
- Milestones
- To-do tasks
- Personalized motivation
- Configurable reminders
- Focus sessions
- Progress tracking
- Streaks
- Daily and weekly reflection
- Personal goal journaling

The product is NOT intended to be a generic task manager.

Its central purpose is:

> **Help users remember what they are working toward, take meaningful action, and see how far they have come.**

The fundamental loop is:

    DREAM
      ↓
    GOAL
      ↓
    WHY
      ↓
    VISION
      ↓
    MILESTONES
      ↓
    TASKS
      ↓
    ACTION
      ↓
    REMINDER
      ↓
    MOTIVATION
      ↓
    PROGRESS
      ↓
    REFLECTION
      ↓
    REPEAT

---

# 2. PRODUCT VISION

## Vision Statement

Build a private digital companion that helps people become the person they want to become.

The application should feel:

- Personal
- Calm
- Focused
- Encouraging
- Private
- Lightweight
- Reliable

It should NOT feel:

- Noisy
- Gamified for the sake of gamification
- Corporate
- Like an AI chatbot
- Like a social network
- Like a generic habit tracker
- Like a dashboard full of meaningless statistics

---

# 3. PRODUCT POSITIONING

The product is positioned between:

    To-Do App
         +
    Goal Planner
         +
    Personal Journal
         +
    Motivation Companion
         +
    Progress Tracker

But the user should never feel that five separate applications have been combined.

The experience should feel like one coherent system.

## Product statement

> Set your goal. Remember why. Take action. Track your journey.

---

# 4. CORE PRODUCT PRINCIPLES

## 4.1 Free

The core application is free.

There are no:

- Subscriptions
- Paywalls
- Premium task limits
- Paid motivational messages
- Advertising SDKs in V1

## 4.2 Offline-first

Core functionality must work without an internet connection.

The application should remain useful in:

- Airplane mode
- Poor connectivity
- Rural environments
- Underground environments
- Areas with no network coverage

## 4.3 Privacy-first

Personal information such as:

- Goals
- WHY
- Vision
- Journal entries
- Affirmations
- Reflections

should remain on the device in V1.

## 4.4 No mandatory account

The user should be able to:

    Install
      ↓
    Open
      ↓
    Create goal
      ↓
    Start using

No login is required.

## 4.5 Action over passive motivation

The application should not encourage users to simply "manifest" an outcome.

The philosophy is:

    Visualize
       ↓
    Plan
       ↓
    Act
       ↓
    Track
       ↓
    Reflect

## 4.6 Minimalism

Every screen should answer one question.

Every button should have a purpose.

Every animation should communicate something.

Every color should communicate hierarchy or state.

---

# 5. TARGET USERS

## Primary users

### Students

Example:

> "I want to get into a good university."

### Career builders

> "I want to become a software engineer."

### Fitness users

> "I want to become stronger."

### Entrepreneurs

> "I want to build my company."

### Financial planners

> "I want to save ₹5,00,000."

### Personal development users

> "I want to become more disciplined."

---

# 6. CORE USER JOURNEY

First-time user:

    Welcome
       ↓
    Create Goal
       ↓
    Why does this matter?
       ↓
    Describe your Vision
       ↓
    Optional Future-Self description
       ↓
    Create first Milestone
       ↓
    Add Tasks
       ↓
    Configure Reminders
       ↓
    Home / Today
       ↓
    Complete Tasks
       ↓
    Receive Goal Nudges
       ↓
    Focus
       ↓
    Record Progress
       ↓
    Daily Reflection
       ↓
    Weekly Reflection
       ↓
    Continue

---

# 7. INFORMATION ARCHITECTURE

The application has four primary navigation destinations:

    TODAY
    GOALS
    PROGRESS
    SETTINGS

The Journal, Focus Mode, Goal details, and other contextual features are accessed from these areas.

## Bottom navigation

    ┌────────────────────────────────────┐
    │                                    │
    │  Today   Goals   Progress   Settings│
    │                                    │
    └────────────────────────────────────┘

No excessive floating buttons.

No unnecessary navigation layers.

---

# 8. FEATURE SET

The first major product version contains the following 15 features.

---

# FEATURE 1 — THE WHY

## Purpose

Make every important goal emotionally meaningful.

When creating a goal, the user answers:

> Why does this matter to you?

Example:

Goal:

> Become a software engineer.

WHY:

> I want financial independence and want to build products that people actually use.

The WHY becomes available to:

- Goal screen
- Morning reminder
- Motivational reminders
- Future-self section
- Reflection
- Progress history

## Data

Goal:

    title
    why
    vision
    targetDate

## Principle

The app should remind users of their own words rather than constantly giving generic quotes.

---

# FEATURE 2 — GOAL → MILESTONE → TASK

Goals are hierarchical.

    GOAL
      ↓
    MILESTONE
      ↓
    TASK

Example:

    Become a Software Engineer
             │
             ├── Learn Java
             │     ├── OOP
             │     ├── Collections
             │     └── Exceptions
             │
             ├── Learn DSA
             │     ├── Arrays
             │     ├── Linked Lists
             │     └── Trees
             │
             └── Build Portfolio
                   ├── Android project
                   └── Portfolio website

This hierarchy is fundamental to progress calculation.

---

# FEATURE 3 — FUTURE ME

## Purpose

Help the user describe the person they want to become.

Prompt:

> Describe the person you want to become.

Example:

> I want to become disciplined, technically strong, financially independent and confident.

The application can periodically surface this information.

Example:

> You said you wanted to become someone who keeps promises to yourself.

This is NOT an AI-generated personality analysis.

It is based on the user's own writing.

---

# FEATURE 4 — VISION BOARD

Each goal can optionally have a visual vision board.

Users can attach:

- Images
- Short captions
- Personal statements

Example:

    ┌───────────────────────────┐
    │                           │
    │       MY VISION           │
    │                           │
    │       [IMAGE]             │
    │                           │
    │ "Working at my dream      │
    │  company."                │
    │                           │
    └───────────────────────────┘

Images are stored locally in V1.

No cloud image storage is required.

---

# FEATURE 5 — PERSONAL AFFIRMATIONS

Users can create their own affirmations.

Examples:

> I am capable of learning difficult things.

> I keep promises I make to myself.

> I show up even when I don't feel motivated.

Affirmations are optional.

They can be surfaced by the notification engine.

The application must not make medical or psychological claims.

---

# FEATURE 6 — ADAPTIVE NOTIFICATIONS

This is one of the product's signature features.

## Morning reminder

The user defines a morning window.

Example:

    06:00 — 10:00

The app schedules a morning goal reminder within that window.

The product should NOT attempt to continuously monitor everything happening on the user's phone.

The V1 implementation should rely on Android-supported scheduling mechanisms.

## Daily reminders

User selects:

    1 reminder
    OR
    2 reminders

The application randomly chooses suitable times within the user's configured reminder windows.

Example:

    Morning:
    06:00–10:00

    Afternoon:
    12:00–17:00

    Evening:
    18:00–22:00

Potential schedule:

    08:13 → Morning reminder
    14:47 → Random reminder
    20:32 → Random reminder

The exact implementation must respect Android's current background execution and alarm restrictions.

## Notification types

Morning:

> Remember what you're working toward.

Progress:

> You've completed 17 tasks toward this goal.

WHY:

> You said this goal matters because you want financial independence.

Action:

> What's one thing you can do right now?

Reflection:

> What did you accomplish today?

Streak:

> You've shown up for 7 days.

## Notification rules

- Never exceed the user's configured daily limit.
- Do not schedule reminders too close together.
- Respect quiet hours.
- Allow reminders to be paused.
- Avoid repeating identical messages.
- Don't use guilt-based messaging.
- Don't spam.

---

# FEATURE 7 — SURPRISE ME

A small optional interaction.

Button:

    ✦ Surprise Me

The application selects one useful action.

Possible outputs:

> Review your WHY.

> Complete your smallest unfinished task.

> Spend 15 minutes on your primary goal.

> Write one sentence about your progress.

> Read your Future Me statement.

The result should always be actionable.

---

# FEATURE 8 — WHAT SHOULD I DO NOW?

The user may have many tasks.

Instead of presenting everything, the app can recommend one next action using deterministic rules.

Inputs:

    Goal priority
    Task priority
    Due date
    Task age
    Estimated duration
    Completion state

Output:

> DO THIS NEXT

    Solve 2 DSA problems

    Goal:
    Become a Software Engineer

    Estimated:
    30 minutes

    [ Start Focus ]

This is a rules engine in V1.

No AI required.

---

# FEATURE 9 — FOCUS MODE

When the user starts a task:

    FOCUS

    Solve 2 DSA problems

          25:00

       [ Start ]

Focus mode records:

- Start time
- End time
- Duration
- Associated goal
- Associated task

Possible future presets:

    15 min
    25 min
    45 min
    Custom

Focus sessions contribute to progress statistics.

---

# FEATURE 10 — GOAL MOMENTUM

The application provides a simple activity indicator.

Example:

    MOMENTUM

         82

    Strong momentum

Based on:

- Recent task completion
- Active days
- Streak
- Focus sessions
- Milestone progress

The score must be clearly described as an application-generated activity indicator.

It must NOT claim to scientifically measure motivation, productivity, or personal success.

---

# FEATURE 11 — GOAL TIMELINE

Long-term goals can have a chronological structure.

Example:

    SEPTEMBER
       │
       └── Learn Java

    OCTOBER
       │
       └── DSA fundamentals

    NOVEMBER
       │
       └── Build project

    DECEMBER
       │
       └── Portfolio

The timeline is based on milestones and target dates.

---

# FEATURE 12 — STREAK SYSTEM

A meaningful-progress streak is maintained when the user performs a qualifying action.

Qualifying actions:

- Complete a task
- Complete a milestone
- Record meaningful progress
- Complete a daily reflection

Opening the app alone does NOT count.

This prevents meaningless streaks.

Example:

    🔥 7 day streak

The app should never shame the user after a missed day.

Instead:

> Your previous streak was 7 days. Start again today.

---

# FEATURE 13 — PROGRESS CELEBRATIONS

When the user completes a milestone:

    MILESTONE COMPLETE

    Learn Java fundamentals

    You completed 8 tasks
    across this milestone.

    [ Continue ]

Celebrations should be subtle.

NO:

- Confetti explosions
- Full-screen particle systems
- Loud visual effects
- Gamified "YOU WON!!!" screens

A simple change in typography, icon, or small transition is enough.

---

# FEATURE 14 — WEEKLY REFLECTION

Once a week:

    YOUR WEEK

    What went well?

    __________________

    What was difficult?

    __________________

    What did you learn?

    __________________

    What will you focus on next week?

    __________________

    [ Save Reflection ]

Then show:

    WEEKLY SUMMARY

    Tasks completed     21
    Active days          6
    Focus time          9h
    Milestones           2

---

# FEATURE 15 — GOAL JOURNAL

Every goal can have a private journal.

Example:

    GOAL JOURNAL

    September 13

    "Today I finally understood
    binary search."

    September 10

    "I was struggling with
    linked lists..."

    September 4

    "Started learning DSA."

Journal entries remain locally stored.

The journal is intentionally simple.

It should feel closer to a notebook than a social feed.

---

# 9. HOME / TODAY SCREEN

This is the primary screen.

Example:

    Good morning

    September 13

    ───────────────────────────

    YOUR MAIN GOAL

    Become a Software Engineer

    ████████████░░░░ 68%

    ───────────────────────────

    TODAY

    □ Study Java
    □ Solve 2 DSA problems
    □ Work on Android project

    + Add task

    ───────────────────────────

    🔥 7 day streak

    ───────────────────────────

    Remember why:

    "I want financial independence
    and want to build products..."

The screen should remain visually quiet.

---

# 10. GOALS SCREEN

    GOALS

    ★ PRIMARY

    Become a Software Engineer
    █████████████░░ 68%

    ─────────────────

    Fitness
    ████████░░░░░░ 42%

    Learn Japanese
    ████░░░░░░░░░░ 24%

    + New Goal

Each goal is presented as a clean list item.

Avoid excessive cards.

---

# 11. GOAL DETAIL SCREEN

    ← Goals

    Become a Software Engineer

    68%

    Target:
    December 2027

    WHY

    "I want financial independence..."

    ─────────────────

    MILESTONES

    ✓ Java
    ✓ OOP
    → DSA
    → Android
    → Portfolio

    ─────────────────

    NEXT ACTION

    Solve 2 DSA problems

    ─────────────────

    PROGRESS

    47 tasks
    38 focus hours
    7 day streak

    ─────────────────

    JOURNAL

    [ View Journal ]

---

# 12. PROGRESS SCREEN

    PROGRESS

    CURRENT STREAK

          7 days

    ─────────────────

    TASKS

          47

    completed

    ─────────────────

    ACTIVE DAYS

          18

    this month

    ─────────────────

    FOCUS TIME

          38h

    ─────────────────

    GOAL MOMENTUM

          82

The statistics should remain understandable.

No meaningless charts.

---

# 13. SETTINGS

    SETTINGS

    Notifications
      Morning reminder
      Daily reminders
      Reminder count
      Quiet hours

    Appearance
      System
      Light
      Dark

    Privacy
      Local data
      App lock

    Data
      Export
      Import
      Delete all data

    About
      Privacy policy
      Terms
      Version

---

# 14. DESIGN SYSTEM

This is a critical part of the product.

The application should deliberately avoid the common "AI-generated app" visual style.

## Avoid

- Purple/blue gradient backgrounds
- Neon colors
- Excessive rounded cards
- Glassmorphism everywhere
- Huge text
- Excessive shadows
- Floating blobs
- Random decorative icons
- 3D illustrations
- Animated backgrounds
- Excessive emojis
- Rainbow charts
- Artificial "AI" aesthetic
- Excessive pill-shaped controls
- Every element inside a card

## Desired aesthetic

Think:

    Quiet
    Editorial
    Functional
    Personal
    Mature
    Minimal

---

# 15. COLOR SYSTEM

Use a restrained neutral palette.

Primary background:

    Off-white / very light neutral

Primary text:

    Near-black

Secondary text:

    Muted gray

Borders:

    Light gray

Accent:

    ONE restrained accent color

Success:

    Muted green

Warning:

    Muted amber

Error:

    Muted red

The accent should be used primarily for:

- Primary action
- Selection
- Focus
- Progress
- Important interactive states

It should NOT be sprayed across the UI.

---

# 16. TYPOGRAPHY

Primary font:

    System sans-serif

Android's platform typography should be preferred.

Typography hierarchy:

    Display
    Headline
    Title
    Body
    Caption

Do not use:

- Futuristic fonts
- Handwriting fonts
- Decorative fonts
- Multiple font families

The application should feel readable after long periods of use.

---

# 17. LAYOUT SYSTEM

Use a consistent spacing scale.

Suggested base unit:

    4dp

Common spacing:

    4dp
    8dp
    12dp
    16dp
    24dp
    32dp

Screen horizontal padding:

    approximately 20–24dp

Touch targets:

    approximately 48dp

Do not cram information onto screens.

White space is intentional.

---

# 18. SHAPES

Use modest corner radii.

Examples:

    8dp
    12dp

Avoid:

    30dp+
    excessive pills
    fully rounded everything

Cards should only exist when they communicate grouping.

---

# 19. ANIMATION PHILOSOPHY

The application should have **minimal purposeful motion**.

Allowed:

- Checkbox transition
- Screen transition
- Progress update
- Subtle milestone completion
- Small focus timer transitions

Not allowed:

- Continuous floating animations
- Pulsing everything
- Gradient animations
- Particle systems
- Bouncing buttons
- Fake "AI thinking" animations
- Decorative motion
- Animation on every screen element

Animation principle:

> If removing the animation doesn't reduce comprehension, remove it.

Respect Android's reduced-motion preferences where applicable.

---

# 20. ICONOGRAPHY

Use one icon family consistently.

Prefer:

- Simple line icons
- Android/Material icons
- Familiar symbols

Avoid:

- 3D icons
- Multiple icon styles
- Decorative emoji replacing UI icons

Emoji may be used sparingly for personal goal categories, but they should never become the primary visual language.

---

# 21. DARK MODE

Dark mode should not simply invert colors.

Use:

    Dark neutral background
    Light text
    Muted secondary text
    Restrained accent
    Low-contrast surfaces

Avoid pure black + bright neon colors.

---

# 22. ACCESSIBILITY

The application must support:

- Dynamic font scaling
- Screen readers
- Adequate contrast
- Large touch targets
- Content descriptions
- Keyboard navigation where relevant
- Reduced motion
- No information communicated only through color

---

# 23. TECHNICAL ARCHITECTURE

## Technology stack

    Kotlin
       ↓
    Android
       ↓
    Jetpack Compose
       ↓
    Navigation
       ↓
    ViewModel
       ↓
    Use Cases
       ↓
    Repository
       ↓
    Room
       ↓
    Local database

Supporting technologies:

    DataStore
    Kotlin Coroutines
    WorkManager
    Android notification APIs
    Android Alarm APIs where appropriate
    Android Biometric APIs
    Android Storage Access Framework
    Gradle
    GitHub
    GitHub Actions

---

# 24. WHY KOTLIN

Kotlin is the primary Android language.

Advantages:

- Modern Android ecosystem
- Null safety
- Coroutines
- Less boilerplate
- Strong Jetpack integration
- Excellent tooling
- Maintainable codebase

Java knowledge remains useful because Kotlin uses many familiar concepts:

- Classes
- Objects
- Interfaces
- Generics
- Collections
- OOP
- Control flow

---

# 25. WHY JETPACK COMPOSE

Compose allows the UI to be expressed as state-driven components.

Example:

    Database state
          ↓
       ViewModel
          ↓
        UI state
          ↓
       Compose UI

When the task changes:

    Task incomplete
          ↓
    User checks task
          ↓
    Database updated
          ↓
    State updated
          ↓
    UI recomposes

This is cleaner for a modern Android application than building a large XML-based UI system.

---

# 26. APPLICATION ARCHITECTURE

Use a layered architecture.

    UI
     ↓
    ViewModel
     ↓
    Use Case
     ↓
    Repository
     ↓
    Data Source
     ↓
    Room

Example:

    TaskScreen
        ↓
    TaskViewModel
        ↓
    CompleteTaskUseCase
        ↓
    TaskRepository
        ↓
    TaskDao
        ↓
    Room

---

# 27. PROJECT STRUCTURE

Suggested structure:

    app/
    └── src/main/java/com/example/app/

        core/
        ├── database/
        ├── notification/
        ├── scheduling/
        ├── preferences/
        ├── navigation/
        └── utilities/

        data/
        ├── local/
        │   ├── dao/
        │   ├── entity/
        │   └── database/
        │
        └── repository/

        domain/
        ├── model/
        └── usecase/

        feature/
        ├── onboarding/
        ├── today/
        ├── goals/
        ├── tasks/
        ├── progress/
        ├── focus/
        ├── journal/
        ├── reflection/
        └── settings/

        ui/
        ├── components/
        ├── theme/
        └── navigation/

---

# 28. DATABASE

Room is the local source of truth.

## Goal

    Goal
    ├── id
    ├── title
    ├── why
    ├── vision
    ├── futureSelf
    ├── targetDate
    ├── isPrimary
    ├── status
    ├── createdAt
    └── updatedAt

## Milestone

    Milestone
    ├── id
    ├── goalId
    ├── title
    ├── description
    ├── targetDate
    ├── position
    ├── status
    └── createdAt

## Task

    Task
    ├── id
    ├── goalId
    ├── milestoneId
    ├── title
    ├── description
    ├── priority
    ├── dueDate
    ├── estimatedMinutes
    ├── completed
    ├── createdAt
    └── completedAt

## JournalEntry

    JournalEntry
    ├── id
    ├── goalId
    ├── content
    ├── createdAt
    └── updatedAt

## Reflection

    Reflection
    ├── id
    ├── goalId
    ├── date
    ├── mood
    ├── accomplishment
    ├── difficulty
    ├── tomorrowFocus
    └── createdAt

## Affirmation

    Affirmation
    ├── id
    ├── goalId
    ├── text
    ├── enabled
    └── createdAt

## VisionImage

    VisionImage
    ├── id
    ├── goalId
    ├── localUri
    ├── caption
    ├── position
    └── createdAt

## FocusSession

    FocusSession
    ├── id
    ├── goalId
    ├── taskId
    ├── startedAt
    ├── endedAt
    └── durationMinutes

## Reminder

    Reminder
    ├── id
    ├── goalId
    ├── type
    ├── scheduledAt
    ├── message
    └── status

---

# 29. DATA RELATIONSHIPS

    Goal
      │
      ├── Milestones
      │      │
      │      └── Tasks
      │
      ├── Journal Entries
      │
      ├── Reflections
      │
      ├── Affirmations
      │
      └── Vision Images

Tasks and focus sessions connect activity back to goals.

---

# 30. LOCAL-FIRST DATA FLOW

The local database is authoritative.

    User action
        ↓
    ViewModel
        ↓
    Use Case
        ↓
    Repository
        ↓
    Room
        ↓
    Database updated
        ↓
    Flow emits new state
        ↓
    ViewModel
        ↓
    Compose UI

This ensures the UI remains consistent.

---

# 31. BACKEND STRATEGY

## V1

There is intentionally **NO required backend**.

This means:

    App
      ↓
    Local Room DB

No server is necessary for:

- Goals
- Tasks
- Reminders
- Motivation templates
- Journal
- Reflections
- Progress
- Focus sessions

This keeps operating costs extremely low.

---

# 32. FUTURE BACKEND

If users later demand:

- Cloud backup
- Cross-device synchronization
- Account login
- Web application
- Multi-device access

then introduce an optional backend.

The backend should NOT become a requirement for using the app.

Possible architecture:

    Android
       ↓
    Local Room
       ↓
    Sync Engine
       ↓
    Optional API
       ↓
    PostgreSQL

A managed PostgreSQL backend such as Supabase can be considered at that stage.

Alternative:

    Firebase Authentication
    Firestore
    Cloud Storage

The backend choice should be made only when the requirement actually exists.

---

# 33. OFFLINE-FIRST SYNC MODEL — FUTURE

If cloud sync is introduced:

    Local database
          ↓
    Outbox
          ↓
    Sync engine
          ↓
    Server
          ↓
    Other devices

The local database remains usable even when offline.

When internet returns:

    Local changes
          ↓
    Sync
          ↓
    Conflict resolution
          ↓
    Updated local state

---

# 34. NOTIFICATION ARCHITECTURE

Components:

    ReminderPreferences
          ↓
    ReminderPlanner
          ↓
    ReminderScheduler
          ↓
    Android scheduler
          ↓
    ReminderReceiver
          ↓
    NotificationManager

The application should use the least-privileged Android scheduling mechanism that satisfies the feature.

Avoid unnecessary exact-alarm permissions.

---

# 35. NOTIFICATION PERMISSION FLOW

On supported Android versions requiring runtime notification permission:

    User enables reminders
          ↓
    Explain benefit
          ↓
    Request notification permission
          ↓
    User allows
          ↓
    Schedule reminders

If denied:

    Reminder settings
          ↓
    Explain notifications are disabled
          ↓
    Provide system settings path

The application must remain functional without notifications.

---

# 36. REMINDER ALGORITHM

Input:

    Morning window
    Optional additional windows
    Daily reminder count
    Quiet hours
    Active goals

Process:

    1. Load settings.
    2. Determine eligible reminder windows.
    3. Generate candidate times.
    4. Remove times inside quiet hours.
    5. Remove times too close to other reminders.
    6. Select final reminder times.
    7. Associate each reminder with a goal.
    8. Generate message.
    9. Schedule locally.

Example:

    User:
    2 reminders

    Morning:
    06:00–10:00

    Day:
    12:00–18:00

    Result:

    08:21
    15:43

---

# 37. MOTIVATION ENGINE

V1 does NOT require AI.

It uses deterministic templates.

Inputs:

    Goal
    WHY
    Vision
    Future Me
    Progress
    Streak
    Recent tasks
    Time of day

Example:

    IF morning
       → WHY reminder

    IF afternoon
       → Action reminder

    IF evening
       → Reflection reminder

    IF milestone completed
       → Celebration

    IF streak >= 7
       → Streak message

The system selects from a controlled library of templates.

---

# 38. WHY AI IS NOT REQUIRED FOR V1

Using AI would introduce:

- API costs
- Internet dependency
- Privacy concerns
- Latency
- Failure modes
- Backend infrastructure
- More complicated data handling

The application can already produce meaningful personalized messages from local user data.

AI can be introduced later as an optional enhancement.

---

# 39. "WHAT SHOULD I DO NOW?" ALGORITHM

Rank incomplete tasks.

Example scoring:

    Due date importance
        +
    Priority
        +
    Primary goal
        +
    Milestone importance
        +
    Task age
        +
    Estimated effort suitability

Then choose the highest-scoring appropriate task.

The algorithm should remain explainable.

Example:

> Recommended because it is part of your primary goal and due today.

---

# 40. PROGRESS CALCULATION

Goal progress should be based on actual measurable components.

Example:

    Milestones:

    Java       100%
    DSA         60%
    Android     40%
    Portfolio   20%

Overall progress is calculated from milestone/task completion rather than arbitrary user activity.

Avoid statements such as:

> "You are 73% closer to success."

Instead:

> "73% of your planned milestones are complete."

---

# 41. STREAK ALGORITHM

A qualifying activity creates an active day.

Qualifying actions:

    Task completion
    Milestone completion
    Focus session
    Daily reflection
    Goal progress update

Multiple actions on one day still count as one active day.

Example:

    Monday     ACTIVE
    Tuesday    ACTIVE
    Wednesday  ACTIVE
    Thursday   INACTIVE
    Friday     ACTIVE

Current streak:

    1 day

Longest streak:

    3 days

---

# 42. JOURNAL DESIGN

The journal should be extremely simple.

    + New entry

    September 13

    "Today I..."

    [ Save ]

No:

- Likes
- Comments
- Followers
- Sharing
- Social feeds

This is a private space.

---

# 43. VISION BOARD STORAGE

Images should be copied into application-managed local storage rather than relying on unstable external references.

The application should:

1. Ask the user to select an image.
2. Copy/reference it using Android's supported storage APIs.
3. Store a local reference.
4. Display it in the goal's Vision section.

No server upload in V1.

---

# 44. BACKUP AND RESTORE

Although not part of the first 15 feature list, this is an important infrastructure feature.

Export:

    Goals
    Milestones
    Tasks
    Journal
    Reflections
    Affirmations
    Settings

into a portable backup format.

Example:

    goal-companion-backup.json

Potential future enhancement:

    encrypted backup

Restore:

    Select backup
        ↓
    Validate
        ↓
    Preview
        ↓
    Confirm
        ↓
    Import

---

# 45. SECURITY

The application should follow Android's application sandbox.

Do not:

- Log private journal text.
- Log WHY statements.
- Send goal data to analytics.
- Put personal content into crash logs.
- Upload vision-board images in V1.

Optional future:

    Biometric App Lock

---

# 46. PRIVACY MODEL

V1:

    User data
       ↓
    Device
       ↓
    Room database

No routine transmission to a server.

The app should minimize permissions.

Potential permission:

    POST_NOTIFICATIONS

Only when notifications are used.

Avoid:

    Location
    Contacts
    Microphone
    Camera
    SMS
    Call logs

unless a future feature genuinely requires them.

---

# 47. PERFORMANCE REQUIREMENTS

The application should be designed to work well on low-end Android devices.

Principles:

- Minimize dependencies.
- Avoid large image memory usage.
- Resize vision-board images.
- Use lazy lists.
- Avoid unnecessary recomposition.
- Avoid continuous background work.
- Keep database queries efficient.
- Avoid huge animations.
- Avoid video backgrounds.
- Avoid network dependencies.
- Avoid loading everything into memory.

Target experience:

    App launch
       ↓
    Fast
       ↓
    Home screen
       ↓
    Immediately interactive

---

# 48. OLD DEVICE SUPPORT

Compatibility should be determined by the minimum Android version supported by the chosen Android libraries and the desired device reach.

The product should prioritize:

    Broad compatibility
        +
    Modern APIs where available
        +
    Graceful degradation on older versions

Do not use modern Android functionality without checking its availability.

---

# 49. STATE MANAGEMENT

UI state should be explicit.

Example:

    Loading
    Success
    Empty
    Error

For tasks:

    TaskListState
      ├── tasks
      ├── loading
      ├── error
      └── filter

For goals:

    GoalDetailState
      ├── goal
      ├── milestones
      ├── nextTask
      ├── progress
      └── loading

---

# 50. ERROR HANDLING

The application should never silently fail.

Example:

Database failure:

> Something went wrong while saving your task.

Reminder failure:

> Your reminder could not be scheduled. Check notification settings.

Import failure:

> This backup file isn't valid.

All errors should be human-readable.

No raw stack traces shown to users.

---

# 51. APP LIFECYCLE

The application should assume:

- Process can be killed.
- User can force close.
- Device can restart.
- Battery saver can be enabled.
- Notification permission can change.
- Time zone can change.
- Date can change.
- Device can reboot.

Reminder scheduling must therefore be resilient.

The app should reschedule reminders when appropriate after device reboot or relevant configuration changes, subject to Android's background execution rules.

---

# 52. TIME ZONE HANDLING

Store scheduled timestamps carefully.

Use explicit date/time representations.

Consider:

- Time zone changes
- Daylight-saving changes
- Device clock changes
- Date boundaries

User-facing reminder windows should be based on the device's current local time.

---

# 53. NOTIFICATION CHANNELS

Separate notification purposes when useful.

Example:

    Goal reminders
    Task reminders
    Reflection reminders

The user can control notification categories through Android system settings.

The application should not create dozens of channels.

---

# 54. CI/CD

Use:

    GitHub
        ↓
    GitHub Actions
        ↓
    Gradle
        ↓
    Tests
        ↓
    Lint
        ↓
    Build
        ↓
    Signed AAB
        ↓
    Play Console

---

# 55. GIT BRANCHING

Simple strategy:

    main
      │
      ├── develop
      │
      └── feature/*
    
Example:

    feature/goal-creation
    feature/task-system
    feature/reminders
    feature/focus-mode

Pull request:

    Feature branch
         ↓
    Automated checks
         ↓
    Review
         ↓
    Merge
         ↓
    develop

Production release:

    develop
       ↓
    release
       ↓
    main
       ↓
    Tag v1.0.0

---

# 56. CI PIPELINE

Every pull request:

    Checkout
       ↓
    Setup JDK
       ↓
    Restore Gradle cache
       ↓
    ./gradlew lint
       ↓
    ./gradlew test
       ↓
    ./gradlew assembleDebug
       ↓
    Report result

No merge if critical checks fail.

---

# 57. RELEASE PIPELINE

On a release tag:

    Git tag
       ↓
    GitHub Actions
       ↓
    Lint
       ↓
    Unit tests
       ↓
    Instrumentation tests
       ↓
    Release build
       ↓
    Sign AAB
       ↓
    Artifact generated
       ↓
    Play Console upload
       ↓
    Internal testing
       ↓
    Closed testing
       ↓
    Production

Google Play should remain the final distribution authority.

---

# 58. SECRET MANAGEMENT

Never commit:

- Keystores
- Passwords
- API keys
- Play service-account JSON
- Backend credentials

Use:

    GitHub Actions Secrets

or an equivalent secure secret store.

---

# 59. RELEASE SIGNING

The production application must be signed.

Keep the signing credentials securely backed up.

Production signing material must never be placed inside Git.

---

# 60. TESTING STRATEGY

## Unit tests

Test:

- Goal progress
- Streak calculations
- Reminder randomization
- Task ranking
- Date calculations
- Motivation selection

## Database tests

Test:

- Create goal
- Update goal
- Delete goal
- Create task
- Complete task
- Query tasks
- Relationships

## UI tests

Test:

- Onboarding
- Creating goal
- Creating task
- Completing task
- Navigation
- Focus mode

## Device tests

Test:

- Old Android phone
- Mid-range phone
- Recent Android phone
- Different screen sizes
- Dark mode
- Large font
- No internet
- Battery saver
- Device reboot

---

# 61. TESTING THE OFFLINE EXPERIENCE

This is mandatory.

Test:

    Internet ON
       ↓
    Create goal

    Internet OFF
       ↓
    Create task

    Internet OFF
       ↓
    Complete task

    Internet OFF
       ↓
    Journal entry

    Internet OFF
       ↓
    Progress

Everything should continue working.

---

# 62. PLAY STORE PREPARATION

Required production assets/processes include:

- Application name
- Application icon
- Screenshots
- Store description
- Privacy policy
- Data safety declarations
- Content rating
- Target audience information
- App bundle
- Testing
- Release notes

Declarations must accurately reflect the actual application and all included SDKs.

---

# 63. APPLICATION ID

Use a permanent application ID.

Example:

    com.yourname.goalcompanion

Once published, avoid changing it.

---

# 64. VERSIONING

Use:

    versionName
    versionCode

Example:

    1.0.0
    1.0.1
    1.1.0
    2.0.0

Semantic-style versioning can be used internally.

---

# 65. PRODUCT ANALYTICS

The product is privacy-first.

Therefore, V1 should avoid unnecessary tracking.

Product learning can come from:

- Tester interviews
- Reviews
- Optional feedback
- Local statistics
- Crash diagnostics that don't expose personal content

If remote analytics are eventually introduced, privacy requirements must be reassessed.

---

# 66. BUSINESS MODEL

V1:

    Revenue = ₹0

No:

    Ads
    Subscription
    Premium tier
    Paid motivation

The objective of V1 is:

    Build
      ↓
    Publish
      ↓
    Acquire users
      ↓
    Learn
      ↓
    Improve

---

# 67. PRODUCT SUCCESS METRICS

The most important metric is:

## Meaningful Progress Days

A day counts when the user performs a meaningful action.

Examples:

    Complete task
    Focus session
    Reflection
    Milestone completion

Secondary metrics:

    Goals created
    Tasks completed
    Active days
    Focus sessions
    Journal entries
    Weekly reflections
    Notification interactions

The goal is not maximum screen time.

The goal is meaningful progress.

---

# 68. NOTIFICATION SUCCESS METRIC

A notification is successful if it helps the user take meaningful action.

Conceptual funnel:

    Notification
       ↓
    User opens
       ↓
    Goal viewed
       ↓
    Task started
       ↓
    Task completed

Do not optimize simply for notification opens.

---

# 69. PRODUCT ANTI-GOALS

The application should NOT become:

### Another social network

No followers.

No public profiles.

No likes.

### Another AI wrapper

No chatbot-first experience.

### Another dopamine machine

No unnecessary rewards.

### Another complicated project manager

No 50-field task creation form.

### Another generic quote app

User-specific WHY should matter more than generic quotes.

---

# 70. FIRST-LAUNCH EXPERIENCE

The user should reach their first goal in approximately a few minutes.

Ideal flow:

    Welcome
       ↓
    Goal
       ↓
    WHY
       ↓
    Vision
       ↓
    First milestone
       ↓
    First task
       ↓
    Reminder settings
       ↓
    TODAY

Avoid lengthy onboarding.

Optional information can be collected later.

---

# 71. FIRST DAY EXPERIENCE

After onboarding:

    TODAY

    Your goal:

    Become a Software Engineer

    Your WHY:

    "I want financial independence..."

    First task:

    Study Java for 30 minutes

    [ Start Focus ]

The application should immediately help the user act.

---

# 72. FIRST MORNING

Morning reminder:

> Remember what you're building.

Then:

> Your goal: Become a Software Engineer.

Then:

> Why: I want financial independence.

Then:

> Today's first step: Study Java.

The notification should be short enough to read quickly.

---

# 73. FIRST WEEK

The application gradually learns the user's usage patterns locally.

At the end of the week:

    YOUR FIRST WEEK

    5 active days
    12 tasks completed
    4 focus sessions
    1 milestone completed

    You started.

    Keep building.

---

# 74. FIRST MONTH

Show:

    30 DAYS

    18 active days
    47 tasks
    9 focus sessions
    3 milestones

    Your first day:
    "I want to become..."

    Today:
    "I'm still working toward it."

This reinforces continuity.

---

# 75. FUTURE SELF EXPERIENCE

After sufficient history:

    YOU STARTED WITH:

    "I want to become a
    software engineer."

    TODAY:

    47 tasks completed
    3 milestones completed
    38 hours focused

    You are still building.

This is a core emotional experience.

---

# 76. UX WRITING STYLE

The language should be:

- Short
- Human
- Calm
- Direct
- Encouraging

Use:

> Keep going.

> What's one thing you can do today?

> Remember why you started.

> Small progress still counts.

Avoid:

> YOU'RE DESTROYING YOUR GOALS!!! 🔥🔥🔥

Avoid:

> Unlock your ultimate potential with AI-powered transformation.

Avoid exaggerated promises.

---

# 77. MOTIVATION STYLE

The app should never shame the user.

Never:

> You failed today.

Never:

> You're falling behind.

Prefer:

> Today didn't go as planned. That's okay.

> Start with one small thing.

> Tomorrow is another opportunity.

---

# 78. MANIFESTATION POSITIONING

The app may use manifestation-inspired concepts such as:

- Vision
- Future self
- Affirmations
- Visualization

But it should not make claims that visualization alone causes external outcomes.

The product philosophy remains:

    Vision
      +
    Action
      +
    Consistency

---

# 79. FEATURE PRIORITY

## P0 — Core

    Goals
    WHY
    Milestones
    Tasks
    Today
    Local database

## P1 — Signature

    Morning reminders
    Random reminders
    Motivation engine
    Progress
    Streaks
    Focus mode

## P2 — Personalization

    Future Me
    Vision board
    Affirmations
    Journal
    Weekly reflection
    Timeline

## P3 — Future

    Backup
    Cloud sync
    AI
    iOS
    Widgets
    Wear OS

---

# 80. DEVELOPMENT MILESTONES

## Milestone 1

Project setup.

Deliver:

    Kotlin
    Compose
    Navigation
    Theme
    Git repository
    CI

## Milestone 2

Database.

Deliver:

    Goal
    Milestone
    Task
    Room

## Milestone 3

Onboarding.

Deliver:

    Goal creation
    WHY
    Vision
    Future Me

## Milestone 4

Task system.

Deliver:

    Create
    Edit
    Delete
    Complete
    Priority
    Due date

## Milestone 5

Today screen.

Deliver:

    Today's tasks
    Primary goal
    Progress

## Milestone 6

Notification engine.

Deliver:

    Permission
    Channels
    Morning reminders
    Random reminders

## Milestone 7

Motivation.

Deliver:

    Template engine
    WHY messages
    Progress messages
    Action messages

## Milestone 8

Progress.

Deliver:

    Streak
    Momentum
    Statistics
    Timeline

## Milestone 9

Personal growth.

Deliver:

    Journal
    Reflection
    Affirmations
    Vision board

## Milestone 10

Polish.

Deliver:

    Accessibility
    Dark mode
    Performance
    Error handling
    Backup

## Milestone 11

Release.

Deliver:

    Signed AAB
    Play listing
    Internal testing
    Closed testing
    Production release

---

# 81. DEFINITION OF DONE — V1

The application is ready for public production consideration when:

- Goal creation works.
- WHY works.
- Milestones work.
- Tasks work.
- Data survives app restart.
- Core functionality works offline.
- Notifications work where permitted.
- Morning reminders work.
- Random reminders work.
- Reminder limits are respected.
- Focus mode works.
- Progress is calculated correctly.
- Streaks are calculated correctly.
- Journal works.
- Reflection works.
- Vision board works.
- Affirmations work.
- Application handles reboot appropriately.
- Application handles notification denial gracefully.
- Application handles large text.
- Application handles dark mode.
- No critical crashes exist.
- Release AAB is correctly signed.
- Play Console requirements are completed accurately.

---

# 82. FINAL PRODUCT ARCHITECTURE

The complete system:

                    USER
                      │
                      ▼
                ┌───────────┐
                │   TODAY   │
                └─────┬─────┘
                      │
             ┌────────┼────────┐
             ▼        ▼        ▼
           GOALS     TASKS   PROGRESS
             │        │        │
             ▼        ▼        │
          MILESTONE  ACTION     │
             │        │        │
             └────────┼────────┘
                      ▼
                  ROOM DB
                      │
             ┌────────┼─────────┐
             ▼        ▼         ▼
          JOURNAL  REFLECTION  FOCUS
                      │
                      ▼
              REMINDER ENGINE
                      │
             ┌────────┴────────┐
             ▼                 ▼
        MORNING NUDGE     RANDOM NUDGE
             │                 │
             └────────┬────────┘
                      ▼
                 MOTIVATION
                      │
                      ▼
                   ACTION
                      │
                      ▼
                  PROGRESS
                      │
                      ▼
                 REFLECTION
                      │
                      └──────────→ NEXT DAY

---

# 83. COMPLETE TECHNOLOGY STACK

## Mobile

    Kotlin
    Jetpack Compose
    Android SDK

## Architecture

    MVVM
    Repository pattern
    Use-case/domain layer

## Local persistence

    Room
    DataStore

## Asynchronous operations

    Kotlin Coroutines
    Flow

## Background work

    WorkManager
    Android-supported alarm/scheduling APIs where appropriate

## Notifications

    NotificationManager
    Notification Channels
    POST_NOTIFICATIONS

## Security

    Android Keystore
    Biometric APIs where required

## Media

    Android Storage Access Framework

## Testing

    JUnit
    AndroidX Test
    Compose UI testing

## Version control

    Git
    GitHub

## CI/CD

    GitHub Actions
    Gradle
    Android build tools

## Distribution

    Google Play Console
    Android App Bundle

## Backend

    None for core V1

## Future backend

    PostgreSQL + optional API/sync service

---

# 84. PRODUCT NORTH STAR

The application should answer one question every day:

> **"Did I move closer to the person I want to become?"**

Not:

> How many notifications did the user open?

Not:

> How many hours did they spend inside the app?

Not:

> How many badges did they collect?

The application succeeds when the user **opens it, remembers why, takes meaningful action, and eventually needs the app less because they've developed their own consistency.**

---

# 85. FINAL PRODUCT DEFINITION

Personal Goal Companion is:

> **A free, private, offline-first Android application that connects long-term goals with daily actions, personal motivation, meaningful reminders, reflection, and measurable progress.**

Its defining loop is:

    REMEMBER WHY
         ↓
    KNOW WHAT TO DO
         ↓
    TAKE ACTION
         ↓
    TRACK IT
         ↓
    REFLECT
         ↓
    SEE HOW FAR YOU'VE COME
         ↓
    REMEMBER WHY
         ↓
         ↻

The product should remain intentionally simple.

Technology should disappear behind the experience.

The user should never think:

> "This is a sophisticated software system."

They should think:

> **"This helps me stay connected to what matters to me."**