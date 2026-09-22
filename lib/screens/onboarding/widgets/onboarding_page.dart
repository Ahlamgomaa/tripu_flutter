import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool showSkip;
  final VoidCallback? onSkip;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.showSkip,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: topPadding + 40),

          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      alignment: Alignment.topLeft,
                      widthFactor: 0.75,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (showSkip)
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: onSkip,
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),

          FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: 0.85,
            child: Text(
              subtitle,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.8),
                fontWeight: FontWeight.normal,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),

          const Spacer(),

          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.48,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
