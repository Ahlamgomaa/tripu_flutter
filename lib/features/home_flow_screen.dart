import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import 'passenger/screens/home_map.dart';
import 'passenger/screens/confirm_fare.dart';
import 'passenger/screens/route_preview.dart';
import 'passenger/screens/searching.dart';
import 'passenger/screens/driver_offers.dart';
import 'passenger/screens/wallet.dart';

import 'driver/screens/requests_list.dart';
import 'driver/screens/request_detail.dart';
import 'driver/screens/custom_fare.dart';
import 'driver/screens/waiting_reply.dart';
import 'driver/screens/trip_pickup.dart';
import 'driver/screens/wallet.dart';

class HomeFlowScreen extends StatefulWidget {
  final bool initialIsPassengerFlow;

  const HomeFlowScreen({
    super.key,
    this.initialIsPassengerFlow = false,
  });

  @override
  State<HomeFlowScreen> createState() => _HomeFlowScreenState();
}

class _HomeFlowScreenState extends State<HomeFlowScreen> {
  late bool _isPassengerFlow;
  int _passengerScreenIndex = 0;
  int _driverScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    _isPassengerFlow = widget.initialIsPassengerFlow;
  }

  final List<String> _passengerScreenTitles = [
    '1. Drawer Open',
    '2. Set Pickup/Destination',
    '3. Confirm Fare',
    '4. Route Preview',
    '5. Searching',
    '6. Driver Offers',
    '7. Wallet',
  ];

  final List<String> _driverScreenTitles = [
    '1. Drawer Open',
    '2. Ride Requests List',
    '3. Request Detail',
    '4. Custom Fare',
    '5. Waiting for Reply',
    '6. Trip Pickup',
    '7. Wallet',
  ];

  Widget _getPassengerScreen(int index) {
    switch (index) {
      case 0:
        return const PassengerHomeMapScreen(openDrawerOnInit: true);
      case 1:
        return const PassengerHomeMapScreen(openDrawerOnInit: false);
      case 2:
        return const PassengerConfirmFareScreen();
      case 3:
        return const PassengerRoutePreviewScreen();
      case 4:
        return const PassengerSearchingScreen();
      case 5:
        return const PassengerDriverOffersScreen();
      case 6:
        return const PassengerWalletScreen();
      default:
        return const PassengerHomeMapScreen();
    }
  }

  Widget _getDriverScreen(int index) {
    switch (index) {
      case 0:
        return const DriverRequestsListScreen(openDrawerOnInit: true);
      case 1:
        return const DriverRequestsListScreen(openDrawerOnInit: false);
      case 2:
        return const DriverRequestDetailScreen();
      case 3:
        return const DriverCustomFareScreen();
      case 4:
        return const DriverWaitingReplyScreen();
      case 5:
        return const DriverTripPickupScreen();
      case 6:
        return const DriverWalletScreen();
      default:
        return const DriverRequestsListScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final titles = _isPassengerFlow ? _passengerScreenTitles : _driverScreenTitles;
    final currentIndex = _isPassengerFlow ? _passengerScreenIndex : _driverScreenIndex;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Material(
              elevation: 4,
              color: AppColors.white,
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ChoiceChip(
                              label: const Center(
                                child: Text(
                                  'PASSENGER FLOW',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                              selected: _isPassengerFlow,
                              selectedColor: AppColors.primaryBlue,
                              labelStyle: TextStyle(
                                color: _isPassengerFlow ? AppColors.white : AppColors.textMain,
                              ),
                              onSelected: (val) {
                                if (val) setState(() => _isPassengerFlow = true);
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ChoiceChip(
                              label: const Center(
                                child: Text(
                                  'DRIVER FLOW',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                              selected: !_isPassengerFlow,
                              selectedColor: AppColors.primaryBlue,
                              labelStyle: TextStyle(
                                color: !_isPassengerFlow ? AppColors.white : AppColors.textMain,
                              ),
                              onSelected: (val) {
                                if (val) setState(() => _isPassengerFlow = false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: titles.length,
                        itemBuilder: (context, idx) {
                          final isSelected = idx == currentIndex;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ActionChip(
                              label: Text(
                                titles[idx],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected ? AppColors.white : AppColors.textMain,
                                ),
                              ),
                              backgroundColor: isSelected
                                  ? AppColors.primaryBlue
                                  : AppColors.border.withValues(alpha: 0.4),
                              onPressed: () {
                                setState(() {
                                  if (_isPassengerFlow) {
                                    _passengerScreenIndex = idx;
                                  } else {
                                    _driverScreenIndex = idx;
                                  }
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                key: ValueKey('${_isPassengerFlow ? "passenger" : "driver"}_$currentIndex'),
                children: [
                  _isPassengerFlow
                      ? _getPassengerScreen(_passengerScreenIndex)
                      : _getDriverScreen(_driverScreenIndex),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
