import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final schemes = ref.watch(scholarshipSchemesProvider);

    final filteredSchemes = schemes.where((scheme) {
      if (selectedTab == 'Eligible for You') return scheme.isEligible;
      if (selectedTab == 'Applied') return scheme.isApplied;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MoTA Scholarship Schemes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: isDark ? AppColors.darkSurface : Colors.white,
            child: Row(
              children: [
                _buildTab('Eligible for You', count: schemes.where((s) => s.isEligible).length),
                const SizedBox(width: 8),
                _buildTab('All Schemes', count: schemes.length),
                const SizedBox(width: 8),
                _buildTab('Applied', count: schemes.where((s) => s.isApplied).length),
              ],
            ),
          ),
          const Divider(height: 1),

          // Schemes List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: filteredSchemes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final scheme = filteredSchemes[index];
                return _buildSchemeCard(context, scheme);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, {required int count}) {
    final isSelected = selectedTab == title;
    return InkWell(
      onTap: () => setState(() => selectedTab = title),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.civicNavy : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.civicNavy : AppColors.slateBorder,
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : AppColors.slateTextSecondary,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withValues(alpha: 0.25) : AppColors.slateBorder,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppColors.slateCharcoal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchemeCard(BuildContext context, ScholarshipScheme scheme) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: scheme.isEligible
              ? (isDark ? const Color(0xFF1E3A8A) : const Color(0xFFBFDBFE))
              : (isDark ? AppColors.darkBorder : AppColors.slateBorder),
          width: scheme.isEligible ? 1.5 : 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: scheme.isEligible
                  ? (isDark ? const Color(0xFF0F2650) : const Color(0xFFEFF6FF))
                  : (isDark ? Colors.black26 : AppColors.slateCanvas),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    scheme.fundingPattern,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.infoBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (scheme.isApplied)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.forestGreenLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'APPLIED',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.forestGreen,
                      ),
                    ),
                  )
                else if (scheme.isEligible)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.forestGreenLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.check, size: 12, color: AppColors.forestGreen),
                        SizedBox(width: 2),
                        Text(
                          '100% ELIGIBLE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.forestGreen,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.slateBorder,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'CRITERIA NOT MET',
                      style: TextStyle(fontSize: 10, color: AppColors.slateTextSecondary),
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  scheme.level,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.saffron,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  scheme.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.slateTextSecondary,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 10),

                // Financial Highlights
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black.withValues(alpha: 0.2) : AppColors.slateCanvas,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorder : AppColors.slateBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.currency_rupee, size: 18, color: AppColors.forestGreen),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          scheme.financialBenefits,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.forestGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Bottom Action
                Row(
                  children: [
                    Text(
                      'Deadline: ${scheme.deadline}',
                      style: const TextStyle(fontSize: 11, color: AppColors.slateMuted),
                    ),
                    const Spacer(),
                    if (scheme.isApplied)
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.forestGreen,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          minimumSize: Size.zero,
                        ),
                        icon: const Icon(Icons.track_changes, size: 14),
                        label: const Text('Track Application', style: TextStyle(fontSize: 12)),
                        onPressed: () => context.go('/tracking'),
                      )
                    else if (scheme.isEligible)
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.civicNavy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          minimumSize: Size.zero,
                        ),
                        icon: const Icon(Icons.flash_on, size: 16),
                        label: const Text('1-Click Apply', style: TextStyle(fontSize: 12)),
                        onPressed: () {
                          _show1ClickApplyConfirmation(context, scheme);
                        },
                      )
                    else
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          minimumSize: Size.zero,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('This scheme is for Postgraduate / Research scholars.'),
                            ),
                          );
                        },
                        child: const Text('Eligibility Criteria', style: TextStyle(fontSize: 12)),
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

  void _show1ClickApplyConfirmation(BuildContext context, ScholarshipScheme scheme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.verified_user, color: AppColors.forestGreen, size: 24),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    '1-Click DigiLocker Direct Application',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(bottomSheetContext),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Applying for: ${scheme.title}',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.forestGreenLight,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.forestGreenBorder),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Documents Required to Upload',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.forestGreen,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Your verified ST Caste Certificate, Income Certificate (₹1.80L), NIT Jamshedpur Enrollment, and DBT Bank Account will be attached cryptographically via your verified DigiLocker vault.',
                    style: TextStyle(fontSize: 11, color: Color(0xFF14532D)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: () {
                ref.read(scholarshipSchemesProvider.notifier).applyToScheme(scheme.id);
                Navigator.pop(bottomSheetContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Successfully submitted application for ${scheme.title}!'),
                    backgroundColor: AppColors.forestGreen,
                  ),
                );
              },
              child: const Text('Confirm & Transmit to MoTA Portal'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
