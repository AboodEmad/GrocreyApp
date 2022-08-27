import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class ReviewRow extends StatelessWidget {
  const ReviewRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "5 stars",
          style: GoogleFonts.nunitoSans(
            fontSize: 14.sp,
            color: AppColors.grey,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        const Expanded(
          child: LinearProgressIndicator(
            value: 0.7,
            color: AppColors.primary,
            backgroundColor: AppColors.lightGrey,
          ),
        ),
        Text(
          "200",
          style: GoogleFonts.nunitoSans(
            fontSize: 14.sp,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}