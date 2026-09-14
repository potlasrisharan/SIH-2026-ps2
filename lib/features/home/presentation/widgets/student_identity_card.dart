import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/student_profile.dart';

class StudentIdentityCard extends StatelessWidget {
  final StudentProfile student;

  const StudentIdentityCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.slateBorder,
          width: 1.2,
        ),
      ),
      child: Column(
        children: [
          // Top Credential Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.civicNavyDark
                  : AppColors.civicNavy.withValues(alpha: 0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.verified_user,
                  color: AppColors.forestGreen,
                  size: 18,
                ),
                const SizedBox(width: 6),
                const Text(
                  'DigiLocker Certified Identity',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.forestGreen,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.forestGreenLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.forestGreenBorder),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle, color: AppColors.forestGreen, size: 12),
                      SizedBox(width: 4),
                      Text(
                        '100% VERIFIED',
                        style: TextStyle(
                          color: AppColors.forestGreen,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Student Main Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.civicNavy,
                      child: Text(
                        student.name.split(' ').map((e) => e[0]).take(2).join(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            student.category,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.saffron,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${student.district}, ${student.state}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isDark ? const Color(0xFF94A3B8) : AppColors.slateTextSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Divider(height: 1),
                const SizedBox(height: 12),
                // Grid of verified parameters
                _buildInfoRow(
                  context,
                  icon: Icons.school_outlined,
                  label: 'Institution',
                  value: student.institution,
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context,
                  icon: Icons.account_tree_outlined,
                  label: 'Program',
                  value: student.course,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoRow(
                        context,
                        icon: Icons.currency_rupee,
                        label: 'Annual Income',
                        value: '₹ 1.80 Lakh',
                        valueColor: AppColors.forestGreen,
                      ),
                    ),
                    Expanded(
                      child: _buildInfoRow(
                        context,
                        icon: Icons.credit_card,
                        label: 'Aadhaar / DBT',
                        value: 'Bank Seeded',
                        valueColor: AppColors.forestGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bottom Policy Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.2)
                  : AppColors.slateCanvas,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.offline_pin, size: 14, color: AppColors.infoBlue),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Vault encrypted locally • Offline verified on ${student.offlineSyncDate}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.slateTextSecondary,
                      fontWeight: FontWeight.w500,
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

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: isDark ? const Color(0xFF94A3B8) : AppColors.slateTextSecondary),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: TextStyle(
                    color: isDark ? const Color(0xFF94A3B8) : AppColors.slateTextSecondary,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: valueColor ?? (isDark ? Colors.white : AppColors.slateCharcoal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
