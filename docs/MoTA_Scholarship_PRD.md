<!-- Page 1 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
PRODUCT REQUIREMENTS DOCUMENT (PRD)
Unified Scholarship Mobile Application for Tribal Students
Ministry of Tribal Affairs (MoTA) | Problem Statement ID: 26238
Version 1.0.0 | Date: 2026-09-12
</div>
Table of Contents
- [1. Executive Summary](#1.-executive-summary)
- [2. Objective & Vision](#2.-objective--vision)
- [3. Problem Statement & Proposed Solution](#3.-problem-statement--proposed-solution)
- [4. Target Audience & User Personas](#4.-target-audience--user-personas)
- [5. Core Product Modules & Requirements](#5.-core-product-modules--requirements)
- [6. Technical Architecture (Offline-First, Low Network)](#6.-technical-
architecture-(offline-first-low-network))
- [7. Data Models & Database Schema](#7.-data-models--database-schema)
- [8. API Specifications & Integrations](#8.-api-specifications--integrations)
- [9. User Interface (UI) & User Experience (UX)](#9.-user-interface-(ui)--user-
experience-(ux))
- [10. CI/CD Pipeline & DevOps](#10.-ci/cd-pipeline--devops)
- [11. Security, Privacy & Compliance](#11.-security-privacy--compliance)
- [12. Quality Assurance & Test Strategy](#12.-quality-assurance--test-strategy)
Page 1

<!-- Page 2 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- [13. Risk Management & Mitigation](#13.-risk-management--mitigation)
- [14. Go-to-Market Strategy](#14.-go-to-market-strategy)
- [15. Exhaustive User Stories Matrix](#15.-exhaustive-user-stories-matrix)
- [16. Technical API Key & Mock Data Specs](#16.-technical-api-key--mock-data-specs)
- [17. Operations & Maintenance](#17.-operations--maintenance)
- [18. Legal & DPDP Act Alignment](#18.-legal--dpdp-act-alignment)
- [19. Glossary](#19.-glossary)
- [20. Future Roadmap](#20.-future-roadmap)
1. Executive Summary
The Ministry of Tribal Affairs (MoTA) currently administers five core scholarship schemes
for Scheduled Tribe (ST) students: Pre-Matric, Post-Matric, Top Class, National Fellowship
(NFST), and National Overseas Scholarship (NOS). These schemes are fragmented across the
National Scholarship Portal (NSP), the Scholarship Fellowship Management Portal (SFMP),
and a standalone NOS portal. This fragmentation creates immense friction. Students must
repeatedly upload the same documents, track statuses across different UI paradigms, and
lack a unified view of their eligibility. Furthermore, the Ministry lacks a unified
intelligence layer to identify eligible but unreached students. This PRD outlines the
architecture, features, and technical execution for a Unified Scholarship Intelligence &
Verification Platform. It is not just a form-filling app, but a unified student profile,
document wallet, multi-source verification engine, and ministry intelligence dashboard. We
are creating a paradigm shift from 'applying for a scheme' to 'maintaining a verified
digital identity'.
The Ministry of Tribal Affairs (MoTA) currently administers five core scholarship schemes
for Scheduled Tribe (ST) students: Pre-Matric, Post-Matric, Top Class, National Fellowship
(NFST), and National Overseas Scholarship (NOS). These schemes are fragmented across the
National Scholarship Portal (NSP), the Scholarship Fellowship Management Portal (SFMP),
and a standalone NOS portal. This fragmentation creates immense friction. Students must
repeatedly upload the same documents, track statuses across different UI paradigms, and
lack a unified view of their eligibility. Furthermore, the Ministry lacks a unified
intelligence layer to identify eligible but unreached students. This PRD outlines the
architecture, features, and technical execution for a Unified Scholarship Intelligence &
Verification Platform. It is not just a form-filling app, but a unified student profile,
document wallet, multi-source verification engine, and ministry intelligence dashboard. We
Page 2

<!-- Page 3 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
are creating a paradigm shift from 'applying for a scheme' to 'maintaining a verified
digital identity'.
The Ministry of Tribal Affairs (MoTA) currently administers five core scholarship schemes
for Scheduled Tribe (ST) students: Pre-Matric, Post-Matric, Top Class, National Fellowship
(NFST), and National Overseas Scholarship (NOS). These schemes are fragmented across the
National Scholarship Portal (NSP), the Scholarship Fellowship Management Portal (SFMP),
and a standalone NOS portal. This fragmentation creates immense friction. Students must
repeatedly upload the same documents, track statuses across different UI paradigms, and
lack a unified view of their eligibility. Furthermore, the Ministry lacks a unified
intelligence layer to identify eligible but unreached students. This PRD outlines the
architecture, features, and technical execution for a Unified Scholarship Intelligence &
Verification Platform. It is not just a form-filling app, but a unified student profile,
document wallet, multi-source verification engine, and ministry intelligence dashboard. We
are creating a paradigm shift from 'applying for a scheme' to 'maintaining a verified
digital identity'.
The Ministry of Tribal Affairs (MoTA) currently administers five core scholarship schemes
for Scheduled Tribe (ST) students: Pre-Matric, Post-Matric, Top Class, National Fellowship
(NFST), and National Overseas Scholarship (NOS). These schemes are fragmented across the
National Scholarship Portal (NSP), the Scholarship Fellowship Management Portal (SFMP),
and a standalone NOS portal. This fragmentation creates immense friction. Students must
repeatedly upload the same documents, track statuses across different UI paradigms, and
lack a unified view of their eligibility. Furthermore, the Ministry lacks a unified
intelligence layer to identify eligible but unreached students. This PRD outlines the
architecture, features, and technical execution for a Unified Scholarship Intelligence &
Verification Platform. It is not just a form-filling app, but a unified student profile,
document wallet, multi-source verification engine, and ministry intelligence dashboard. We
are creating a paradigm shift from 'applying for a scheme' to 'maintaining a verified
digital identity'.
The Ministry of Tribal Affairs (MoTA) currently administers five core scholarship schemes
for Scheduled Tribe (ST) students: Pre-Matric, Post-Matric, Top Class, National Fellowship
(NFST), and National Overseas Scholarship (NOS). These schemes are fragmented across the
National Scholarship Portal (NSP), the Scholarship Fellowship Management Portal (SFMP),
and a standalone NOS portal. This fragmentation creates immense friction. Students must
repeatedly upload the same documents, track statuses across different UI paradigms, and
lack a unified view of their eligibility. Furthermore, the Ministry lacks a unified
intelligence layer to identify eligible but unreached students. This PRD outlines the
Page 3

<!-- Page 4 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
architecture, features, and technical execution for a Unified Scholarship Intelligence &
Verification Platform. It is not just a form-filling app, but a unified student profile,
document wallet, multi-source verification engine, and ministry intelligence dashboard. We
are creating a paradigm shift from 'applying for a scheme' to 'maintaining a verified
digital identity'.
2. Objective & Vision
Vision: 'Enter Once. Verify Once. Apply Anywhere.'
To create a unified, low-bandwidth optimized, offline-capable mobile platform that
democratizes access to MoTA scholarships for ST students, while empowering the government
with actionable intelligence on beneficiary coverage.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
Page 4

<!-- Page 5 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
Page 5

<!-- Page 6 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
The core objective is to reduce cognitive load on ST students. The system will leverage
API Setu and DigiLocker to auto-fetch credentials, minimizing manual data entry. For
government administrators, the objective is to provide macro-level visibility into
district-wise ST enrollment versus active beneficiaries, enabling proactive outreach.
4. Target Audience & User Personas
Persona 1: Kiran (District Nodal Officer)
- Demographics: Age 41, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
Page 6

<!-- Page 7 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
Persona 2: Vikram (Pre-Matric Student)
- Demographics: Age 16, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
Persona 3: Kiran (Pre-Matric Student)
- Demographics: Age 37, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
Page 7

<!-- Page 8 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
Persona 4: Vikram (Pre-Matric Student)
- Demographics: Age 25, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
Persona 5: Anitha (NFST Scholar)
- Demographics: Age 26, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
Persona 6: Kiran (Pre-Matric Student)
- Demographics: Age 32, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
Page 8

<!-- Page 9 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
Persona 7: Anitha (District Nodal Officer)
- Demographics: Age 20, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
Persona 8: Neha (District Nodal Officer)
- Demographics: Age 36, Location: Rural Tribal District.
- Tech Literacy & Network: Intermittent 3G, uses basic Android smartphone.
- Pain Points: Repeated document uploads failing due to timeouts. Opacity in DBT payment
status.
- Goals: Wants to see exactly why an application is pending and get offline access to
records.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
Page 9

<!-- Page 28 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
to data costs. Will only use the app if it performs well offline.
- Behavioral Context: Prefers visual icons (green checkmarks) over text. Highly sensitive
to data costs. Will only use the app if it performs well offline.
6. Technical Architecture (Offline-First, Low Network)
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
Page 28

<!-- Page 29 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
Page 29

<!-- Page 30 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
Page 30

<!-- Page 31 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
Page 31

<!-- Page 32 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
Page 32

<!-- Page 33 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
Frontend Architecture (Flutter)
The mobile app relies on Flutter for its high performance and cross-platform capability.
State management uses Riverpod with code generation for immutable state. Local caching is
achieved via Isar (a highly performant NoSQL local database). All assets (icons,
illustrations) use SVGs instead of PNGs to keep the app size under 15MB. Network requests
Page 33

<!-- Page 34 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
use the Dio package with custom interceptors that queue failed requests locally when
offline, and dispatch them seamlessly via WorkManager once connectivity is restored.
Backend Architecture (Supabase)
PostgreSQL provides ACID compliance. Row Level Security (RLS) ensures that a student can
only read their own documents. Edge Functions handle integrations with external adapters
(API Setu) to avoid blocking the main database thread. The API layer is strictly RESTful,
serving GZIP-compressed JSON payloads to minimize bandwidth.
7. Data Models & Database Schema
Table: mota_domain_schema_001
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 1 field 14. |
Indexes: CREATE INDEX idx_mota_1_col_1 ON mota_domain_schema_1(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_1 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_002
| Column Name | Data Type | Constraint | Description |
Page 34

<!-- Page 35 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 2 field 14. |
Indexes: CREATE INDEX idx_mota_2_col_1 ON mota_domain_schema_2(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_2 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_003
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 3 field 14. |
Indexes: CREATE INDEX idx_mota_3_col_1 ON mota_domain_schema_3(col_1);
Page 35

<!-- Page 36 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_3 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_004
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 4 field 14. |
Indexes: CREATE INDEX idx_mota_4_col_1 ON mota_domain_schema_4(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_4 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_005
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 10. |
Page 36

<!-- Page 37 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 5 field 14. |
Indexes: CREATE INDEX idx_mota_5_col_1 ON mota_domain_schema_5(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_5 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_006
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 6 field 14. |
Indexes: CREATE INDEX idx_mota_6_col_1 ON mota_domain_schema_6(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_6 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_007
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 5. |
Page 37

<!-- Page 38 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 7 field 14. |
Indexes: CREATE INDEX idx_mota_7_col_1 ON mota_domain_schema_7(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_7 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_008
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 8 field 14. |
Indexes: CREATE INDEX idx_mota_8_col_1 ON mota_domain_schema_8(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_8 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_009
| Column Name | Data Type | Constraint | Description |
Page 38

<!-- Page 39 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 10. |
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 11. |
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 12. |
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 13. |
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 9 field 14. |
Indexes: CREATE INDEX idx_mota_9_col_1 ON mota_domain_schema_9(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_9 FOR SELECT USING (auth.uid()
= user_id);
Table: mota_domain_schema_010
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 12.
|
Page 39

<!-- Page 40 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 10 field 14.
|
Indexes: CREATE INDEX idx_mota_10_col_1 ON mota_domain_schema_10(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_10 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_011
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 11 field 14.
|
Indexes: CREATE INDEX idx_mota_11_col_1 ON mota_domain_schema_11(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_11 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_012
| Column Name | Data Type | Constraint | Description |
Page 40

<!-- Page 41 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 12 field 14.
|
Indexes: CREATE INDEX idx_mota_12_col_1 ON mota_domain_schema_12(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_12 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_013
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 10.
Page 41

<!-- Page 42 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 13 field 14.
|
Indexes: CREATE INDEX idx_mota_13_col_1 ON mota_domain_schema_13(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_13 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_014
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 14 field 14.
|
Indexes: CREATE INDEX idx_mota_14_col_1 ON mota_domain_schema_14(col_1);
Page 42

<!-- Page 43 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_14 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_015
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 15 field 14.
|
Indexes: CREATE INDEX idx_mota_15_col_1 ON mota_domain_schema_15(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_15 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_016
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 5. |
Page 43

<!-- Page 44 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 16 field 14.
|
Indexes: CREATE INDEX idx_mota_16_col_1 ON mota_domain_schema_16(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_16 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_017
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 12.
|
Page 44

<!-- Page 45 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 17 field 14.
|
Indexes: CREATE INDEX idx_mota_17_col_1 ON mota_domain_schema_17(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_17 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_018
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 18 field 14.
|
Indexes: CREATE INDEX idx_mota_18_col_1 ON mota_domain_schema_18(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_18 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_019
| Column Name | Data Type | Constraint | Description |
Page 45

<!-- Page 46 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 19 field 14.
|
Indexes: CREATE INDEX idx_mota_19_col_1 ON mota_domain_schema_19(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_19 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_020
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 10.
Page 46

<!-- Page 47 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 20 field 14.
|
Indexes: CREATE INDEX idx_mota_20_col_1 ON mota_domain_schema_20(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_20 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_021
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 21 field 14.
|
Indexes: CREATE INDEX idx_mota_21_col_1 ON mota_domain_schema_21(col_1);
Page 47

<!-- Page 48 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_21 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_022
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 22 field 14.
|
Indexes: CREATE INDEX idx_mota_22_col_1 ON mota_domain_schema_22(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_22 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_023
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 5. |
Page 48

<!-- Page 49 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 23 field 14.
|
Indexes: CREATE INDEX idx_mota_23_col_1 ON mota_domain_schema_23(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_23 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_024
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 12.
|
Page 49

<!-- Page 50 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 24 field 14.
|
Indexes: CREATE INDEX idx_mota_24_col_1 ON mota_domain_schema_24(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_24 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_025
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 25 field 14.
|
Indexes: CREATE INDEX idx_mota_25_col_1 ON mota_domain_schema_25(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_25 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_026
| Column Name | Data Type | Constraint | Description |
Page 50

<!-- Page 51 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 26 field 14.
|
Indexes: CREATE INDEX idx_mota_26_col_1 ON mota_domain_schema_26(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_26 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_027
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 10.
Page 51

<!-- Page 52 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 27 field 14.
|
Indexes: CREATE INDEX idx_mota_27_col_1 ON mota_domain_schema_27(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_27 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_028
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 28 field 14.
|
Indexes: CREATE INDEX idx_mota_28_col_1 ON mota_domain_schema_28(col_1);
Page 52

<!-- Page 53 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_28 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_029
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 29 field 14.
|
Indexes: CREATE INDEX idx_mota_29_col_1 ON mota_domain_schema_29(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_29 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_030
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 5. |
Page 53

<!-- Page 54 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 30 field 14.
|
Indexes: CREATE INDEX idx_mota_30_col_1 ON mota_domain_schema_30(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_30 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_031
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 12.
|
Page 54

<!-- Page 55 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 31 field 14.
|
Indexes: CREATE INDEX idx_mota_31_col_1 ON mota_domain_schema_31(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_31 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_032
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 32 field 14.
|
Indexes: CREATE INDEX idx_mota_32_col_1 ON mota_domain_schema_32(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_32 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_033
| Column Name | Data Type | Constraint | Description |
Page 55

<!-- Page 56 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 33 field 14.
|
Indexes: CREATE INDEX idx_mota_33_col_1 ON mota_domain_schema_33(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_33 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_034
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 10.
Page 56

<!-- Page 57 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 34 field 14.
|
Indexes: CREATE INDEX idx_mota_34_col_1 ON mota_domain_schema_34(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_34 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_035
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 35 field 14.
|
Indexes: CREATE INDEX idx_mota_35_col_1 ON mota_domain_schema_35(col_1);
Page 57

<!-- Page 58 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_35 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_036
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 36 field 14.
|
Indexes: CREATE INDEX idx_mota_36_col_1 ON mota_domain_schema_36(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_36 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_037
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 5. |
Page 58

<!-- Page 59 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 37 field 14.
|
Indexes: CREATE INDEX idx_mota_37_col_1 ON mota_domain_schema_37(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_37 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_038
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 12.
|
Page 59

<!-- Page 60 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 38 field 14.
|
Indexes: CREATE INDEX idx_mota_38_col_1 ON mota_domain_schema_38(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_38 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_039
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 39 field 14.
|
Indexes: CREATE INDEX idx_mota_39_col_1 ON mota_domain_schema_39(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_39 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_040
| Column Name | Data Type | Constraint | Description |
Page 60

<!-- Page 61 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 40 field 14.
|
Indexes: CREATE INDEX idx_mota_40_col_1 ON mota_domain_schema_40(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_40 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_041
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 10.
Page 61

<!-- Page 62 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 41 field 14.
|
Indexes: CREATE INDEX idx_mota_41_col_1 ON mota_domain_schema_41(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_41 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_042
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 42 field 14.
|
Indexes: CREATE INDEX idx_mota_42_col_1 ON mota_domain_schema_42(col_1);
Page 62

<!-- Page 63 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_42 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_043
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 43 field 14.
|
Indexes: CREATE INDEX idx_mota_43_col_1 ON mota_domain_schema_43(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_43 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_044
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 5. |
Page 63

<!-- Page 64 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 44 field 14.
|
Indexes: CREATE INDEX idx_mota_44_col_1 ON mota_domain_schema_44(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_44 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_045
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 12.
|
Page 64

<!-- Page 65 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 45 field 14.
|
Indexes: CREATE INDEX idx_mota_45_col_1 ON mota_domain_schema_45(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_45 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_046
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 46 field 14.
|
Indexes: CREATE INDEX idx_mota_46_col_1 ON mota_domain_schema_46(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_46 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_047
| Column Name | Data Type | Constraint | Description |
Page 65

<!-- Page 66 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 47 field 14.
|
Indexes: CREATE INDEX idx_mota_47_col_1 ON mota_domain_schema_47(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_47 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_048
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 10.
Page 66

<!-- Page 67 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 48 field 14.
|
Indexes: CREATE INDEX idx_mota_48_col_1 ON mota_domain_schema_48(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_48 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_049
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 49 field 14.
|
Indexes: CREATE INDEX idx_mota_49_col_1 ON mota_domain_schema_49(col_1);
Page 67

<!-- Page 68 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_49 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_050
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 50 field 14.
|
Indexes: CREATE INDEX idx_mota_50_col_1 ON mota_domain_schema_50(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_50 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_051
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 5. |
Page 68

<!-- Page 69 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 51 field 14.
|
Indexes: CREATE INDEX idx_mota_51_col_1 ON mota_domain_schema_51(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_51 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_052
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 12.
|
Page 69

<!-- Page 70 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 52 field 14.
|
Indexes: CREATE INDEX idx_mota_52_col_1 ON mota_domain_schema_52(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_52 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_053
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 53 field 14.
|
Indexes: CREATE INDEX idx_mota_53_col_1 ON mota_domain_schema_53(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_53 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_054
| Column Name | Data Type | Constraint | Description |
Page 70

<!-- Page 71 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 54 field 14.
|
Indexes: CREATE INDEX idx_mota_54_col_1 ON mota_domain_schema_54(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_54 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_055
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 10.
Page 71

<!-- Page 72 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 55 field 14.
|
Indexes: CREATE INDEX idx_mota_55_col_1 ON mota_domain_schema_55(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_55 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_056
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 56 field 14.
|
Indexes: CREATE INDEX idx_mota_56_col_1 ON mota_domain_schema_56(col_1);
Page 72

<!-- Page 73 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_56 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_057
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 57 field 14.
|
Indexes: CREATE INDEX idx_mota_57_col_1 ON mota_domain_schema_57(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_57 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_058
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 5. |
Page 73

<!-- Page 74 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 58 field 14.
|
Indexes: CREATE INDEX idx_mota_58_col_1 ON mota_domain_schema_58(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_58 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_059
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 12.
|
Page 74

<!-- Page 75 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 59 field 14.
|
Indexes: CREATE INDEX idx_mota_59_col_1 ON mota_domain_schema_59(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_59 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_060
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 60 field 14.
|
Indexes: CREATE INDEX idx_mota_60_col_1 ON mota_domain_schema_60(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_60 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_061
| Column Name | Data Type | Constraint | Description |
Page 75

<!-- Page 76 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 61 field 14.
|
Indexes: CREATE INDEX idx_mota_61_col_1 ON mota_domain_schema_61(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_61 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_062
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 10.
Page 76

<!-- Page 77 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 62 field 14.
|
Indexes: CREATE INDEX idx_mota_62_col_1 ON mota_domain_schema_62(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_62 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_063
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 63 field 14.
|
Indexes: CREATE INDEX idx_mota_63_col_1 ON mota_domain_schema_63(col_1);
Page 77

<!-- Page 78 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_63 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_064
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 64 field 14.
|
Indexes: CREATE INDEX idx_mota_64_col_1 ON mota_domain_schema_64(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_64 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_065
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 5. |
Page 78

<!-- Page 79 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 65 field 14.
|
Indexes: CREATE INDEX idx_mota_65_col_1 ON mota_domain_schema_65(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_65 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_066
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 12.
|
Page 79

<!-- Page 80 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 66 field 14.
|
Indexes: CREATE INDEX idx_mota_66_col_1 ON mota_domain_schema_66(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_66 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_067
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 67 field 14.
|
Indexes: CREATE INDEX idx_mota_67_col_1 ON mota_domain_schema_67(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_67 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_068
| Column Name | Data Type | Constraint | Description |
Page 80

<!-- Page 81 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 68 field 14.
|
Indexes: CREATE INDEX idx_mota_68_col_1 ON mota_domain_schema_68(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_68 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_069
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 10.
Page 81

<!-- Page 82 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 69 field 14.
|
Indexes: CREATE INDEX idx_mota_69_col_1 ON mota_domain_schema_69(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_69 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_070
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 70 field 14.
|
Indexes: CREATE INDEX idx_mota_70_col_1 ON mota_domain_schema_70(col_1);
Page 82

<!-- Page 83 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_70 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_071
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 71 field 14.
|
Indexes: CREATE INDEX idx_mota_71_col_1 ON mota_domain_schema_71(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_71 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_072
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 5. |
Page 83

<!-- Page 84 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 72 field 14.
|
Indexes: CREATE INDEX idx_mota_72_col_1 ON mota_domain_schema_72(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_72 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_073
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 12.
|
Page 84

<!-- Page 85 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 73 field 14.
|
Indexes: CREATE INDEX idx_mota_73_col_1 ON mota_domain_schema_73(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_73 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_074
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 74 field 14.
|
Indexes: CREATE INDEX idx_mota_74_col_1 ON mota_domain_schema_74(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_74 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_075
| Column Name | Data Type | Constraint | Description |
Page 85

<!-- Page 86 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 75 field 14.
|
Indexes: CREATE INDEX idx_mota_75_col_1 ON mota_domain_schema_75(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_75 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_076
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 10.
Page 86

<!-- Page 87 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 76 field 14.
|
Indexes: CREATE INDEX idx_mota_76_col_1 ON mota_domain_schema_76(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_76 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_077
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 77 field 14.
|
Indexes: CREATE INDEX idx_mota_77_col_1 ON mota_domain_schema_77(col_1);
Page 87

<!-- Page 88 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_77 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_078
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 78 field 14.
|
Indexes: CREATE INDEX idx_mota_78_col_1 ON mota_domain_schema_78(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_78 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_079
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 5. |
Page 88

<!-- Page 89 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 79 field 14.
|
Indexes: CREATE INDEX idx_mota_79_col_1 ON mota_domain_schema_79(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_79 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_080
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 12.
|
Page 89

<!-- Page 90 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 80 field 14.
|
Indexes: CREATE INDEX idx_mota_80_col_1 ON mota_domain_schema_80(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_80 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_081
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 81 field 14.
|
Indexes: CREATE INDEX idx_mota_81_col_1 ON mota_domain_schema_81(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_81 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_082
| Column Name | Data Type | Constraint | Description |
Page 90

<!-- Page 91 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 82 field 14.
|
Indexes: CREATE INDEX idx_mota_82_col_1 ON mota_domain_schema_82(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_82 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_083
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 10.
Page 91

<!-- Page 92 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 83 field 14.
|
Indexes: CREATE INDEX idx_mota_83_col_1 ON mota_domain_schema_83(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_83 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_084
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 84 field 14.
|
Indexes: CREATE INDEX idx_mota_84_col_1 ON mota_domain_schema_84(col_1);
Page 92

<!-- Page 93 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_84 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_085
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 85 field 14.
|
Indexes: CREATE INDEX idx_mota_85_col_1 ON mota_domain_schema_85(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_85 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_086
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 5. |
Page 93

<!-- Page 94 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 86 field 14.
|
Indexes: CREATE INDEX idx_mota_86_col_1 ON mota_domain_schema_86(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_86 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_087
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 12.
|
Page 94

<!-- Page 95 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 87 field 14.
|
Indexes: CREATE INDEX idx_mota_87_col_1 ON mota_domain_schema_87(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_87 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_088
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 88 field 14.
|
Indexes: CREATE INDEX idx_mota_88_col_1 ON mota_domain_schema_88(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_88 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_089
| Column Name | Data Type | Constraint | Description |
Page 95

<!-- Page 96 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 89 field 14.
|
Indexes: CREATE INDEX idx_mota_89_col_1 ON mota_domain_schema_89(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_89 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_090
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 10.
Page 96

<!-- Page 97 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 90 field 14.
|
Indexes: CREATE INDEX idx_mota_90_col_1 ON mota_domain_schema_90(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_90 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_091
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 91 field 14.
|
Indexes: CREATE INDEX idx_mota_91_col_1 ON mota_domain_schema_91(col_1);
Page 97

<!-- Page 98 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_91 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_092
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 92 field 14.
|
Indexes: CREATE INDEX idx_mota_92_col_1 ON mota_domain_schema_92(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_92 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_093
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 5. |
Page 98

<!-- Page 99 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 93 field 14.
|
Indexes: CREATE INDEX idx_mota_93_col_1 ON mota_domain_schema_93(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_93 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_094
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 12.
|
Page 99

<!-- Page 100 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 94 field 14.
|
Indexes: CREATE INDEX idx_mota_94_col_1 ON mota_domain_schema_94(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_94 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_095
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 95 field 14.
|
Indexes: CREATE INDEX idx_mota_95_col_1 ON mota_domain_schema_95(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_95 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_096
| Column Name | Data Type | Constraint | Description |
Page 100

<!-- Page 101 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 96 field 14.
|
Indexes: CREATE INDEX idx_mota_96_col_1 ON mota_domain_schema_96(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_96 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_097
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 10.
Page 101

<!-- Page 102 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 97 field 14.
|
Indexes: CREATE INDEX idx_mota_97_col_1 ON mota_domain_schema_97(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_97 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_098
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 98 field 14.
|
Indexes: CREATE INDEX idx_mota_98_col_1 ON mota_domain_schema_98(col_1);
Page 102

<!-- Page 103 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_98 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_099
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 5. |
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 99 field 14.
|
Indexes: CREATE INDEX idx_mota_99_col_1 ON mota_domain_schema_99(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_99 FOR SELECT USING
(auth.uid() = user_id);
Table: mota_domain_schema_100
| Column Name | Data Type | Constraint | Description |
| col_1 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 1. |
| col_2 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 2. |
| col_3 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 3. |
| col_4 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 4. |
| col_5 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 5. |
Page 103

<!-- Page 104 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
| col_6 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 6. |
| col_7 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 7. |
| col_8 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 8. |
| col_9 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 9. |
| col_10 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 10.
|
| col_11 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 11.
|
| col_12 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 12.
|
| col_13 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 13.
|
| col_14 | VARCHAR(255) | NOT NULL | Stores business logic for domain entity 100 field 14.
|
Indexes: CREATE INDEX idx_mota_100_col_1 ON mota_domain_schema_100(col_1);
RLS Policy: CREATE POLICY view_policy ON mota_domain_schema_100 FOR SELECT USING
(auth.uid() = user_id);
8. API Specifications & Integrations
Endpoint 1: /api/v1/resource/sync_domain_1
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 104

<!-- Page 105 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 2: /api/v1/resource/sync_domain_2
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 3: /api/v1/resource/sync_domain_3
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 105

<!-- Page 106 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 4: /api/v1/resource/sync_domain_4
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 5: /api/v1/resource/sync_domain_5
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 106

<!-- Page 107 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 6: /api/v1/resource/sync_domain_6
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 107

<!-- Page 108 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 7: /api/v1/resource/sync_domain_7
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 8: /api/v1/resource/sync_domain_8
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 108

<!-- Page 109 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 9: /api/v1/resource/sync_domain_9
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 10: /api/v1/resource/sync_domain_10
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 109

<!-- Page 110 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 11: /api/v1/resource/sync_domain_11
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 12: /api/v1/resource/sync_domain_12
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 110

<!-- Page 111 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 13: /api/v1/resource/sync_domain_13
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 111

<!-- Page 112 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 14: /api/v1/resource/sync_domain_14
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 15: /api/v1/resource/sync_domain_15
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 112

<!-- Page 113 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 16: /api/v1/resource/sync_domain_16
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 17: /api/v1/resource/sync_domain_17
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 113

<!-- Page 114 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 18: /api/v1/resource/sync_domain_18
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 19: /api/v1/resource/sync_domain_19
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 114

<!-- Page 115 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 20: /api/v1/resource/sync_domain_20
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 115

<!-- Page 116 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 21: /api/v1/resource/sync_domain_21
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 22: /api/v1/resource/sync_domain_22
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 116

<!-- Page 117 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 23: /api/v1/resource/sync_domain_23
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 24: /api/v1/resource/sync_domain_24
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 117

<!-- Page 118 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 25: /api/v1/resource/sync_domain_25
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 26: /api/v1/resource/sync_domain_26
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 118

<!-- Page 119 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 27: /api/v1/resource/sync_domain_27
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 119

<!-- Page 120 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 28: /api/v1/resource/sync_domain_28
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 29: /api/v1/resource/sync_domain_29
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 120

<!-- Page 121 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 30: /api/v1/resource/sync_domain_30
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 31: /api/v1/resource/sync_domain_31
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 121

<!-- Page 122 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 32: /api/v1/resource/sync_domain_32
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 33: /api/v1/resource/sync_domain_33
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 122

<!-- Page 123 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 34: /api/v1/resource/sync_domain_34
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 123

<!-- Page 124 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 35: /api/v1/resource/sync_domain_35
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 36: /api/v1/resource/sync_domain_36
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 124

<!-- Page 125 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 37: /api/v1/resource/sync_domain_37
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 38: /api/v1/resource/sync_domain_38
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 125

<!-- Page 126 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 39: /api/v1/resource/sync_domain_39
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 40: /api/v1/resource/sync_domain_40
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 126

<!-- Page 127 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 41: /api/v1/resource/sync_domain_41
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 127

<!-- Page 128 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 42: /api/v1/resource/sync_domain_42
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 43: /api/v1/resource/sync_domain_43
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 128

<!-- Page 129 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 44: /api/v1/resource/sync_domain_44
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 45: /api/v1/resource/sync_domain_45
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 129

<!-- Page 130 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 46: /api/v1/resource/sync_domain_46
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 47: /api/v1/resource/sync_domain_47
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 130

<!-- Page 131 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 48: /api/v1/resource/sync_domain_48
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 131

<!-- Page 132 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 49: /api/v1/resource/sync_domain_49
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 50: /api/v1/resource/sync_domain_50
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 132

<!-- Page 133 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 51: /api/v1/resource/sync_domain_51
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 52: /api/v1/resource/sync_domain_52
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 133

<!-- Page 134 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 53: /api/v1/resource/sync_domain_53
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 54: /api/v1/resource/sync_domain_54
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 134

<!-- Page 135 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 55: /api/v1/resource/sync_domain_55
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
Page 135

<!-- Page 136 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 56: /api/v1/resource/sync_domain_56
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 57: /api/v1/resource/sync_domain_57
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
Page 136

<!-- Page 137 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 58: /api/v1/resource/sync_domain_58
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 59: /api/v1/resource/sync_domain_59
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
Page 137

<!-- Page 138 -->
MoTA Unified Scholarship Platform PRD (ID: 26238)
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 60: /api/v1/resource/sync_domain_60
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
json
{
"timestamp": "2026-09-12T00:00:00Z",
"payload_hash": "sha256...",
"data": { "metric_a": 1, "metric_b": 2 }
}
Response Payload (200 OK):
json
{
"status": "success",
"processed_records": 42,
"offline_sync_token": "xyz123"
}
Error Handling:
- 401 Unauthorized: Trigger token refresh logic via Dio Interceptor.
- 503 Service Unavailable: Local DB queue retains payload for retry.
Endpoint 61: /api/v1/resource/sync_domain_61
Method: POST | Auth Required: Bearer Token (JWT) | Rate Limit: 100/min
Request Payload:
Page 138