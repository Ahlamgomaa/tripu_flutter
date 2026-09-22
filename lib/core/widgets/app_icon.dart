import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final String name;
  final double size;
  final Color? color;
  final BoxFit fit;

  const AppIcon({
    super.key,
    required this.name,
    this.size = 24.0,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    const String assetPath = 'assets/icons/frame.svg';

    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
