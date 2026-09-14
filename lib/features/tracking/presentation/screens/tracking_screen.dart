import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/widgets/pulse_dot.dart';
import '../../data/models/scholarship_application.dart';

class TrackingScreen extends ConsumerWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final applications = ref.watch(applicationsProvider);
    final application = applications.first;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live DBT Application Pipeline',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Application Overview Bento Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                width: 1.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.emeraldVerified.withValues(alpha: 0.15)
                            : AppColors.emeraldLight,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDark
                              ? AppColors.emeraldVerified.withValues(alpha: 0.3)
                              : AppColors.emeraldBorder,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const PulseDot(color: AppColors.emeraldVerified, size: 6),
                          const SizedBox(width: 6),
                          Text(
                            'DBT DISBURSAL COMPLETE',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: AppColors.emeraldVerified,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      application.applicationId,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  application.schemeTitle,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Academic Year: ${application.academicYear}',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 14),
                const Divider(height: 1, thickness: 1),
                const SizedBox(height: 14),

                // DBT Disbursal Highlight Box
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'SANCTIONED GRANT',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                            ),
                          ),
                          Text(
                            '₹ 84,500',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.emeraldVerified,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.account_balance, size: 14, color: AppColors.emeraldVerified),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Credited to: ${application.bankName} (${application.bankAccountMasked})',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.qr_code, size: 13, color: AppColors.infoBlue),
                          const SizedBox(width: 6),
                          Text(
                            'PFMS UTR: ',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 10,
                              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                            ),
                          ),
                          Text(
                            application.utrNumber ?? 'PENDING',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.infoBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 5-Stage Institutional Timeline Header
          Text(
            '5-Stage Verification & Sanction Timeline',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 12),

          ...application.stages.asMap().entries.map((entry) {
            final index = entry.key;
            final stage = entry.value;
            final isLast = index == application.stages.length - 1;
            return _buildTimelineStep(
              context,
              stageNumber: index + 1,
              stage: stage,
              isLast: isLast,
              isDark: isDark,
            );
          }),

          const SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isDark ? const Color(0xFF3B82F6) : AppColors.civicNavy,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: Icon(
                    Icons.download_outlined,
                    size: 16,
                    color: isDark ? const Color(0xFF93C5FD) : AppColors.civicNavy,
                  ),
                  label: Text(
                    'Sanction Order',
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isDark ? const Color(0xFF93C5FD) : AppColors.civicNavy,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Downloading MoTA Sanction Order MOTA/TC/2026/0492...',
                          style: GoogleFonts.outfit(fontSize: 12),
                        ),
                        backgroundColor: AppColors.civicNavy,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: const Icon(Icons.help_outline, size: 16),
                  label: Text(
                    'Lodge Query',
                    style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () => context.go('/grievance'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(
    BuildContext context, {
    required int stageNumber,
    required PipelineStage stage,
    required bool isLast,
    required bool isDark,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step Node & Vertical Stem
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.emeraldVerified,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.0,
                    color: isDark
                        ? AppColors.emeraldVerified.withValues(alpha: 0.4)
                        : AppColors.emeraldBorder,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),

          // Step Content Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkCard : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Stage $stageNumber: ${stage.title}',
                          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        Text(
                          stage.date.split(',').first,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 10,
                            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stage.authority,
                      style: GoogleFonts.outfit(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.saffron,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      stage.remarks,
                      style: GoogleFonts.outfit(
                        fontSize: 11,
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        height: 1.35,
                      ),
                    ),
                    if (stage.referenceId != null) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                          ),
                        ),
                        child: Text(
                          'REF: ${stage.referenceId}',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: AppColors.infoBlue,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
