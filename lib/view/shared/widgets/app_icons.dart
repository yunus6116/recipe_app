import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum IconType { home, favourites }

class AppIcons extends HookConsumerWidget {
  final IconType iconType;
  final Color iconColor;
  final double? width;

  const AppIcons({
    super.key,
    required this.iconType,
    this.iconColor = Colors.white,
    this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildIcon(IconData iconData) {
      return Icon(iconData, color: iconColor, size: width);
    }

    Widget buildSvg(String svgName) =>
        SvgPicture.asset("assets/svg/$svgName.svg",
            width: width, color: iconColor);

    switch (iconType) {
      case IconType.home:
        return buildIcon(Icons.home);
      case IconType.favourites:
        return buildIcon(Icons.favorite);
      default:
        return buildSvg('');
    }
  }
}
