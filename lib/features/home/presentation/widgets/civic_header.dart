import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
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
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                      Text(
                        'Unified Scholarship Digital Public Infrastructure',
                        style: GoogleFonts.outfit(
                          color: const Color(0xFF94A3B8),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.09),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.language, color: Colors.white, size: 14),
                        const SizedBox(width: 5),
                        Text(
                          currentLang == 'English'
                              ? 'EN'
                              : currentLang == 'Hindi'
                                  ? 'हिन्दी'
                                  : 'ᱥᱟᱱᱛᱟᱲᱤ',
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 11,
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
                const SizedBox(width: 6),
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
}
