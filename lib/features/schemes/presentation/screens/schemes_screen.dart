import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/widgets/pulse_dot.dart';
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

    final filteredSchemes = schemes.where((scheme) {
      if (selectedTab == 'Eligible for You') return scheme.isEligible;
      if (selectedTab == 'Applied') return scheme.isApplied;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MoTA Scholarship Schemes',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 18),
        ),
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
              itemCount: filteredSchemes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final scheme = filteredSchemes[index];
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
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy)
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.22)
                    : (isDark ? AppColors.darkSurface : AppColors.lightBorder),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
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
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: scheme.isEligible
              ? (isDark ? const Color(0xFF1E3A8A) : const Color(0xFFBFDBFE))
              : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
          width: scheme.isEligible ? 1.4 : 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    scheme.fundingPattern.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.infoBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (scheme.isApplied)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.emeraldVerified.withValues(alpha: 0.15)
                          : AppColors.emeraldLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.emeraldBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const PulseDot(color: AppColors.emeraldVerified, size: 5),
                        const SizedBox(width: 5),
                        Text(
                          'APPLIED',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: AppColors.emeraldVerified,
                          ),
                        ),
                      ],
                    ),
                  )
                else if (scheme.isEligible)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.emeraldVerified.withValues(alpha: 0.15)
                          : AppColors.emeraldLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.emeraldBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check, size: 11, color: AppColors.emeraldVerified),
                        const SizedBox(width: 4),
                        Text(
                          '100% ELIGIBLE',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: AppColors.emeraldVerified,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface : AppColors.lightBorder,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'POST-GRAD ONLY',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scheme.title,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  scheme.level,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.saffron,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  scheme.description,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),

                // Financial Highlights Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.currency_rupee, size: 16, color: AppColors.emeraldVerified),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          scheme.financialBenefits,
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.emeraldVerified,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Bottom Action Row
                Row(
                  children: [
                    Text(
                      'Deadline: ${scheme.deadline}',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.timeline, size: 13),
                        label: Text('Track Pipeline', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600)),
                        onPressed: () => context.go('/tracking'),
                      )
                    else if (scheme.isEligible)
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          minimumSize: Size.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.bolt, size: 15),
                        label: Text('1-Click Apply', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600)),
                        onPressed: () => _show1ClickApplySheet(context, scheme, isDark),
                      )
                    else
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          minimumSize: Size.zero,
                          side: BorderSide(
                            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Requires enrollment in M.Phil / Ph.D. or overseas program.',
                                style: GoogleFonts.outfit(fontSize: 12),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Criteria',
                          style: GoogleFonts.outfit(
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

  void _show1ClickApplySheet(BuildContext context, ScholarshipScheme scheme, bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark ? AppColors.darkCard : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) => Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.emeraldVerified.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.verified_user, color: AppColors.emeraldVerified, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1-Click DigiLocker Application',
                        style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Zero-Upload Instant Submission',
                        style: GoogleFonts.outfit(
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
            const SizedBox(height: 14),
            Text(
              scheme.title,
              style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : AppColors.emeraldLight.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDark ? AppColors.darkBorderSubtle : AppColors.emeraldBorder,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Physical Scans or Uploads Required',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: AppColors.emeraldVerified,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your verified ST Certificate (Santhal), Income Certificate (₹1.80L), NIT Jamshedpur Enrollment, and Aadhaar-seeded Bank Account will be attached cryptographically via your verified DigiLocker vault.',
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      color: isDark ? AppColors.textSecondaryDark : const Color(0xFF14532D),
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(46),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                ref.read(scholarshipSchemesProvider.notifier).applyToScheme(scheme.id);
                Navigator.pop(bottomSheetContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Successfully submitted application for ${scheme.title}!',
                      style: GoogleFonts.outfit(fontSize: 12),
                    ),
                    backgroundColor: AppColors.emeraldVerified,
                  ),
                );
              },
              child: Text(
                'Confirm & Transmit to MoTA Central Portal',
                style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
