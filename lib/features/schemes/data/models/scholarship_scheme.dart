class ScholarshipScheme {
  final String id;
  final String title;
  final String ministry;
  final String level;
  final String description;
  final String financialBenefits;
  final double incomeLimit;
  final List<String> eligibilityCriteria;
  final List<String> requiredDocuments;
  final String deadline;
  final String fundingPattern;
  final String sourcePortal;
  final bool isEligible;
  final bool isApplied;
  final String? applicationId;

  const ScholarshipScheme({
    required this.id,
    required this.title,
    required this.ministry,
    required this.level,
    required this.description,
    required this.financialBenefits,
    required this.incomeLimit,
    required this.eligibilityCriteria,
    required this.requiredDocuments,
    required this.deadline,
    required this.fundingPattern,
    required this.sourcePortal,
    required this.isEligible,
    required this.isApplied,
    this.applicationId,
  });

  static const List<ScholarshipScheme> sampleSchemes = [
    ScholarshipScheme(
      id: 'scheme-top-class',
      title: 'Top Class Education for ST Students',
      ministry: 'Ministry of Tribal Affairs (MoTA), Central Sector',
      level: 'Undergraduate / Professional (Institutes of Excellence)',
      description:
          'Financial support to meritorious ST students pursuing higher professional degrees in 250+ notified premier institutes like IITs, NITs, IIMs, AIIMS, and National Law Universities.',
      financialBenefits:
          '100% full tuition fee waiver + ₹3,000/mo living expense allowance + ₹5,000/yr book grant + one-time ₹45,000 computer/laptop hardware grant.',
      incomeLimit: 600000.0,
      eligibilityCriteria: [
        'Must belong to Scheduled Tribe (ST) category.',
        'Total annual family income from all sources must not exceed ₹6.00 Lakh.',
        'Admitted into an approved notified Institute of Excellence (NIT Jamshedpur is notified).',
        'Valid Aadhaar-seeded active bank account.',
      ],
      requiredDocuments: [
        'ST Caste Certificate (DigiLocker Verified)',
        'Income Certificate (DigiLocker Verified)',
        'Institute Bonafide / Admission Letter',
        'DBT Bank Account Verification',
      ],
      deadline: '31 October 2026',
      fundingPattern: '100% Central Ministry of Tribal Affairs (Direct DBT)',
      sourcePortal: 'SFMP Portal (Canara Bank)',
      isEligible: true,
      isApplied: true,
      applicationId: 'MOTA-2026-ST-890241',
    ),
    ScholarshipScheme(
      id: 'scheme-post-matric',
      title: 'Post-Matric Scholarship for ST Students (PMS-ST)',
      ministry: 'Ministry of Tribal Affairs & State Tribal Welfare Dept.',
      level: 'Post-Matric (Class 11 to Post-Graduate)',
      description:
          'Comprehensive state-administered scholarship ensuring financial assistance for ST students to complete secondary and post-secondary education without economic impediment.',
      financialBenefits:
          'Full mandatory non-refundable institute tuition fees + ₹4,000 to ₹13,500/year annual academic maintenance allowance based on degree stream.',
      incomeLimit: 250000.0,
      eligibilityCriteria: [
        'Belong to Scheduled Tribe community.',
        'Total annual family income must not exceed ₹2.50 Lakh.',
        'Must have passed Matriculation (Class 10) examination.',
        'Regular enrolled student at an affiliated college/university.',
      ],
      requiredDocuments: [
        'ST Caste Certificate',
        'Income Certificate (< ₹2.5 Lakh)',
        'Class 10 & 12 Marksheet',
        'Fee Receipt & Bonafide Certificate',
      ],
      deadline: '15 November 2026',
      fundingPattern: 'Centrally Sponsored Scheme (75% MoTA : 25% State Govt)',
      sourcePortal: 'National Scholarship Portal (NSP)',
      isEligible: true,
      isApplied: false,
    ),
    ScholarshipScheme(
      id: 'scheme-nfst',
      title: 'National Fellowship for Higher Education of ST Students (NFST)',
      ministry: 'Ministry of Tribal Affairs (MoTA), Central Sector',
      level: 'M.Phil / Ph.D. Research Scholars',
      description:
          'Merit fellowship to encourage ST scholars to pursue regular, full-time M.Phil and Ph.D. degrees in Sciences, Humanities, Social Sciences, and Engineering across Indian Universities.',
      financialBenefits:
          'JRF: ₹37,000/mo + HRA for first 2 years; SRF: ₹42,000/mo + HRA for remaining tenure. Annual contingency grant up to ₹20,500/yr.',
      incomeLimit: 0.0, // No income ceiling
      eligibilityCriteria: [
        'ST student admitted to regular, full-time M.Phil/Ph.D. program in UGC recognized institution.',
        'Qualified UGC-NET / CSIR-NET or national university entrance.',
        'No income ceiling applies (pure merit fellowship for 750 annual slots).',
      ],
      requiredDocuments: [
        'ST Caste Certificate',
        'Post-Graduation Degree Certificate & NET Scorecard',
        'Ph.D. Admission Letter & Research Proposal Synopsis',
        'Supervisor & Department Verification',
      ],
      deadline: '30 November 2026',
      fundingPattern: '100% Central Ministry of Tribal Affairs',
      sourcePortal: 'SFMP Portal (Canara Bank)',
      isEligible: false, // Student is currently B.Tech UG
      isApplied: false,
    ),
    ScholarshipScheme(
      id: 'scheme-nos',
      title: 'National Overseas Scholarship for ST Candidates (NOS)',
      ministry: 'Ministry of Tribal Affairs (MoTA), Central Sector',
      level: 'Master’s & Ph.D. Abroad (Global Top 1000 Institutions)',
      description:
          'Prestigious international scholarship enabling ambitious ST students to pursue postgraduate degrees and doctorate research in accredited international universities abroad.',
      financialBenefits:
          '100% tuition fees paid directly to international university + annual living maintenance allowance (£9,900 UK / \$15,400 USA) + return airfare + medical insurance.',
      incomeLimit: 800000.0,
      eligibilityCriteria: [
        'Must belong to Scheduled Tribe.',
        'Total annual family income must not exceed ₹8.00 Lakh.',
        'Must have secured unconditional offer letter from QS World University Top 1000 institution.',
        'Minimum 55% marks in qualifying degree.',
      ],
      requiredDocuments: [
        'ST Certificate & Valid Indian Passport',
        'Unconditional Admission Letter from Foreign University',
        'Income Certificate (< ₹8 Lakh)',
        'IELTS / TOEFL / GRE Scorecard',
      ],
      deadline: '15 December 2026',
      fundingPattern: '100% Central MoTA Disbursal',
      sourcePortal: 'MoTA Standalone NOS Portal',
      isEligible: false,
      isApplied: false,
    ),
    ScholarshipScheme(
      id: 'scheme-pre-matric',
      title: 'Pre-Matric Scholarship for ST Students',
      ministry: 'Ministry of Tribal Affairs & State Tribal Welfare Dept.',
      level: 'Secondary School (Classes 9 & 10)',
      description:
          'Scholarship aimed at arresting school dropouts at the transition from elementary to secondary education among tribal students in remote forest and rural pockets.',
      financialBenefits:
          'Day Scholar: ₹3,500/year; Hosteller: ₹7,000/year + annual book grant of ₹1,000/year.',
      incomeLimit: 250000.0,
      eligibilityCriteria: [
        'Enrolled in Class 9 or Class 10 in a recognized Government or aided school.',
        'Belong to Scheduled Tribe community.',
        'Annual family income not exceeding ₹2.50 Lakh.',
      ],
      requiredDocuments: [
        'ST Caste Certificate',
        'Income Certificate',
        'School Bonafide Certificate from Headmaster',
      ],
      deadline: '15 October 2026',
      fundingPattern: 'Centrally Sponsored Scheme (75:25)',
      sourcePortal: 'National Scholarship Portal (NSP)',
      isEligible: false, // Student is in college
      isApplied: false,
    ),
  ];
}
