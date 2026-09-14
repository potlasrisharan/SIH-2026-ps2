import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/widgets/pulse_dot.dart';
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
          'Tribal Grievance Redressal',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // National C-PGRMS Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : const Color(0xFFEFF6FF),
              border: Border(
                bottom: BorderSide(
                  color: isDark ? AppColors.darkBorder : const Color(0xFFBFDBFE),
                ),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.shield_outlined, color: AppColors.infoBlue, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MoTA C-PGRMS Escalation Desk',
                        style: GoogleFonts.outfit(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: isDark ? const Color(0xFF93C5FD) : AppColors.infoBlue,
                        ),
                      ),
                      Text(
                        'Direct escalation channel to MoTA Nodal Directors and District Welfare Officers.',
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tickets List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: tickets.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return _buildTicketCard(context, ticket, isDark);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
        foregroundColor: Colors.white,
        elevation: 1,
        icon: const Icon(Icons.add_comment_outlined, size: 18),
        label: Text(
          'Lodge Grievance',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 13),
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
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: isResolved
                        ? (isDark
                            ? AppColors.emeraldVerified.withValues(alpha: 0.15)
                            : AppColors.emeraldLight)
                        : (isDark
                            ? AppColors.saffron.withValues(alpha: 0.15)
                            : AppColors.saffronLight),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isResolved ? AppColors.emeraldBorder : AppColors.saffronBorder,
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
                          fontWeight: FontWeight.w700,
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
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              ticket.subject,
              style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 14),
            ),
            const SizedBox(height: 3),
            Text(
              'Category: ${ticket.category} • Application: ${ticket.applicationId}',
              style: GoogleFonts.outfit(
                fontSize: 11,
                color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              ticket.description,
              style: GoogleFonts.outfit(
                fontSize: 12,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textPrimaryLight,
                height: 1.4,
              ),
            ),
            if (ticket.resolution != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : AppColors.emeraldLight.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isDark ? AppColors.darkBorderSubtle : AppColors.emeraldBorder,
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
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF14532D),
                          fontWeight: FontWeight.w500,
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.feedback_outlined, color: AppColors.civicNavyLight, size: 18),
                ),
                const SizedBox(width: 10),
                Text(
                  'Lodge Formal Grievance',
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700),
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
                labelStyle: GoogleFonts.outfit(fontSize: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                        child: Text(c, style: GoogleFonts.outfit(fontSize: 13)),
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
                labelStyle: GoogleFonts.outfit(fontSize: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              style: GoogleFonts.outfit(fontSize: 13),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Details of Issue',
                labelStyle: GoogleFonts.outfit(fontSize: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.all(12),
              ),
              style: GoogleFonts.outfit(fontSize: 13),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(46),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                      style: GoogleFonts.outfit(fontSize: 12),
                    ),
                    backgroundColor: AppColors.emeraldVerified,
                  ),
                );
              },
              child: Text(
                'Submit Grievance',
                style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
