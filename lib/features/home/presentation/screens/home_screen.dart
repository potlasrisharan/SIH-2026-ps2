import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
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
                  await Future.delayed(const Duration(milliseconds: 500));
                  ref.read(digiLockerDocumentsProvider.notifier).refreshAll();
                },
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Principle motto ribbon
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.civicNavyDark
                            : AppColors.civicNavy.withValues(alpha: 0.07),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark ? AppColors.darkBorder : AppColors.civicNavy.withValues(alpha: 0.2),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.shield_outlined, color: AppColors.civicNavy, size: 20),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enter Once. Verify Once. Apply Anywhere.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: AppColors.civicNavy,
                                  ),
                                ),
                                Text(
                                  'Unified DigiLocker-linked single-window scholarship workflow',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.slateTextSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Student Profile Card
                    StudentIdentityCard(student: student),
                    const SizedBox(height: 16),

                    // Auto Eligibility Matched Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isDark
                              ? [const Color(0xFF1E293B), const Color(0xFF0F172A)]
                              : [const Color(0xFFEFF6FF), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark ? AppColors.darkBorder : const Color(0xFFBFDBFE),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2563EB).withValues(alpha: 0.15),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.auto_awesome,
                                  color: Color(0xFF2563EB),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Smart Eligibility Engine',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Color(0xFF1D4ED8),
                                      ),
                                    ),
                                    Text(
                                      '$eligibleSchemesCount MoTA Schemes Matched with 100% Eligibility',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: isDark ? Colors.white70 : AppColors.slateCharcoal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Your verified ST category (Santhal), Income (₹1.80L < ₹6.0L), and enrollment in NIT Jamshedpur automatically qualify you for Central Sector funding.',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.slateTextSecondary,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.civicNavy,
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(42),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(Icons.touch_app_outlined, size: 18),
                            label: const Text('Explore & 1-Click Apply'),
                            onPressed: () => context.go('/schemes'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Active Application Status Banner
                    if (applications.isNotEmpty) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Active Application Pipeline',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/tracking'),
                            child: const Text('View Full Timeline >', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _buildActiveApplicationCard(context, applications.first),
                      const SizedBox(height: 16),
                    ],

                    // Quick Actions Section
                    Text(
                      'Core Student Services',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionTile(
                            context,
                            icon: Icons.folder_special,
                            title: 'DigiLocker Vault',
                            subtitle: '5 Verified Certs',
                            color: AppColors.forestGreen,
                            onTap: () => context.go('/wallet'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionTile(
                            context,
                            icon: Icons.track_changes,
                            title: 'DBT Tracking',
                            subtitle: 'Direct Disbursal',
                            color: AppColors.saffron,
                            onTap: () => context.go('/tracking'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionTile(
                            context,
                            icon: Icons.account_balance_wallet_outlined,
                            title: 'Central Schemes',
                            subtitle: '5 MoTA Grants',
                            color: AppColors.civicNavy,
                            onTap: () => context.go('/schemes'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionTile(
                            context,
                            icon: Icons.support_agent,
                            title: 'Tribal Grievance',
                            subtitle: 'C-PGRMS Redressal',
                            color: AppColors.infoBlue,
                            onTap: () => context.go('/grievance'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Institutional Notices & Advisories
                    Text(
                      'MoTA Announcements & Circulars',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildNoticeTile(
                      context,
                      date: '10 Sep 2026',
                      title: 'Sanction Order MOTA/TC/2026/0492 Disbursed via PFMS',
                      body: 'Full grant for academic year 2026-27 credited directly to ST scholars in premier institutes.',
                    ),
                    const SizedBox(height: 8),
                    _buildNoticeTile(
                      context,
                      date: '02 Sep 2026',
                      title: 'Offline DigiLocker Token Authentication Enabled',
                      body: 'District Nodal Officers can verify student certificates offline via verifiable secure QR codes.',
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

  Widget _buildActiveApplicationCard(
    BuildContext context,
    dynamic application,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: () => context.go('/tracking'),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.slateBorder,
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
                    color: AppColors.forestGreenLight,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.forestGreenBorder),
                  ),
                  child: const Text(
                    'DBT DISBURSED',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.forestGreen,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  application.applicationId,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.slateTextSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              application.schemeTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.currency_rupee, size: 16, color: AppColors.forestGreen),
                Text(
                  '₹${application.amount.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.forestGreen,
                  ),
                ),
                const SizedBox(width: 8),
                const Text('•', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Credited to ${application.bankAccountMasked} (${application.bankName})',
                    style: const TextStyle(fontSize: 11, color: AppColors.slateTextSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.slateBorder),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 11, color: AppColors.slateTextSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticeTile(
    BuildContext context, {
    required String date,
    required String title,
    required String body,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.slateBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.circle, size: 8, color: AppColors.saffron),
              const SizedBox(width: 6),
              Text(
                date,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.saffron),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 2),
          Text(body, style: const TextStyle(fontSize: 11, color: AppColors.slateTextSecondary, height: 1.3)),
        ],
      ),
    );
  }
}
