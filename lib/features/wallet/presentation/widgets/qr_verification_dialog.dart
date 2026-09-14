import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.qr_code_scanner, color: AppColors.forestGreen, size: 20),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Offline QR Verification',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'GIGW & DigiLocker Verifiable Token',
                        style: TextStyle(fontSize: 11, color: AppColors.slateTextSecondary),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // QR Code Container
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.slateBorder, width: 1.5),
              ),
              child: QrImageView(
                data: document.qrPayload,
                version: QrVersions.auto,
                size: 200.0,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: AppColors.civicNavy,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: AppColors.civicNavy,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Document Details Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : AppColors.slateCanvas,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.slateBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    document.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cert No: ${document.certificateNumber}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.infoBlue,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Issuer: ${document.issuer}',
                    style: const TextStyle(fontSize: 11, color: AppColors.slateTextSecondary),
                  ),
                  const SizedBox(height: 6),
                  const Row(
                    children: [
                      Icon(Icons.lock_outline, size: 12, color: AppColors.forestGreen),
                      SizedBox(width: 4),
                      Text(
                        'Tamper-Proof Cryptographic Hash (Offline Verifiable)',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.forestGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Done Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.civicNavy,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(42),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close QR Pass'),
            ),
          ],
        ),
      ),
    );
  }
}
