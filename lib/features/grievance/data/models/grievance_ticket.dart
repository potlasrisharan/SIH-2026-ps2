class GrievanceTicket {
  final String ticketId;
  final String applicationId;
  final String category;
  final String subject;
  final String description;
  final String createdDate;
  final String status;
  final String? resolution;

  const GrievanceTicket({
    required this.ticketId,
    required this.applicationId,
    required this.category,
    required this.subject,
    required this.description,
    required this.createdDate,
    required this.status,
    this.resolution,
  });

  static const List<GrievanceTicket> sampleTickets = [
    GrievanceTicket(
      ticketId: 'GRV-2026-8941',
      applicationId: 'MOTA-2026-ST-890241',
      category: 'DBT Bank Credit',
      subject: 'Inquiry regarding PFMS Credit Reference',
      description:
          'Verification of Aadhaar mapper routing after Sanction order generation on 04 Sep 2026.',
      createdDate: '07 Sep 2026',
      status: 'Resolved',
      resolution:
          'MoTA DBT Cell confirmed PFMS electronic mandate executed on 11 Sep 2026 with UTR PFMS2026091178219082.',
    ),
  ];
}
