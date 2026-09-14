enum DocumentType {
  caste,
  income,
  academic,
  banking,
  identity
}

class DigiLockerDocument {
  final String id;
  final String title;
  final DocumentType type;
  final String certificateNumber;
  final String issuer;
  final String issueDate;
  final bool isVerified;
  final String qrPayload;
  final Map<String, String> metadata;

  const DigiLockerDocument({
    required this.id,
    required this.title,
    required this.type,
    required this.certificateNumber,
    required this.issuer,
    required this.issueDate,
    required this.isVerified,
    required this.qrPayload,
    required this.metadata,
  });

  static const List<DigiLockerDocument> sampleDocuments = [
    DigiLockerDocument(
      id: 'doc-st-caste',
      title: 'Scheduled Tribe (ST) Certificate',
      type: DocumentType.caste,
      certificateNumber: 'JH-ST-2023-982173',
      issuer: 'Sub-Divisional Magistrate, Dumka, Jharkhand',
      issueDate: '14 June 2023',
      isVerified: true,
      qrPayload: 'MOTA:JH:ST:JH-ST-2023-982173:RAMESH_SOREN:SDM_DUMKA:VALID',
      metadata: {
        'Community': 'Santhal Tribe',
        'State': 'Jharkhand',
        'Validity': 'Permanent',
        'Digital Signature': 'eSign Valid (Certifying Authority India)',
      },
    ),
    DigiLockerDocument(
      id: 'doc-income',
      title: 'Family Income Certificate',
      type: DocumentType.income,
      certificateNumber: 'JH-INC-2026-04192',
      issuer: 'Department of Revenue & Land Reforms, Jharkhand',
      issueDate: '10 April 2026',
      isVerified: true,
      qrPayload: 'MOTA:JH:INC:JH-INC-2026-04192:INR_180000:SDM_DUMKA:VALID',
      metadata: {
        'Annual Family Income': '₹ 1,80,000 / annum',
        'Assessment Year': '2026 - 2027',
        'Income Ceiling Status': 'Eligible (< ₹2.5L & < ₹6.0L schemes)',
        'Issuing Officer': 'Tehsildar Dumka',
      },
    ),
    DigiLockerDocument(
      id: 'doc-academic-ug',
      title: 'B.Tech Enrollment & Grade Record',
      type: DocumentType.academic,
      certificateNumber: 'NITJ-CSE-2024-082',
      issuer: 'National Institute of Technology (NIT) Jamshedpur',
      issueDate: '02 July 2026',
      isVerified: true,
      qrPayload: 'MOTA:EDU:NITJSR:BTECH_CSE:Y3:CGPA_8.4:VALID',
      metadata: {
        'Institution': 'NIT Jamshedpur (Institute of Excellence)',
        'Department': 'Computer Science & Engineering',
        'Current CGPA': '8.42 / 10.0',
        'Academic Year': '2026 - 2027 (Semester 5)',
      },
    ),
    DigiLockerDocument(
      id: 'doc-dbt-bank',
      title: 'Aadhaar Seeded DBT Bank Account',
      type: DocumentType.banking,
      certificateNumber: 'NPCI-DBT-8921-SBI',
      issuer: 'National Payments Corporation of India (NPCI) & SBI',
      issueDate: '05 Jan 2024',
      isVerified: true,
      qrPayload: 'MOTA:DBT:NPCI:AUID_8921:SBI_4521:ACTIVE',
      metadata: {
        'Bank Name': 'State Bank of India',
        'Account': 'XXXX-XXXX-4521',
        'IFSC': 'SBIN0001234',
        'DBT / PFMS Status': 'Active & Mapped to Aadhaar',
      },
    ),
    DigiLockerDocument(
      id: 'doc-class12',
      title: 'Class XII Senior Secondary Marksheet',
      type: DocumentType.academic,
      certificateNumber: 'JAC-12-2024-81923',
      issuer: 'Jharkhand Academic Council (JAC), Ranchi',
      issueDate: '28 May 2024',
      isVerified: true,
      qrPayload: 'MOTA:EDU:JAC:12TH:RAMESH_SOREN:88.4_PCT:VALID',
      metadata: {
        'Stream': 'Science (PCM)',
        'Score': '442 / 500 (88.4%)',
        'Division': 'First Division with Distinction',
      },
    ),
  ];
}
