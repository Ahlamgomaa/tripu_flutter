import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icon_names.dart';
import '../../../core/widgets/app_icon.dart';
import '../../shared/widgets/custom_drawer.dart';

class PassengerWalletScreen extends StatelessWidget {
  const PassengerWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const AppIcon(
            name: AppIconNames.menu,
            size: 24,
            color: AppColors.textMain,
          ),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title: Wallet
              const Text(
                'Wallet',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 16),

              // Gradient Wallet Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF2563EB),
                      Color(0xFF1D4ED8),
                      Color(0xFF4F46E5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            AppIcon(
                              name: AppIconNames.wallet,
                              size: 20,
                              color: AppColors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'TripU Cash',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.white,
                          size: 24,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'EGP 0.00',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const AppIcon(
                        name: AppIconNames.addFunds,
                        size: 18,
                        color: AppColors.primaryBlue,
                      ),
                      label: const Text(
                        '+ Add Funds',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // PAYMENT METHOD Section
              const Text(
                'PAYMENT METHOD',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const AppIcon(
                    name: AppIconNames.cash,
                    size: 22,
                    color: AppColors.green,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Cash',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textMain,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  AppIcon(
                    name: AppIconNames.addFunds,
                    size: 20,
                    color: AppColors.primaryBlue,
                  ),
                  SizedBox(width: 12),
                  Text(
                    '+ Add Payment Method',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(color: AppColors.border),
              const SizedBox(height: 16),

              // Transaction History
              const Text(
                'Transaction History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 16),

              // Today group
              const Text(
                'Today',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              _buildTransactionItem(
                iconName: AppIconNames.fawry,
                title: 'Fawry Transfer',
                time: '08:00 PM',
                amount: '+EGP 100',
              ),
              _buildTransactionItem(
                iconName: AppIconNames.card,
                title: 'Card Deposit',
                time: '01:00 AM',
                amount: '+EGP 100',
              ),

              const SizedBox(height: 16),
              // Tuesday, 19 June group
              const Text(
                'Tuesday, 19 June',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              _buildTransactionItem(
                iconName: AppIconNames.paypal,
                title: 'Paypal Transfer',
                time: '05:00 PM',
                amount: '+EGP 100',
              ),
              _buildTransactionItem(
                iconName: AppIconNames.fawry,
                title: 'Fawry Transfer',
                time: '08:00 PM',
                amount: '+EGP 100',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildTransactionItem({
    required String iconName,
    required String title,
    required String time,
    required String amount,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.border.withValues(alpha: 0.4),
              shape: BoxShape.circle,
            ),
            child: AppIcon(
              name: iconName,
              size: 20,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMain,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
