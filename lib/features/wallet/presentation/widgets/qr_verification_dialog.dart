import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/digilocker_document.dart';

class QrVerificationDialog extends StatelessWidget {
  final DigiLockerDocument document;

  const QrVerificationDialog({
    super.key,
    required this.document,
  });

  static void show(BuildContext context, DigiLockerDocument document) {
    showDialog(
      context: context,
      builder: (context) => QrVerificationDialog(document: document),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      backgroundColor: isDark ? AppColors.darkCard : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Modal Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppColors.emeraldVerified.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.qr_code_2, color: AppColors.emeraldVerified, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Offline Cryptographic QR Pass',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Zero-Network Verifiable Credential',
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // High Contrast QR Frame
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFCBD5E1), width: 1.0),
              ),
              child: QrImageView(
                data: document.qrPayload,
                version: QrVersions.auto,
                size: 190.0,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xFF0F172A),
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Metadata Card
            Container(
              width: double.infinity,
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
                  Text(
                    document.title,
                    style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'CERT ID: ${document.certificateNumber}',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.infoBlue,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    document.issuer,
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      color: isDark ? AppColors.textMutedDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.verified, size: 12, color: AppColors.emeraldVerified),
                      const SizedBox(width: 4),
                      Text(
                        'Digitally Signed via Certifying Authority India',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: AppColors.emeraldVerified,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Close Action
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF1E3A5F) : AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(40),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close Pass',
                style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
