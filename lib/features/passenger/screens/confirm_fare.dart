import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icon_names.dart';
import '../../../core/widgets/app_icon.dart';
import '../../shared/widgets/custom_drawer.dart';
import '../../shared/widgets/dummy_map_widget.dart';
import 'home_map.dart';

class PassengerConfirmFareScreen extends StatelessWidget {
  const PassengerConfirmFareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          const DummyMapWidget(
            pulsingPickup: true,
          ),

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
              child: const MainPassengerSheetContent(
                isConfirmActive: true,
                fareText: '50',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
