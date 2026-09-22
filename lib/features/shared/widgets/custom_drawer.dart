import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icon_names.dart';
import '../../../core/widgets/app_icon.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/Profile.png'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mostafa',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textMain,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: const [
                                AppIcon(
                                  name: AppIconNames.star,
                                  size: 16,
                                  color: AppColors.starAmber,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '4.8 (130 Trip)',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.textSecondary,
                        size: 24,
                      ),
                    ],
                  ),
                ),
                const Divider(color: AppColors.border, height: 24),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    children: [
                      _buildMenuItem(
                        iconName: AppIconNames.rides,
                        title: 'Rides',
                        isSelected: true,
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.rentTime,
                        title: 'Rent by time',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.rentDays,
                        title: 'Rent by days',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.wallet,
                        title: 'Wallet',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.history,
                        title: 'Requests history',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.settings,
                        title: 'Settings',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.callSupport,
                        title: 'Call Support',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.inviteFriend,
                        title: 'Invite a Friend',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        iconName: AppIconNames.signOut,
                        title: 'Sign Out',
                        textColor: AppColors.red,
                        iconColor: AppColors.red,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconName,
    required String title,
    bool isSelected = false,
    Color? textColor,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    final effectiveTextColor = isSelected
        ? AppColors.primaryBlue
        : (textColor ?? AppColors.textMain);
    final effectiveIconColor = isSelected
        ? AppColors.primaryBlue
        : (iconColor ?? AppColors.textMain);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.lightBlueBg : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        dense: true,
        leading: AppIcon(
          name: iconName,
          size: 20,
          color: effectiveIconColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: effectiveTextColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
