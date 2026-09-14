import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/widgets/pulse_dot.dart';
import '../../../chat/presentation/widgets/jago_chat_sheet.dart';
import '../../data/models/scholarship_scheme.dart';

class SchemesScreen extends ConsumerStatefulWidget {
  const SchemesScreen({super.key});

  @override
  ConsumerState<SchemesScreen> createState() => _SchemesScreenState();
}

class _SchemesScreenState extends ConsumerState<SchemesScreen> {
  String selectedTab = 'Eligible for You';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final schemes = ref.watch(scholarshipSchemesProvider);

    final eligibleSchemes = schemes.where((s) => s.isEligible).toList();
    final appliedSchemes = schemes.where((s) => s.isApplied).toList();

    List<ScholarshipScheme> displayedSchemes;
    if (selectedTab == 'Eligible for You') {
      displayedSchemes = eligibleSchemes;
    } else if (selectedTab == 'Applied') {
      displayedSchemes = appliedSchemes;
    } else {
      displayedSchemes = schemes;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MoTA Central Sector Schemes',
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, fontSize: 17),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.smart_toy_outlined, size: 20),
            tooltip: 'Ask JAGO AI',
            onPressed: () => JagoChatSheet.show(context, isDark),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
            ),
            child: Row(
              children: [
                _buildTab('Eligible for You', count: schemes.where((s) => s.isEligible).length, isDark: isDark),
                const SizedBox(width: 8),
                _buildTab('All Schemes', count: schemes.length, isDark: isDark),
                const SizedBox(width: 8),
                _buildTab('Applied', count: schemes.where((s) => s.isApplied).length, isDark: isDark),
              ],
            ),
          ),

          // Schemes List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: displayedSchemes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final scheme = displayedSchemes[index];
                return _buildSchemeCard(context, scheme, isDark);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, {required int count, required bool isDark}) {
    final isSelected = selectedTab == title;
    return InkWell(
      onTap: () => setState(() => selectedTab = title),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF1E3A64) : AppColors.civicNavy)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? (isDark ? const Color(0xFF1E3A64) : AppColors.civicNavy)
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.22)
                    : (isDark ? AppColors.darkSurface : AppColors.lightBorder),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '$count',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? Colors.white
                      : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchemeCard(BuildContext context, ScholarshipScheme scheme, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: scheme.isEligible
              ? (isDark ? const Color(0xFF2563EB).withValues(alpha: 0.5) : const Color(0xFF93C5FD))
              : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Docket Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                Expanded(
                  child: Text(
                    scheme.fundingPattern.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.infoBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (scheme.isApplied)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.emeraldBadgeBg : AppColors.emeraldLight,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.emeraldBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const PulseDot(color: AppColors.emeraldVerified, size: 5),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.applied,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: AppColors.emeraldVerified,
                          ),
                        ),
                      ],
                    ),
                  )
                else if (scheme.isEligible)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.emeraldBadgeBg : AppColors.emeraldLight,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.emeraldBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check, size: 11, color: AppColors.emeraldVerified),
                        const SizedBox(width: 4),
                        Text(
                          AppStrings.eligible100,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: AppColors.emeraldVerified,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface : AppColors.lightBorder,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'POST-GRAD ONLY',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                      ),
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
                  scheme.title,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  scheme.level,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.saffron,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF0F233D) : const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isDark ? const Color(0xFF1E3A5F) : const Color(0xFFBFDBFE),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.account_tree_outlined, size: 10.5, color: isDark ? const Color(0xFF93C5FD) : AppColors.infoBlue),
                      const SizedBox(width: 4.5),
                      Text(
                        'PORTAL: ${scheme.sourcePortal.toUpperCase()}',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w700,
                          color: isDark ? const Color(0xFF93C5FD) : AppColors.infoBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  scheme.description,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11.5,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 12),

                // Financial Highlights Box
                Container(
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorderSubtle : const Color(0xFFBBF7D0),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.currency_rupee, size: 15, color: AppColors.emeraldVerified),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          scheme.financialBenefits,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.emeraldVerified,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Bottom Action Row
                Row(
                  children: [
                    Text(
                      'Deadline: ${scheme.deadline}',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 9.5,
                        color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                      ),
                    ),
                    const Spacer(),
                    if (scheme.isApplied)
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.emeraldVerified,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          minimumSize: Size.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        icon: const Icon(Icons.timeline, size: 13),
                        label: Text(
                          AppStrings.trackPipeline,
                          style: GoogleFonts.plusJakartaSans(fontSize: 11.5, fontWeight: FontWeight.w700),
                        ),
                        onPressed: () => context.go('/tracking'),
                      )
                    else if (scheme.isEligible)
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? const Color(0xFF1E3A64) : AppColors.civicNavy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                          minimumSize: Size.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        icon: const Icon(Icons.bolt, size: 14),
                        label: Text(
                          AppStrings.oneClickApply,
                          style: GoogleFonts.plusJakartaSans(fontSize: 11.5, fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          final allSchemes = ref.read(scholarshipSchemesProvider);
                          final activeApplied = allSchemes.where((s) => s.isApplied).firstOrNull;
                          if (activeApplied != null && activeApplied.id != scheme.id) {
                            _showConcurrencyAdvisorySheet(context, scheme, activeApplied, isDark);
                          } else {
                            _show1ClickApplySheet(context, scheme, isDark);
                          }
                        },
                      )
                    else
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          minimumSize: Size.zero,
                          side: BorderSide(
                            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Requires enrollment in M.Phil / Ph.D. or overseas program.',
                                style: GoogleFonts.plusJakartaSans(fontSize: 12),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Criteria',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 11,
                            color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showConcurrencyAdvisorySheet(
    BuildContext context,
    ScholarshipScheme targetScheme,
    ScholarshipScheme activeScheme,
    bool isDark,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark ? AppColors.darkCard : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.saffron.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.warning_amber_rounded, color: AppColors.saffron, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MoTA Concurrency Rule Enforcement',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.5,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Text(
                        'Statutory Single-Scheme Restriction (GFR Rule 230)',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          color: AppColors.saffron,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () => Navigator.pop(sheetContext),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : const Color(0xFFFFFBEB),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark ? AppColors.darkBorderSubtle : const Color(0xFFFDE68A),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ACTIVE SANCTION IN FORCE:',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${activeScheme.title} (${activeScheme.applicationId ?? "MOTA-2026-ST-890241"})',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 12.5,
                      color: isDark ? Colors.white : AppColors.civicNavyDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Under Ministry of Tribal Affairs guidelines, a student may only avail one central scholarship benefit at a time. PFMS and Aadhaar APBS de-duplication will reject concurrent payment mandates for "${targetScheme.title}".',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      color: isDark ? AppColors.textSecondaryDark : const Color(0xFF92400E),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(42),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.pop(sheetContext);
                ref.read(grievanceProvider.notifier).createTicket(
                      applicationId: activeScheme.applicationId ?? 'MOTA-2026-ST-890241',
                      category: 'Scheme Migration Request',
                      subject: 'Request to migrate to ${targetScheme.title}',
                      description:
                          'Formal application to surrender current grant under ${activeScheme.title} and transfer eligibility to ${targetScheme.title} under MoTA single-scheme norms.',
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Scheme Transfer Request submitted to MoTA Nodal Director!',
                      style: GoogleFonts.plusJakartaSans(fontSize: 12),
                    ),
                    backgroundColor: AppColors.emeraldVerified,
                  ),
                );
              },
              child: Text(
                'Submit Scheme Transfer Request',
                style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12.5),
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                side: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
              icon: const Icon(Icons.smart_toy_outlined, size: 15),
              label: Text(
                'Ask JAGO AI for Policy Details',
                style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12),
              ),
              onPressed: () {
                Navigator.pop(sheetContext);
                JagoChatSheet.show(context, isDark);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _show1ClickApplySheet(BuildContext context, ScholarshipScheme scheme, bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark ? AppColors.darkCard : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
      ),
      builder: (bottomSheetContext) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppColors.emeraldVerified.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.verified_user, color: AppColors.emeraldVerified, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1-Click DigiLocker Direct Transmission',
                        style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Cryptographic zero-upload pipeline to MoTA Central Portal',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () => Navigator.pop(bottomSheetContext),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              scheme.title,
              style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13.5),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark ? AppColors.darkBorderSubtle : const Color(0xFFBBF7D0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Physical Scans or Uploads Required',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: AppColors.emeraldVerified,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your verified ST Certificate (Santhal), Income Certificate (₹1.80L), NIT Jamshedpur Enrollment, and Aadhaar-seeded Bank Account will be attached cryptographically via your verified DigiLocker vault.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      color: isDark ? AppColors.textSecondaryDark : const Color(0xFF14532D),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF1E3A64) : AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(42),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
              onPressed: () {
                ref.read(scholarshipSchemesProvider.notifier).applyToScheme(scheme.id);
                Navigator.pop(bottomSheetContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Successfully submitted application for ${scheme.title}!',
                      style: GoogleFonts.plusJakartaSans(fontSize: 12),
                    ),
                    backgroundColor: AppColors.emeraldVerified,
                  ),
                );
              },
              child: Text(
                'Confirm & Transmit to MoTA Central Portal',
                style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12.5),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
