import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
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
                    // Sovereign Vision Preamble Ribbon
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkSurface : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.verified_outlined, color: AppColors.saffron, size: 15),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              AppStrings.motto,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w700,
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: isDark ? AppColors.saffronBadgeBg : AppColors.saffronLight,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isDark ? AppColors.saffron.withValues(alpha: 0.4) : AppColors.saffronBorder,
                              ),
                            ),
                            child: Text(
                              AppStrings.indiaStack,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 8.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.saffron,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Sovereign Student Identity Credential Dossier
                    StudentIdentityCard(student: student),
                    const SizedBox(height: 14),

                    // Live PFMS Electronic Mandate & Disbursal Docket
                    if (applications.isNotEmpty) ...[
                      _buildDbtTreasuryMandate(context, applications.first, isDark),
                      const SizedBox(height: 14),
                    ],

                    // Autonomous Eligibility Engine Radar
                    _buildEligibilityRadar(context, eligibleSchemesCount, isDark),
                    const SizedBox(height: 20),

                    // Integrated Civic Digital Infrastructure Services
                    Row(
                      children: [
                        Text(
                          AppStrings.corePublicServices,
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'OFFLINE READY',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: AppColors.emeraldVerified,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Civic Services Multi-Tile Console
                    _buildCivicServiceConsole(context, isDark, schemes.length),
                    const SizedBox(height: 22),

                    // Official MoTA Gazette & Circulars
                    Row(
                      children: [
                        Text(
                          AppStrings.motaCirculars,
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'SEPTEMBER 2026',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildGazetteOrder(
                      context,
                      orderNumber: 'MOTA/TC/2026/0492',
                      date: '10 SEP 2026',
                      title: 'Sanction Order: National Institute Scholarship Tranche Released',
                      description: 'Direct Treasury Grant of ₹84,500 transferred to Aadhaar-seeded account for AY 2026-27 under National Fellowship & Top Class Scheme.',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 8),
                    _buildGazetteOrder(
                      context,
                      orderNumber: 'MOTA/DIR/2026/0118',
                      date: '02 SEP 2026',
                      title: 'Offline Field Scrutiny: Cryptographic QR Pass Mandated',
                      description: 'Verification Officers across State Welfare Offices authorized to accept offline tamper-proof DigiLocker QR certificates.',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDbtTreasuryMandate(
    BuildContext context,
    dynamic application,
    bool isDark,
  ) {
    return InkWell(
      onTap: () => context.go('/tracking'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
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
            // Treasury Header Bar
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
                      color: isDark ? AppColors.emeraldBadgeBg : AppColors.emeraldLight,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: isDark ? AppColors.emeraldVerified.withValues(alpha: 0.4) : AppColors.emeraldBorder,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const PulseDot(color: AppColors.emeraldVerified, size: 5.5),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.dbtDisbursed,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: AppColors.emeraldVerified,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    application.applicationId,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                    ),
                  ),
                ],
              ),
            ),

            // Disbursal Details
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    application.schemeTitle,
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Big Disbursed Amount
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '₹ 84,500',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.emeraldVerified,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Credited to ${application.bankAccountMasked} (${application.bankName})',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Financial Component Breakdown Badges
                  Row(
                    children: [
                      _buildMiniStipendTag('Tuition: ₹62k', isDark),
                      const SizedBox(width: 6),
                      _buildMiniStipendTag('Stipend: ₹18k', isDark),
                      const SizedBox(width: 6),
                      _buildMiniStipendTag('Books: ₹4.5k', isDark),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // PFMS Mandate Reference
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.pfmsUtr,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                          ),
                        ),
                        Text(
                          application.utrNumber ?? 'PFMS20260908871239X',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.infoBlue,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios, size: 10, color: AppColors.textMutedLight),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniStipendTag(String label, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF16233B) : const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isDark ? const Color(0xFF2563EB).withValues(alpha: 0.3) : const Color(0xFFBFDBFE),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 8.5,
          fontWeight: FontWeight.w600,
          color: isDark ? const Color(0xFF93C5FD) : const Color(0xFF1D4ED8),
        ),
      ),
    );
  }

  Widget _buildEligibilityRadar(
    BuildContext context,
    int eligibleCount,
    bool isDark,
  ) {
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
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.saffron.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.auto_awesome, color: AppColors.saffron, size: 15),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  AppStrings.autoEligibilityEngine,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.5,
                    color: isDark ? Colors.white : AppColors.civicNavyDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.emeraldBadgeBg : AppColors.emeraldLight,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: isDark ? AppColors.emeraldVerified.withValues(alpha: 0.4) : AppColors.emeraldBorder,
                  ),
                ),
                child: Text(
                  '$eligibleCount ${AppStrings.matched}',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.emeraldVerified,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'ST Category (Santhal), Income (₹1.80L < ₹6.0L ceiling), and NIT Jamshedpur Enrollment are cryptographically pre-verified. Zero scan or document re-upload required.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11.5,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? const Color(0xFF1E3A64) : AppColors.civicNavy,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(38),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            onPressed: () => context.go('/schemes'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.viewEligibleSchemes,
                  style: GoogleFonts.plusJakartaSans(fontSize: 12.5, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCivicServiceConsole(BuildContext context, bool isDark, int schemeCount) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildConsoleActionTile(
                context,
                icon: Icons.folder_special_outlined,
                tag: '5 CERTS',
                title: 'DigiLocker Vault',
                subtitle: 'Cryptographic credentials',
                color: AppColors.emeraldVerified,
                onTap: () => context.go('/wallet'),
                isDark: isDark,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildConsoleActionTile(
                context,
                icon: Icons.timeline,
                tag: 'STAGE 5/5',
                title: 'DBT Mandate',
                subtitle: 'PFMS Treasury pipeline',
                color: AppColors.saffron,
                onTap: () => context.go('/tracking'),
                isDark: isDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildConsoleActionTile(
                context,
                icon: Icons.account_balance,
                tag: '$schemeCount SCHEMES',
                title: 'Central Schemes',
                subtitle: '1-Click instant submission',
                color: isDark ? const Color(0xFF93C5FD) : AppColors.civicNavyLight,
                onTap: () => context.go('/schemes'),
                isDark: isDark,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildConsoleActionTile(
                context,
                icon: Icons.support_agent,
                tag: 'C-PGRMS',
                title: 'MoTA Helpdesk',
                subtitle: '24hr Nodal grievance',
                color: AppColors.infoBlue,
                onTap: () => context.go('/grievance'),
                isDark: isDark,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConsoleActionTile(
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
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(10),
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
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(icon, color: color, size: 16),
                ),
                Text(
                  tag,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700,
                fontSize: 12.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10.5,
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

  Widget _buildGazetteOrder(
    BuildContext context, {
    required String orderNumber,
    required String date,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(10),
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
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.saffronBadgeBg : AppColors.saffronLight,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  orderNumber,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.saffron,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12.5),
          ),
          const SizedBox(height: 3),
          Text(
            description,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
