import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class PaymentOptionItem extends StatelessWidget {
  final double marginBottom;
  final String title, subTitle, img;

  const PaymentOptionItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.img,
    this.marginBottom = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.lightGrey,
            ),
            child: SvgPicture.asset(
              "imags/$img.svg",
              height: 15.h,
              width: 32.w,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}