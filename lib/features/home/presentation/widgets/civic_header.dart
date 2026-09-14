import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';

class CivicHeader extends ConsumerWidget {
  const CivicHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentLang = ref.watch(appLanguageProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tricolor Identity Strip
        Row(
          children: [
            Expanded(child: Container(height: 3.5, color: const Color(0xFFFF9933))),
            Expanded(child: Container(height: 3.5, color: Colors.white)),
            Expanded(child: Container(height: 3.5, color: const Color(0xFF138808))),
          ],
        ),
        // Primary National Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: isDark ? AppColors.darkSurface : AppColors.civicNavy,
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
                ),
                child: const Center(
                  child: Icon(Icons.account_balance, color: Colors.white, size: 20),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MINISTRY OF TRIBAL AFFAIRS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Text(
                      'Unified Scholarship Digital Portal (MoTA)',
                      style: TextStyle(
                        color: Color(0xFFCBD5E1),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Language Selector
              PopupMenuButton<String>(
                initialValue: currentLang,
                tooltip: 'Select Language',
                onSelected: (lang) => ref.read(appLanguageProvider.notifier).state = lang,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.translate, color: Colors.white, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        currentLang == 'English' ? 'EN' : currentLang == 'Hindi' ? 'हिन्दी' : 'संताली',
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'English', child: Text('English (EN)')),
                  const PopupMenuItem(value: 'Hindi', child: Text('हिन्दी (Hindi)')),
                  const PopupMenuItem(value: 'Santali', child: Text('ᱥᱟᱱᱛᱟᱲᱤ (Santali - Ol Chiki)')),
                ],
              ),
              const SizedBox(width: 6),
              // Theme Toggle
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
    );
  }
}
