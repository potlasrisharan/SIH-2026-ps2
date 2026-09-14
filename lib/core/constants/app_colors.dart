import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Civic Palette
  static const Color civicNavy = Color(0xFF0E2A47);
  static const Color civicNavyDark = Color(0xFF08192C);
  static const Color civicNavyLight = Color(0xFF1B3D66);
  static const Color civicNavyAccent = Color(0xFF2D5D94);

  // Calibrated Accents (Saturation < 80%, No Purple/Lila)
  static const Color saffron = Color(0xFFD97706); // Warm Ochre/Saffron
  static const Color saffronLight = Color(0xFFFEF3C7);
  static const Color saffronBorder = Color(0xFFFCD34D);

  static const Color emeraldVerified = Color(0xFF059669); // Forest Emerald
  static const Color emeraldLight = Color(0xFFD1FAE5);
  static const Color emeraldBorder = Color(0xFF6EE7B7);

  // Neutrals (Zinc / Slate — Off-Black, No Pure #000000)
  static const Color darkCanvas = Color(0xFF0B0F17);
  static const Color darkSurface = Color(0xFF121824);
  static const Color darkCard = Color(0xFF1A2232);
  static const Color darkCardHover = Color(0xFF222C40);
  static const Color darkBorder = Color(0xFF263248);
  static const Color darkBorderSubtle = Color(0xFF1E283A);

  static const Color lightCanvas = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightBorderSubtle = Color(0xFFEEF2F6);

  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textMutedLight = Color(0xFF94A3B8);

  static const Color textPrimaryDark = Color(0xFFF1F5F9);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color textMutedDark = Color(0xFF64748B);

  // Status Colors
  static const Color errorRed = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color infoBlue = Color(0xFF0284C7);
  static const Color infoLight = Color(0xFFE0F2FE);
}
