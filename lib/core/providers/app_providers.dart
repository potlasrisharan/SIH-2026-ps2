import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/home/data/models/student_profile.dart';
import '../../features/wallet/data/models/digilocker_document.dart';
import '../../features/schemes/data/models/scholarship_scheme.dart';
import '../../features/tracking/data/models/scholarship_application.dart';
import '../../features/grievance/data/models/grievance_ticket.dart';

// Theme mode provider (default: dark mode as specified in user guidelines)
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

// Language switcher provider
final appLanguageProvider = StateProvider<String>((ref) => 'English');

// Student profile provider
final studentProfileProvider = StateProvider<StudentProfile>((ref) {
  return StudentProfile.sample;
});

// DigiLocker Documents Notifier
class DigiLockerDocumentsNotifier extends StateNotifier<List<DigiLockerDocument>> {
  DigiLockerDocumentsNotifier() : super(DigiLockerDocument.sampleDocuments);

  void refreshAll() {
    state = List.from(DigiLockerDocument.sampleDocuments);
  }
}

final digiLockerDocumentsProvider =
    StateNotifierProvider<DigiLockerDocumentsNotifier, List<DigiLockerDocument>>((ref) {
  return DigiLockerDocumentsNotifier();
});

// Schemes Notifier
class SchemesNotifier extends StateNotifier<List<ScholarshipScheme>> {
  SchemesNotifier() : super(ScholarshipScheme.sampleSchemes);

  void applyToScheme(String schemeId) {
    state = [
      for (final scheme in state)
        if (scheme.id == schemeId)
          ScholarshipScheme(
            id: scheme.id,
            title: scheme.title,
            ministry: scheme.ministry,
            level: scheme.level,
            description: scheme.description,
            financialBenefits: scheme.financialBenefits,
            incomeLimit: scheme.incomeLimit,
            eligibilityCriteria: scheme.eligibilityCriteria,
            requiredDocuments: scheme.requiredDocuments,
            deadline: scheme.deadline,
            fundingPattern: scheme.fundingPattern,
            isEligible: scheme.isEligible,
            isApplied: true,
            applicationId: 'MOTA-2026-ST-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
          )
        else
          scheme,
    ];
  }
}

final scholarshipSchemesProvider =
    StateNotifierProvider<SchemesNotifier, List<ScholarshipScheme>>((ref) {
  return SchemesNotifier();
});

// Applications Tracking Notifier
class ApplicationsNotifier extends StateNotifier<List<ScholarshipApplication>> {
  ApplicationsNotifier() : super([ScholarshipApplication.sampleApplication]);

  void addApplication(ScholarshipApplication application) {
    state = [application, ...state];
  }
}

final applicationsProvider =
    StateNotifierProvider<ApplicationsNotifier, List<ScholarshipApplication>>((ref) {
  return ApplicationsNotifier();
});

// Grievance Tickets Notifier
class GrievanceNotifier extends StateNotifier<List<GrievanceTicket>> {
  GrievanceNotifier() : super(GrievanceTicket.sampleTickets);

  void createTicket({
    required String applicationId,
    required String category,
    required String subject,
    required String description,
  }) {
    final newTicket = GrievanceTicket(
      ticketId: 'GRV-2026-${(1000 + state.length + 1)}',
      applicationId: applicationId,
      category: category,
      subject: subject,
      description: description,
      createdDate: 'Today',
      status: 'In Review',
      resolution: 'Grievance ticket registered under C-PGRMS. Nodal Officer assigned.',
    );
    state = [newTicket, ...state];
  }
}

final grievanceProvider =
    StateNotifierProvider<GrievanceNotifier, List<GrievanceTicket>>((ref) {
  return GrievanceNotifier();
});
