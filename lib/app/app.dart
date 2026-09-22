import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../screens/onboarding/onboarding_screen.dart';

class TripuApp extends StatelessWidget {
  const TripuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRIPU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
