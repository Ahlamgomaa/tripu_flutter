import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icon_names.dart';
import '../../../core/widgets/app_icon.dart';
import '../../shared/widgets/custom_drawer.dart';
import '../../shared/widgets/dummy_map_widget.dart';

class PassengerHomeMapScreen extends StatefulWidget {
  final bool openDrawerOnInit;

  const PassengerHomeMapScreen({
    super.key,
    this.openDrawerOnInit = false,
  });

  @override
  State<PassengerHomeMapScreen> createState() => _PassengerHomeMapScreenState();
}

class _PassengerHomeMapScreenState extends State<PassengerHomeMapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (widget.openDrawerOnInit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scaffoldKey.currentState?.openDrawer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          const DummyMapWidget(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => _scaffoldKey.currentState?.openDrawer(),
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
                isConfirmActive: false,
                fareText: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPassengerSheetContent extends StatelessWidget {
  final bool isConfirmActive;
  final String? fareText;

  const MainPassengerSheetContent({
    super.key,
    this.isConfirmActive = false,
    this.fareText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.lightBlueBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AppIcon(
                      name: AppIconNames.carRide,
                      size: 20,
                      color: AppColors.primaryBlue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Ride',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AppIcon(
                      name: AppIconNames.carComfort,
                      size: 20,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Comfort',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: const [
            AppIcon(
              name: AppIconNames.locationPin,
              size: 20,
              color: AppColors.primaryBlue,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Mohammed Ezz El-Arab St',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMain,
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 12,
            child: VerticalDivider(color: AppColors.border, thickness: 1),
          ),
        ),

        Row(
          children: const [
            AppIcon(
              name: AppIconNames.locationPin,
              size: 20,
              color: AppColors.red,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Ain Shames University',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMain,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(color: AppColors.border),
        const SizedBox(height: 12),

        Row(
          children: [
            const Text(
              'EGP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.textMain,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                fareText ?? 'Offer your fare',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: fareText != null ? FontWeight.bold : FontWeight.normal,
                  color: fareText != null ? AppColors.textMain : AppColors.textSecondary,
                ),
              ),
            ),
            const AppIcon(
              name: AppIconNames.cash,
              size: 20,
              color: AppColors.green,
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(color: AppColors.border),
        const SizedBox(height: 12),

        Row(
          children: [
            const Text(
              'PAYMENT',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 12),
            const AppIcon(
              name: AppIconNames.cash,
              size: 20,
              color: AppColors.green,
            ),
            const SizedBox(width: 6),
            const Text(
              'Cash',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textMain,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
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
        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isConfirmActive ? AppColors.primaryBlue : AppColors.disabledBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
