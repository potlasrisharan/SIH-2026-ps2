import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
import '../../data/models/grievance_ticket.dart';

class GrievanceScreen extends ConsumerStatefulWidget {
  const GrievanceScreen({super.key});

  @override
  ConsumerState<GrievanceScreen> createState() => _GrievanceScreenState();
}

class _GrievanceScreenState extends ConsumerState<GrievanceScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tickets = ref.watch(grievanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tribal Grievance Redressal',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // National C-PGRMS Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: isDark ? AppColors.darkCard : const Color(0xFFEFF6FF),
            child: Row(
              children: [
                const Icon(Icons.shield, color: AppColors.infoBlue, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MoTA C-PGRMS Escalation Desk',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppColors.infoBlue,
                        ),
                      ),
                      const Text(
                        'Direct escalation to MoTA Nodal Directors and District Welfare Officers.',
                        style: TextStyle(fontSize: 11, color: AppColors.slateTextSecondary),
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
                return _buildTicketCard(context, ticket);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.civicNavy,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_comment_outlined),
        label: const Text('Lodge Grievance'),
        onPressed: () => _showLodgeGrievanceDialog(context),
      ),
    );
  }

  Widget _buildTicketCard(BuildContext context, GrievanceTicket ticket) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isResolved = ticket.status == 'Resolved';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.slateBorder,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: isResolved ? AppColors.forestGreenLight : AppColors.saffronLight,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isResolved ? AppColors.forestGreenBorder : AppColors.saffronBorder,
                    ),
                  ),
                  child: Text(
                    ticket.status.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isResolved ? AppColors.forestGreen : AppColors.saffron,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  ticket.ticketId,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.slateTextSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              ticket.subject,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 2),
            Text(
              'Category: ${ticket.category} • Application: ${ticket.applicationId}',
              style: const TextStyle(fontSize: 11, color: AppColors.slateTextSecondary),
            ),
            const SizedBox(height: 6),
            Text(
              ticket.description,
              style: const TextStyle(fontSize: 12, height: 1.35),
            ),
            if (ticket.resolution != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black26 : AppColors.forestGreenLight,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.forestGreenBorder),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_outline, size: 16, color: AppColors.forestGreen),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        ticket.resolution!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.forestGreen,
                          fontWeight: FontWeight.w500,
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

  void _showLodgeGrievanceDialog(BuildContext context) {
    final subjectController = TextEditingController();
    final descriptionController = TextEditingController();
    String selectedCategory = 'DBT Payment Delay';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
                const Icon(Icons.feedback_outlined, color: AppColors.civicNavy),
                const SizedBox(width: 10),
                const Text(
                  'Lodge Formal Grievance',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(bottomSheetContext),
                ),
              ],
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Grievance Category',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              items: [
                'DBT Payment Delay',
                'Institute Verification Pending',
                'DigiLocker Document Link Error',
                'Other Inquiry',
              ].map((c) => DropdownMenuItem(value: c, child: Text(c, style: const TextStyle(fontSize: 13)))).toList(),
              onChanged: (val) {
                if (val != null) selectedCategory = val;
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Details of Issue',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(46),
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
                  const SnackBar(
                    content: Text('Grievance lodged under MoTA C-PGRMS with assigned tracking ID!'),
                    backgroundColor: AppColors.forestGreen,
                  ),
                );
              },
              child: const Text('Submit Grievance'),
            ),
          ],
        ),
      ),
    );
  }
}
