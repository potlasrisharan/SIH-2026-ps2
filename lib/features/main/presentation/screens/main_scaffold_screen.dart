import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';

class MainScaffoldScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffoldScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              width: 1.0,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          height: 62,
          backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
          indicatorColor: isDark
              ? const Color(0xFF1E3A5F)
              : AppColors.civicNavy.withValues(alpha: 0.12),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.dashboard_outlined, size: 20),
              selectedIcon: Icon(
                Icons.dashboard,
                size: 20,
                color: isDark ? const Color(0xFF93C5FD) : AppColors.civicNavy,
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: const Icon(Icons.account_balance_outlined, size: 20),
              selectedIcon: Icon(
                Icons.account_balance,
                size: 20,
                color: isDark ? const Color(0xFF93C5FD) : AppColors.civicNavy,
              ),
              label: 'Schemes',
            ),
            NavigationDestination(
              icon: const Icon(Icons.verified_user_outlined, size: 20),
              selectedIcon: const Icon(
                Icons.verified_user,
                size: 20,
                color: AppColors.emeraldVerified,
              ),
              label: 'DigiLocker',
            ),
            NavigationDestination(
              icon: const Icon(Icons.timeline, size: 20),
              selectedIcon: const Icon(
                Icons.timeline,
                size: 20,
                color: AppColors.saffron,
              ),
              label: 'Tracking',
            ),
            NavigationDestination(
              icon: const Icon(Icons.support_agent_outlined, size: 20),
              selectedIcon: const Icon(
                Icons.support_agent,
                size: 20,
                color: AppColors.infoBlue,
              ),
              label: 'Helpdesk',
            ),
          ],
        ),
      ),
    );
  }
}
