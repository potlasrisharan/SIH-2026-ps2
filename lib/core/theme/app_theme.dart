import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final baseColorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.civicNavy,
      brightness: Brightness.light,
      primary: AppColors.civicNavy,
      onPrimary: Colors.white,
      secondary: AppColors.saffron,
      onSecondary: Colors.white,
      tertiary: AppColors.emeraldVerified,
      onTertiary: Colors.white,
      surface: AppColors.lightCanvas,
      onSurface: AppColors.textPrimaryLight,
      surfaceContainerLowest: Colors.white,
      outline: AppColors.lightBorder,
      outlineVariant: AppColors.lightBorderSubtle,
    );

    final textTheme = GoogleFonts.outfitTextTheme(ThemeData.light().textTheme).copyWith(
      displayMedium: GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: AppColors.textPrimaryLight,
      ),
      titleLarge: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
        color: AppColors.textPrimaryLight,
      ),
      titleMedium: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryLight,
      ),
      bodyLarge: GoogleFonts.outfit(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.textSecondaryLight,
      ),
      bodyMedium: GoogleFonts.outfit(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.45,
        color: AppColors.textSecondaryLight,
      ),
      labelSmall: GoogleFonts.jetBrainsMono(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: baseColorScheme,
      scaffoldBackgroundColor: AppColors.lightCanvas,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.civicNavyDark,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.lightBorder, width: 1.0),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.civicNavy,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(46),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final baseColorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.civicNavyAccent,
      brightness: Brightness.dark,
      primary: const Color(0xFF93C5FD),
      onPrimary: AppColors.darkCanvas,
      secondary: const Color(0xFFFDE68A),
      onSecondary: const Color(0xFF451A03),
      tertiary: const Color(0xFF6EE7B7),
      onTertiary: const Color(0xFF064E3B),
      surface: AppColors.darkCanvas,
      onSurface: AppColors.textPrimaryDark,
      surfaceContainerLowest: AppColors.darkSurface,
      outline: AppColors.darkBorder,
      outlineVariant: AppColors.darkBorderSubtle,
    );

    final textTheme = GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme).copyWith(
      displayMedium: GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: AppColors.textPrimaryDark,
      ),
      titleLarge: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
        color: AppColors.textPrimaryDark,
      ),
      titleMedium: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryDark,
      ),
      bodyLarge: GoogleFonts.outfit(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.textSecondaryDark,
      ),
      bodyMedium: GoogleFonts.outfit(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.45,
        color: AppColors.textSecondaryDark,
      ),
      labelSmall: GoogleFonts.jetBrainsMono(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: baseColorScheme,
      scaffoldBackgroundColor: AppColors.darkCanvas,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.darkBorder, width: 1.0),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.civicNavyLight,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(46),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}
