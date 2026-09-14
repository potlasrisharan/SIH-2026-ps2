enum StageStatus {
  completed,
  inProgress,
  pending,
  rejected
}

class PipelineStage {
  final String title;
  final String authority;
  final String date;
  final StageStatus status;
  final String remarks;
  final String? referenceId;

  const PipelineStage({
    required this.title,
    required this.authority,
    required this.date,
    required this.status,
    required this.remarks,
    this.referenceId,
  });
}

class ScholarshipApplication {
  final String applicationId;
  final String schemeId;
  final String schemeTitle;
  final String academicYear;
  final double amount;
  final String submissionDate;
  final String bankName;
  final String bankAccountMasked;
  final String ifsc;
  final String? utrNumber;
  final int currentStageIndex;
  final List<PipelineStage> stages;

  const ScholarshipApplication({
    required this.applicationId,
    required this.schemeId,
    required this.schemeTitle,
    required this.academicYear,
    required this.amount,
    required this.submissionDate,
    required this.bankName,
    required this.bankAccountMasked,
    required this.ifsc,
    this.utrNumber,
    required this.currentStageIndex,
    required this.stages,
  });

  static const ScholarshipApplication sampleApplication = ScholarshipApplication(
    applicationId: 'MOTA-2026-ST-890241',
    schemeId: 'scheme-top-class',
    schemeTitle: 'Top Class Education for ST Students',
    academicYear: '2026-2027 (Semester 5 & 6)',
    amount: 84500.0,
    submissionDate: '12 Aug 2026',
    bankName: 'State Bank of India',
    bankAccountMasked: '*******4521',
    ifsc: 'SBIN0001234',
    utrNumber: 'PFMS2026091178219082',
    currentStageIndex: 4, // 5th stage (disbursal completed)
    stages: [
      PipelineStage(
        title: 'Application Submitted',
        authority: 'MoTA Unified Student Portal',
        date: '12 Aug 2026, 02:15 PM',
        status: StageStatus.completed,
        remarks: 'Direct 1-click submission. Zero physical document scans requested; verified via DigiLocker vault.',
        referenceId: 'SUB-JH-890241',
      ),
      PipelineStage(
        title: 'Institute Verification',
        authority: 'NIT Jamshedpur (Nodal Officer)',
        date: '18 Aug 2026, 11:30 AM',
        status: StageStatus.completed,
        remarks: 'Admission, active attendance (>82%), and tuition fee structure of ₹62,500 validated online.',
        referenceId: 'VER-NITJSR-2026-419',
      ),
      PipelineStage(
        title: 'District Nodal Scrutiny',
        authority: 'District Welfare Office, Dumka',
        date: '28 Aug 2026, 04:45 PM',
        status: StageStatus.completed,
        remarks: 'ST Caste Certificate JH-ST-2023-982173 verified with SDM portal. Income within ₹6.0L ceiling.',
        referenceId: 'DNO-DMK-9014',
      ),
      PipelineStage(
        title: 'MoTA Central Sanction Order',
        authority: 'Ministry of Tribal Affairs, New Delhi',
        date: '04 Sep 2026, 03:20 PM',
        status: StageStatus.completed,
        remarks: 'Sanction Order MOTA/TC/2026/0492 generated. Full tuition fee + maintenance grant approved.',
        referenceId: 'SAN-MOTA-2026-0492',
      ),
      PipelineStage(
        title: 'PFMS / DBT Direct Bank Disbursal',
        authority: 'Public Financial Management System (PFMS) & NPCI',
        date: '11 Sep 2026, 09:12 AM',
        status: StageStatus.completed,
        remarks: 'Direct ₹84,500 electronic fund transfer credited directly into Aadhaar-seeded SBI A/c *4521.',
        referenceId: 'PFMS2026091178219082',
      ),
    ],
  );
}
