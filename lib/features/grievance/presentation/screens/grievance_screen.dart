import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/widgets/pulse_dot.dart';
import '../../../chat/presentation/widgets/jago_chat_sheet.dart';
import '../../data/models/grievance_ticket.dart';

class GrievanceScreen extends ConsumerStatefulWidget {
  const GrievanceScreen({super.key});

  @override
  ConsumerState<GrievanceScreen> createState() => _GrievanceScreenState();
}

class _GrievanceScreenState extends ConsumerState<GrievanceScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tickets = ref.watch(grievanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tribal Grievance Redressal (C-PGRMS)',
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, fontSize: 17),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: isDark ? const Color(0xFF93C5FD) : AppColors.civicNavy,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            icon: const Icon(Icons.smart_toy_outlined, size: 16),
            label: Text(
              'JAGO AI',
              style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12),
            ),
            onPressed: () => JagoChatSheet.show(context, isDark),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // JAGO AI Assistant Hero Card
          Container(
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark ? const Color(0xFF1E3A5F) : const Color(0xFFBFDBFE),
                width: 1.2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // JAGO Top Ribbon
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF0F1E36) : const Color(0xFFEFF6FF),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
                    border: Border(
                      bottom: BorderSide(
                        color: isDark ? AppColors.darkBorderSubtle : const Color(0xFFBFDBFE),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.emeraldBadgeBg : AppColors.emeraldLight,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.emeraldVerified.withValues(alpha: 0.4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const PulseDot(color: AppColors.emeraldVerified, size: 5),
                            const SizedBox(width: 4),
                            Text(
                              'GROQ AI • ONLINE',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 8.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.emeraldVerified,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'MoTA Problem Statement 26238',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 9.5,
                          color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.smart_toy_outlined, color: Colors.white, size: 20),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'JAGO • AI Scholarship Assistant',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.5,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                                Text(
                                  'Instant student-specific answers on eligibility, PFMS UTR, single-scheme rules & deficiencies.',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 11,
                                    color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(40),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.forum_outlined, size: 16),
                        label: Text(
                          'Launch JAGO AI Chatbot',
                          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12.5),
                        ),
                        onPressed: () => JagoChatSheet.show(context, isDark),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // National C-PGRMS Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.shield_outlined, color: AppColors.infoBlue, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MoTA C-PGRMS Escalation Desk',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: isDark ? const Color(0xFF93C5FD) : AppColors.infoBlue,
                        ),
                      ),
                      Text(
                        'Direct statutory escalation channel to MoTA Nodal Directors and District Welfare Officers.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10.5,
                          color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LODGED TICKETS & GRIEVANCES',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                ),
              ),
              Text(
                '${tickets.length} ACTIVE',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.infoBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Tickets List
          ...tickets.map((ticket) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildTicketCard(context, ticket, isDark),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
        foregroundColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        icon: const Icon(Icons.add_comment_outlined, size: 18),
        label: Text(
          'Lodge Grievance',
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13),
        ),
        onPressed: () => _showLodgeGrievanceDialog(context, isDark),
      ),
    );
  }

  Widget _buildTicketCard(BuildContext context, GrievanceTicket ticket, bool isDark) {
    final isResolved = ticket.status == 'Resolved';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Docket Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : const Color(0xFFF8FAFC),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
              border: Border(
                bottom: BorderSide(
                  color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: isResolved
                        ? (isDark ? AppColors.emeraldBadgeBg : AppColors.emeraldLight)
                        : (isDark ? AppColors.saffronBadgeBg : AppColors.saffronLight),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: isResolved
                          ? (isDark ? AppColors.emeraldVerified.withValues(alpha: 0.4) : AppColors.emeraldBorder)
                          : (isDark ? AppColors.saffron.withValues(alpha: 0.4) : AppColors.saffronBorder),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PulseDot(
                        color: isResolved ? AppColors.emeraldVerified : AppColors.saffron,
                        size: 5,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        ticket.status.toUpperCase(),
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: isResolved ? AppColors.emeraldVerified : AppColors.saffron,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  ticket.ticketId,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.subject,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Category: ${ticket.category} • Application: ${ticket.applicationId}',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  ticket.description,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textPrimaryLight,
                    height: 1.45,
                  ),
                ),
                if (ticket.resolution != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface : const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isDark ? AppColors.darkBorderSubtle : const Color(0xFFBBF7D0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle_outline, size: 16, color: AppColors.emeraldVerified),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            ticket.resolution!,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 11.5,
                              color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF14532D),
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLodgeGrievanceDialog(BuildContext context, bool isDark) {
    final subjectController = TextEditingController();
    final descriptionController = TextEditingController();
    String selectedCategory = 'DBT Payment Delay';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark ? AppColors.darkCard : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (bottomSheetContext) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.civicNavyLight.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.feedback_outlined, color: AppColors.civicNavyLight, size: 18),
                ),
                const SizedBox(width: 10),
                Text(
                  'Lodge Formal Grievance',
                  style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () => Navigator.pop(bottomSheetContext),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: InputDecoration(
                labelText: 'Grievance Category',
                labelStyle: GoogleFonts.plusJakartaSans(fontSize: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              items: [
                'DBT Payment Delay',
                'Institute Verification Pending',
                'DigiLocker Document Link Error',
                'Other Inquiry',
              ]
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(c, style: GoogleFonts.plusJakartaSans(fontSize: 13)),
                      ))
                  .toList(),
              onChanged: (val) {
                if (val != null) selectedCategory = val;
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: 'Subject',
                labelStyle: GoogleFonts.plusJakartaSans(fontSize: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              style: GoogleFonts.plusJakartaSans(fontSize: 13),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Details of Issue',
                labelStyle: GoogleFonts.plusJakartaSans(fontSize: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.all(12),
              ),
              style: GoogleFonts.plusJakartaSans(fontSize: 13),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(46),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                if (subjectController.text.trim().isEmpty) return;
                ref.read(grievanceProvider.notifier).createTicket(
                      applicationId: 'MOTA-2026-ST-890241',
                      category: selectedCategory,
                      subject: subjectController.text.trim(),
                      description: descriptionController.text.trim(),
                    );
                Navigator.pop(bottomSheetContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Grievance lodged under MoTA C-PGRMS with assigned tracking ID!',
                      style: GoogleFonts.plusJakartaSans(fontSize: 12),
                    ),
                    backgroundColor: AppColors.emeraldVerified,
                  ),
                );
              },
              child: Text(
                'Submit Grievance',
                style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
