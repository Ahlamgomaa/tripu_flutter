import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icon_names.dart';
import '../../../core/widgets/app_icon.dart';

class DummyMapWidget extends StatelessWidget {
  final bool showRoute;
  final bool mutedRoute;
  final bool pulsingPickup;
  final Widget? overlayWidget;

  const DummyMapWidget({
    super.key,
    this.showRoute = false,
    this.mutedRoute = false,
    this.pulsingPickup = false,
    this.overlayWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE5E7EB),
      child: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: _MapPainter(
              showRoute: showRoute,
              mutedRoute: mutedRoute,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    if (pulsingPickup)
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryBlue.withValues(alpha: 0.25),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryBlue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const AppIcon(
                        name: AppIconNames.locationPin,
                        size: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Pickup Point',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (overlayWidget != null) overlayWidget!,
        ],
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  final bool showRoute;
  final bool mutedRoute;

  _MapPainter({required this.showRoute, required this.mutedRoute});

  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke;

    final roadBorderPaint = Paint()
      ..color = const Color(0xFFD1D5DB)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    final path1 = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.25, size.width, size.height * 0.4);

    final path2 = Path()
      ..moveTo(size.width * 0.2, 0)
      ..cubicTo(size.width * 0.3, size.height * 0.4, size.width * 0.7, size.height * 0.6, size.width * 0.8, size.height);

    canvas.drawPath(path1, roadBorderPaint);
    canvas.drawPath(path1, roadPaint);

    canvas.drawPath(path2, roadBorderPaint);
    canvas.drawPath(path2, roadPaint);

    if (showRoute) {
      final routePaint = Paint()
        ..color = mutedRoute ? AppColors.textSecondary.withValues(alpha: 0.5) : AppColors.primaryBlue
        ..strokeWidth = 6
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final routePath = Path()
        ..moveTo(size.width * 0.2, size.height * 0.2)
        ..lineTo(size.width * 0.5, size.height * 0.5)
        ..lineTo(size.width * 0.8, size.height * 0.7);

      canvas.drawPath(routePath, routePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
