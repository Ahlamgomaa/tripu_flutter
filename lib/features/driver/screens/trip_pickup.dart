import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icon_names.dart';
import '../../../core/widgets/app_icon.dart';
import '../../shared/widgets/custom_drawer.dart';
import '../../shared/widgets/dummy_map_widget.dart';

class DriverTripPickupScreen extends StatelessWidget {
  const DriverTripPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          // Map showing route to pickup
          const DummyMapWidget(
            showRoute: true,
            mutedRoute: false,
          ),

          // Menu button top-left
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => scaffoldKey.currentState?.openDrawer(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const AppIcon(
                    name: AppIconNames.menu,
                    size: 24,
                    color: AppColors.textMain,
                  ),
                ),
              ),
            ),
          ),

          // Bottom card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: AppColors.border,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, color: AppColors.textSecondary),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Mostafa',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textMain,
                                  ),
                                ),
                                SizedBox(width: 6),
                                AppIcon(
                                  name: AppIconNames.star,
                                  size: 14,
                                  color: AppColors.starAmber,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '4.8 (130)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '6th October City',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Pickup time : 10:00 min.
                  const Text(
                    'Pickup time : 10:00 min.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Thin blue progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: AppColors.border,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                      minHeight: 4,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Button: "Swap to start your trip"
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Spacer(),
                          Text(
                            'Swap to start your trip',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          AppIcon(
                            name: AppIconNames.doubleChevron,
                            size: 20,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
