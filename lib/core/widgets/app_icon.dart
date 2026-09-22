import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_icon_names.dart';

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

  String _getAssetPath(String iconName) {
    switch (iconName) {
      case AppIconNames.menu:
        return 'assets/icons/menu.svg';
      case AppIconNames.star:
        return 'assets/icons/Frame (1).svg';
      case AppIconNames.locationPin:
        return 'assets/icons/Location.svg';
      case AppIconNames.wallet:
        return 'assets/icons/Frame (2).svg';
      case AppIconNames.settings:
        return 'assets/icons/Frame (5).svg';
      case AppIconNames.callSupport:
        return 'assets/icons/Frame (6).svg';
      case AppIconNames.history:
        return 'assets/icons/Frame (4).svg';
      case AppIconNames.inviteFriend:
        return 'assets/icons/Frame (7).svg';
      case AppIconNames.signOut:
        return 'assets/icons/Frame (8).svg';
      case AppIconNames.rides:
        return 'assets/icons/Frame.svg';
      case AppIconNames.rentTime:
        return 'assets/icons/Frame (1).svg';
      case AppIconNames.rentDays:
        return 'assets/icons/Frame (2).svg';
      case AppIconNames.cash:
        return 'assets/icons/Money.svg';
      case AppIconNames.addFunds:
        return 'assets/icons/icon (1).svg';
      case AppIconNames.edit:
        return 'assets/icons/icon (2).svg';
      case AppIconNames.doubleChevron:
        return 'assets/icons/Back.svg';
      case AppIconNames.backspace:
        return 'assets/icons/Frame.svg';
      case AppIconNames.fawry:
        return 'assets/icons/fawry.svg';
      case AppIconNames.paypal:
        return 'assets/icons/paypal.svg';
      case AppIconNames.card:
        return 'assets/icons/card.svg';
      default:
        return 'assets/icons/Frame.svg';
    }
  }

  bool get _isMultiColorOrCompound {
    return name == AppIconNames.menu ||
        name == AppIconNames.fawry ||
        name == AppIconNames.paypal ||
        name == AppIconNames.card;
  }

  @override
  Widget build(BuildContext context) {
    final String assetPath = _getAssetPath(name);

    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      fit: fit,
      colorFilter: (color != null && !_isMultiColorOrCompound)
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
