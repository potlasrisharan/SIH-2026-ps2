import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/providers/app_providers.dart';

class CivicHeader extends ConsumerWidget {
  const CivicHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentLang = ref.watch(appLanguageProvider);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.civicNavyDark,
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkBorder : const Color(0xFF1E3A5F),
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Subtly integrated tricolor indicator band
          Row(
            children: [
              Expanded(child: Container(height: 2.5, color: const Color(0xFFFF9933))),
              Expanded(child: Container(height: 2.5, color: Colors.white)),
              Expanded(child: Container(height: 2.5, color: const Color(0xFF138808))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Ministry Seal Icon Badge
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
                  ),
                  child: const Center(
                    child: Icon(Icons.account_balance, color: Colors.white, size: 20),
                  ),
                ),
                const SizedBox(width: 12),
                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MINISTRY OF TRIBAL AFFAIRS',
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                      Text(
                        AppStrings.portalName,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF94A3B8),
                          fontSize: 10.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // Language Selection Pill
                PopupMenuButton<String>(
                  initialValue: currentLang,
                  tooltip: 'Select Language',
                  onSelected: (lang) => ref.read(appLanguageProvider.notifier).state = lang,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.09),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.language, color: Colors.white, size: 13),
                        const SizedBox(width: 4),
                        Text(
                          currentLang == 'English'
                              ? 'EN'
                              : currentLang == 'Hindi'
                                  ? 'हिन्दी'
                                  : 'ᱥᱟᱱᱛᱟᱲᱤ',
                          style: GoogleFonts.jetBrainsMono(
                            color: Colors.white,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'English', child: Text('English (EN)')),
                    const PopupMenuItem(value: 'Hindi', child: Text('हिन्दी (Hindi)')),
                    const PopupMenuItem(value: 'Santali', child: Text('ᱥᱟᱱᱛᱟᱲᱤ (Santali)')),
                  ],
                ),
                const SizedBox(width: 4),
                // Milestone & Intelligence Alerts Bell
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.notifications_none_outlined, color: Colors.white, size: 20),
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: AppColors.saffron,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '3',
                            style: GoogleFonts.jetBrainsMono(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  tooltip: 'MoTA Milestone & Intelligence Alerts',
                  onPressed: () => _showMilestoneAlertsModal(context, isDark),
                ),
                const SizedBox(width: 2),
                // Theme Mode Switcher
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                  icon: Icon(
                    isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    ref.read(themeModeProvider.notifier).state =
                        isDark ? ThemeMode.light : ThemeMode.dark;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMilestoneAlertsModal(BuildContext context, bool isDark) {
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
                    color: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.notifications_active_outlined, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MoTA Milestone & Intelligence Alerts',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.5,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Text(
                        'Realtime PFMS Events & UDISE+ / APAAR Coverage Radar',
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
                  onPressed: () => Navigator.pop(sheetContext),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // UDISE+ / APAAR Gap Radar Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDark ? const Color(0xFF1E3A5F) : const Color(0xFFBFDBFE),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.radar, size: 15, color: AppColors.infoBlue),
                      const SizedBox(width: 6),
                      Text(
                        'UDISE+ & APAAR GAP DETECTION RADAR',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.infoBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'MoTA intelligence matching with UDISE+ school census and APAAR identifiers identified 14,210 eligible ST students in Dumka district not yet availing scholarship benefits.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11.5,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textPrimaryLight,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Status: Automated CSC Kendra & WhatsApp outreach triggered by District Welfare Office.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.emeraldVerified,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            Text(
              'RECENT APPLICATION MILESTONES',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
              ),
            ),
            const SizedBox(height: 8),

            // Milestone 1: PFMS Disbursal
            _buildMilestoneItem(
              title: 'PFMS DBT Disbursal Complete',
              subtitle: '₹84,500 credited to SBI (*******4521) • UTR: PFMS2026091178219082',
              time: '11 Sep 2026, 04:30 PM',
              icon: Icons.check_circle,
              color: AppColors.emeraldVerified,
              isDark: isDark,
            ),
            const SizedBox(height: 8),

            // Milestone 2: Institute Verification
            _buildMilestoneItem(
              title: 'NIT Jamshedpur Nodal Verification Cleared',
              subtitle: 'Active attendance (>82%) & bonafide validated online by Registrar',
              time: '18 Aug 2026, 11:15 AM',
              icon: Icons.verified_user,
              color: AppColors.infoBlue,
              isDark: isDark,
            ),
            const SizedBox(height: 8),

            // Milestone 3: DigiLocker Link
            _buildMilestoneItem(
              title: 'DigiLocker Cryptographic Pass Synced',
              subtitle: 'JH-ST-2023-982173 verified with SDM Dumka server',
              time: '12 Aug 2026, 09:00 AM',
              icon: Icons.lock_outline,
              color: AppColors.saffron,
              isDark: isDark,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestoneItem({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required Color color,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 8.5,
                        color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
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
    );
  }
}
