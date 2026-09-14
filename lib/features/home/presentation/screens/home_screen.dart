import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/widgets/pulse_dot.dart';
import '../widgets/civic_header.dart';
import '../widgets/student_identity_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final student = ref.watch(studentProfileProvider);
    final schemes = ref.watch(scholarshipSchemesProvider);
    final applications = ref.watch(applicationsProvider);
    final eligibleSchemesCount = schemes.where((s) => s.isEligible).length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CivicHeader(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 400));
                  ref.read(digiLockerDocumentsProvider.notifier).refreshAll();
                },
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  children: [
                    // Vision Motto Badge (Subtle, Non-Boxy)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkSurface
                            : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.hub_outlined, color: AppColors.civicNavyLight, size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Enter Once. Verify Once. Apply Anywhere.',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ),
                          Text(
                            'INDIA STACK',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: AppColors.saffron,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Bento Hero Card: Student Profile
                    StudentIdentityCard(student: student),
                    const SizedBox(height: 14),

                    // Bento Row 1: Live DBT Disbursal Stream Card
                    if (applications.isNotEmpty) ...[
                      _buildDbtDisbursalBento(context, applications.first, isDark),
                      const SizedBox(height: 14),
                    ],

                    // Bento Row 2: Smart Auto-Eligibility Radar Card
                    _buildEligibilityBento(context, eligibleSchemesCount, isDark),
                    const SizedBox(height: 20),

                    // Core Public Services (Bento Grid)
                    Text(
                      'Core Public Services',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildBentoServiceTile(
                            context,
                            icon: Icons.folder_special_outlined,
                            tag: '5 CERTS',
                            title: 'DigiLocker Vault',
                            subtitle: 'Offline verifiable passes',
                            color: AppColors.emeraldVerified,
                            onTap: () => context.go('/wallet'),
                            isDark: isDark,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildBentoServiceTile(
                            context,
                            icon: Icons.timeline,
                            tag: 'STAGE 5/5',
                            title: 'DBT Tracking',
                            subtitle: 'PFMS electronic mandate',
                            color: AppColors.saffron,
                            onTap: () => context.go('/tracking'),
                            isDark: isDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildBentoServiceTile(
                            context,
                            icon: Icons.account_balance,
                            tag: '5 SCHEMES',
                            title: 'Central Schemes',
                            subtitle: '1-Click instant application',
                            color: AppColors.civicNavyLight,
                            onTap: () => context.go('/schemes'),
                            isDark: isDark,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildBentoServiceTile(
                            context,
                            icon: Icons.headset_mic_outlined,
                            tag: 'C-PGRMS',
                            title: 'Tribal Helpdesk',
                            subtitle: 'Escalation to MoTA Nodal',
                            color: AppColors.infoBlue,
                            onTap: () => context.go('/grievance'),
                            isDark: isDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),

                    // MoTA Intelligence & Circulars
                    Text(
                      'MoTA Official Circulars',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildCircularNotch(
                      context,
                      date: '10 SEP 2026',
                      title: 'Sanction Order MOTA/TC/2026/0492 Disbursed',
                      description: 'Full tuition fee & laptop grant released directly to Aadhaar-seeded accounts for ST scholars in National Institutes.',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 8),
                    _buildCircularNotch(
                      context,
                      date: '02 SEP 2026',
                      title: 'Offline Field Scrutiny QR Standard Implemented',
                      description: 'Verification Officers authorized to validate certificates offline via tamper-proof cryptographic QR tokens.',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDbtDisbursalBento(
    BuildContext context,
    dynamic application,
    bool isDark,
  ) {
    return InkWell(
      onTap: () => context.go('/tracking'),
      borderRadius: BorderRadius.circular(16),
      child: Container(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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
                        'DBT DISBURSED',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 10,
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
                fontSize: 15,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '₹ 84,500',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.emeraldVerified,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Transferred to ${application.bankAccountMasked} (${application.bankName})',
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
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
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 11, color: AppColors.textMutedLight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEligibilityBento(
    BuildContext context,
    int eligibleCount,
    bool isDark,
  ) {
    return Container(
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
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.civicNavyLight.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.auto_awesome, color: Color(0xFF60A5FA), size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                'Auto-Eligibility Matching Engine',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: isDark ? const Color(0xFF93C5FD) : AppColors.civicNavy,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.emeraldVerified.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$eligibleCount MATCHED',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.emeraldVerified,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Your verified ST Category (Santhal), Income (₹1.80L < ₹6.0L), and enrollment in NIT Jamshedpur satisfy Central Sector criteria without requiring document re-upload.',
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(40),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => context.go('/schemes'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('View Eligible Schemes', style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600)),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBentoServiceTile(
    BuildContext context, {
    required IconData icon,
    required String tag,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 18),
                ),
                Text(
                  tag,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.outfit(
                fontSize: 11,
                color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularNotch(
    BuildContext context, {
    required String date,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
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
          Row(
            children: [
              Text(
                date,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.saffron,
                ),
              ),
              const Spacer(),
              const Icon(Icons.north_east, size: 13, color: AppColors.textMutedLight),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
