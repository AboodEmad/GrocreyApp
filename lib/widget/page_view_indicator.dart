import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/utils/app_colors.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    Key? key,
    required this.isCurrentPage,
    this.marginEnd = 0,
  }) : super(key: key);

  final bool isCurrentPage;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 5.h,
      width: isCurrentPage ? 25.w : 15.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isCurrentPage ? AppColors.primary : AppColors.grey,
      ),
    );
  }
}


