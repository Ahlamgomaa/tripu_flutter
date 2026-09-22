import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/assets/app_assets.dart';
import '../../features/home_flow_screen.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = const [
    {
      'title': 'Welcome to TRIPU',
      'subtitle': "Need a quick ride or a car with a driver for hours or days? We've got you covered.",
      'image': AppAssets.onboarding1,
      'showSkip': true,
    },
    {
      'title': 'Rent Cars with Drivers',
      'subtitle': 'Enjoy the convenience of renting a car with a professional driver for hours or days.',
      'image': AppAssets.onboarding2,
      'showSkip': true,
    },
    {
      'title': 'Safe, Reliable, and Convenient',
      'subtitle': 'Professional Drivers, Well-Maintained Cars and Easy Payments',
      'image': AppAssets.onboarding3,
      'showSkip': false,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeFlowScreen(
          initialIsPassengerFlow: false,
        ),
      ),
    );
  }

  void _onSkip() {
    _navigateToHome();
  }

  void _onNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final page = _pages[index];
              return OnboardingPage(
                title: page['title'],
                subtitle: page['subtitle'],
                imagePath: page['image'],
                showSkip: page['showSkip'],
                onSkip: _onSkip,
              );
            },
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildBottomControls(),
                  _buildHomeIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0, top: 8.0),
        width: 134,
        height: 5,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(2.5),
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    final bool isLastPage = _currentPage == _pages.length - 1;

    if (isLastPage) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: OnboardingButton(
          text: 'Sign Up / Log In',
          onPressed: _navigateToHome,
          isFullWidth: true,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardingIndicator(
            itemCount: _pages.length,
            currentIndex: _currentPage,
          ),
          OnboardingButton(
            text: 'Next',
            onPressed: _onNext,
          ),
        ],
      ),
    );
  }
}
