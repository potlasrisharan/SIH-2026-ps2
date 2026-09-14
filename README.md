# MoTA Unified Scholarship Platform (SIH 2026 - Problem Statement ID: 26238)

> **"Enter Once. Verify Once. Apply Anywhere."**  
> Unified Digital Scholarship & DBT Disbursal Platform for Tribal Students  
> **Ministry of Tribal Affairs (MoTA), Government of India**

---

## 🏛️ Executive Overview

The **Ministry of Tribal Affairs (MoTA)** oversees central and centrally-sponsored scholarship programs for Scheduled Tribe (ST) students across India. Previously, students faced fragmented state-level portals, redundant physical document re-verification, administrative delays, and lack of DBT payment transparency.

This application provides a **single-window digital public infrastructure** adhering to **GIGW 3.0** (Guidelines for Indian Government Websites) and **India Stack** (DigiLocker, Aadhaar / NPCI DBT mapper, PFMS):
- **DigiLocker Encrypted Credential Vault:** Automatic retrieval and local caching of verified digital documents (ST Caste Certificate, Income Certificate, 10th/12th/UG Grade Records, and Bank Passbook).
- **Offline Cryptographic QR Verification:** Instant field and desk scrutiny via offline-verifiable QR passes without internet connectivity.
- **Auto-Eligibility Matching Engine:** Real-time matching against all 5 official MoTA scholarship schemes with zero redundant uploads.
- **Live 5-Stage Institutional DBT Pipeline:** Real-time visibility through Institute Verification, District Nodal Officer (DNO), State Nodal Officer (SNO), MoTA Central Sanction Order, and Public Financial Management System (PFMS) direct credit.
- **Tribal Grievance Redressal:** Direct escalation under C-PGRMS to MoTA Nodal Directors.

---

## 🎯 5 Core MoTA Scholarship Schemes Implemented

1. **Top Class Education for ST Students:**
   - 100% Central Sector grant for ST students admitted to 250+ premier institutions (IITs, NITs, IIMs, AIIMS, NLUs).
   - Full tuition fee waiver + ₹3,000/month living expense + ₹5,000/year book allowance + ₹45,000 one-time computer grant.
2. **Post-Matric Scholarship for ST Students (PMS-ST):**
   - Centrally sponsored (75:25) scheme covering Class 11 through Post-Graduation.
   - Non-refundable tuition fees + annual maintenance allowances (₹4,000 to ₹13,500/year).
3. **National Fellowship for Higher Education of ST Students (NFST):**
   - 750 annual fellowships for M.Phil and Ph.D. scholars in Indian Universities.
   - JRF: ₹37,000/month + HRA; SRF: ₹42,000/month + HRA + contingency grants.
4. **National Overseas Scholarship for ST Candidates (NOS):**
   - Support for Masters & Ph.D. abroad in QS Top 1000 universities.
   - 100% foreign university tuition + annual living allowance (£9,900 UK / \$15,400 USA) + return airfare.
5. **Pre-Matric Scholarship for ST Students:**
   - Dropout prevention scholarship for Classes 9 & 10 (₹3,500 to ₹7,000/year).

---

## 🏗️ Architecture & Technology Stack

```
lib/
├── core/
│   ├── constants/        # AppColors (Stitch Civic Public Tech), AppStrings
│   ├── theme/            # Material 3 Light + Dark Themes (Civic Navy & Saffron)
│   ├── router/           # GoRouter with StatefulShellRoute
│   └── providers/        # Riverpod Global State Notifiers
├── features/
│   ├── home/             # Dashboard, DigiLocker ID Card, Eligibility Card, Circulars
│   ├── wallet/           # DigiLocker Credential Vault & Verifiable Offline QR Passes
│   ├── schemes/          # 5 Central Schemes Explorer & 1-Click Instant Application
│   ├── tracking/         # 5-Stage Institutional Timeline & PFMS DBT Tracking
│   └── grievance/        # C-PGRMS Grievance Registration & Status Tracking
└── main.dart
```

- **Framework:** Flutter 3.41+ (Dart 3.11+, Sound Null Safety)
- **State Management:** Riverpod 2.6 (`StateNotifierProvider`, `StateProvider`)
- **Navigation:** GoRouter 17.5 (`StatefulShellRoute.indexedStack`)
- **Design System:** Google Stitch *"Dignified Civic Public Tech"* (Material 3, Inter typography, WCAG 2.1 AAA contrast)
- **QR Generation:** `qr_flutter` 4.1

---

## 🚀 Running the App

```bash
# Get dependencies
flutter pub get

# Run static analysis
flutter analyze

# Run unit and widget tests
flutter test

# Build debug APK
flutter build apk --debug
```

APK Output Location: `build/app/outputs/flutter-apk/app-debug.apk`
