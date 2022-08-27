import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomRow extends StatelessWidget {
  String leading, trilling;
  double margitTop;

  CustomRow({
    Key? key,
    required this.leading,
    required this.trilling,
    this.margitTop = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7.h, top: margitTop.h),
      child: Row(
        children: [
          Text(
            leading,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(),
          Text(
            trilling,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class DashLine extends StatelessWidget {
  const DashLine({Key? key, this.height = 1, this.color = AppColors.grey})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class VerticalDashLine extends StatelessWidget {
  const VerticalDashLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainHeight();
        final dashCount = (boxHeight / (2 * 2)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: 2,
              height: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.white),
              ),
            );
          }),
        );
      },
    );
  }
}