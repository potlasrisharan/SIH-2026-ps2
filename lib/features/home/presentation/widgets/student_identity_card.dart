import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/pulse_dot.dart';
import '../../data/models/student_profile.dart';

class StudentIdentityCard extends StatelessWidget {
  final StudentProfile student;

  const StudentIdentityCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bento Top Bar: Status and Verification Seal
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.emeraldVerified.withValues(alpha: 0.15)
                        : AppColors.emeraldLight,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDark
                          ? AppColors.emeraldVerified.withValues(alpha: 0.4)
                          : AppColors.emeraldBorder,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const PulseDot(color: AppColors.emeraldVerified, size: 6),
                      const SizedBox(width: 6),
                      Text(
                        'DIGILOCKER VERIFIED',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.emeraldVerified,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  student.id,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),

          // Primary Student Profile Stack
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar with subtle inner ring
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E2E48) : AppColors.civicNavy,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark ? const Color(0xFF3B82F6) : const Color(0xFF1E3A5F),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          student.name.split(' ').map((e) => e[0]).take(2).join(),
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: GoogleFonts.outfit(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.saffron,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                student.category,
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.saffron,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${student.district}, ${student.state}',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Institutional Enrollment & Program Row
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.school, size: 14, color: AppColors.civicNavyLight),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              student.institution,
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        student.course,
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Asymmetric Dual Metric Tiles (Income & Bank Seeded)
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ANNUAL FAMILY INCOME',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '₹ 1,80,000',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.emeraldVerified,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface : AppColors.lightCanvas,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isDark ? AppColors.darkBorderSubtle : AppColors.lightBorder,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AADHAAR / DBT SEEDING',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.check_circle, size: 12, color: AppColors.emeraldVerified),
                                const SizedBox(width: 4),
                                Text(
                                  student.bankAccountMasked,
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Vault Encrypted Footer Ribbon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.25)
                  : const Color(0xFFF1F5F9),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock_clock, size: 13, color: AppColors.infoBlue),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Tamper-proof local vault • Synchronized ${student.offlineSyncDate}',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                    ),
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
