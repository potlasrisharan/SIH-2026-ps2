class StudentProfile {
  final String id;
  final String name;
  final String category;
  final String state;
  final String district;
  final String institution;
  final String course;
  final double familyIncome;
  final String aadhaarMasked;
  final String bankAccountMasked;
  final String bankName;
  final String ifsc;
  final bool dbtLinked;
  final bool digiLockerVerified;
  final String offlineSyncDate;

  const StudentProfile({
    required this.id,
    required this.name,
    required this.category,
    required this.state,
    required this.district,
    required this.institution,
    required this.course,
    required this.familyIncome,
    required this.aadhaarMasked,
    required this.bankAccountMasked,
    required this.bankName,
    required this.ifsc,
    required this.dbtLinked,
    required this.digiLockerVerified,
    required this.offlineSyncDate,
  });

  static const StudentProfile sample = StudentProfile(
    id: 'ST-2026-JH-8921',
    name: 'Ramesh Soren',
    category: 'Scheduled Tribe (ST) - Santhal',
    state: 'Jharkhand',
    district: 'Dumka',
    institution: 'National Institute of Technology (NIT) Jamshedpur',
    course: 'B.Tech Computer Science & Engineering (3rd Year)',
    familyIncome: 180000.0,
    aadhaarMasked: 'XXXX-XXXX-8921',
    bankAccountMasked: '*******4521',
    bankName: 'State Bank of India',
    ifsc: 'SBIN0001234',
    dbtLinked: true,
    digiLockerVerified: true,
    offlineSyncDate: 'Today, 10:45 AM',
  );
}
