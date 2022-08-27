import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final void Function() onPressed;
  String icon;
  double height, width;
  bool isSelected;

  BottomNavItem({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
    this.width = 20,
    this.height = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity(vertical: 0.5,horizontal: 0.5),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        "bottom_icons/$icon.svg",
        width: width,
        height: height,
        color: isSelected ? AppColors.primary : AppColors.grey,
      ),
    );
  }
}
