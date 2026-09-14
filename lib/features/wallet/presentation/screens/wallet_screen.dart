import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/app_providers.dart';
import '../widgets/qr_verification_dialog.dart';
import '../../data/models/digilocker_document.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final documents = ref.watch(digiLockerDocumentsProvider);

    final filteredDocs = documents.where((doc) {
      if (selectedFilter == 'All') return true;
      if (selectedFilter == 'Caste' && doc.type == DocumentType.caste) return true;
      if (selectedFilter == 'Income' && doc.type == DocumentType.income) return true;
      if (selectedFilter == 'Academic' && doc.type == DocumentType.academic) return true;
      if (selectedFilter == 'Banking' && doc.type == DocumentType.banking) return true;
      return false;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DigiLocker Document Vault',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            tooltip: 'Sync DigiLocker Vault',
            icon: const Icon(Icons.sync),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('DigiLocker certificates synchronized and encrypted in local vault.'),
                  backgroundColor: AppColors.forestGreen,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Institutional security banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: isDark ? AppColors.darkCard : AppColors.forestGreenLight,
            child: Row(
              children: [
                const Icon(Icons.verified, color: AppColors.forestGreen, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unified Credential Repository',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppColors.forestGreen,
                        ),
                      ),
                      Text(
                        'Stored locally with AES-256 encryption. Validated for zero-upload instant applications.',
                        style: TextStyle(
                          fontSize: 11,
                          color: isDark ? Colors.white70 : const Color(0xFF166534),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Filter chips row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: ['All', 'Caste', 'Income', 'Academic', 'Banking'].map((filter) {
                final isSelected = selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    selected: isSelected,
                    label: Text(filter),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? Colors.white
                          : (isDark ? Colors.white70 : AppColors.slateCharcoal),
                    ),
                    selectedColor: AppColors.civicNavy,
                    backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.civicNavy
                            : (isDark ? AppColors.darkBorder : AppColors.slateBorder),
                      ),
                    ),
                    onSelected: (selected) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          // Document List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              itemCount: filteredDocs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final doc = filteredDocs[index];
                return _buildDocumentCard(context, doc);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(BuildContext context, DigiLockerDocument doc) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.slateBorder,
          width: 1.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.civicNavy.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _getDocumentIcon(doc.type),
                    color: AppColors.civicNavy,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doc.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'ID: ${doc.certificateNumber}',
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.infoBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doc.issuer,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.slateTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.forestGreenLight,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.forestGreenBorder),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, size: 12, color: AppColors.forestGreen),
                      SizedBox(width: 2),
                      Text(
                        'VERIFIED',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: AppColors.forestGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Metadata key-values
          Container(
            padding: const EdgeInsets.all(12),
            color: isDark ? Colors.black.withValues(alpha: 0.15) : AppColors.slateCanvas,
            child: Column(
              children: doc.metadata.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Text(
                        '${entry.key}: ',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.slateTextSecondary,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(height: 1),

          // Action row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Text(
                  'Issued: ${doc.issueDate}',
                  style: const TextStyle(fontSize: 11, color: AppColors.slateMuted),
                ),
                const Spacer(),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    minimumSize: Size.zero,
                    side: const BorderSide(color: AppColors.civicNavy),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  icon: const Icon(Icons.qr_code, size: 16, color: AppColors.civicNavy),
                  label: const Text(
                    'Offline QR Pass',
                    style: TextStyle(fontSize: 11, color: AppColors.civicNavy, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => QrVerificationDialog.show(context, doc),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getDocumentIcon(DocumentType type) {
    switch (type) {
      case DocumentType.caste:
        return Icons.badge_outlined;
      case DocumentType.income:
        return Icons.receipt_long_outlined;
      case DocumentType.academic:
        return Icons.school_outlined;
      case DocumentType.banking:
        return Icons.account_balance_outlined;
      case DocumentType.identity:
        return Icons.fingerprint;
    }
  }
}
