import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'imags/$image.png',
          height: 317.h,
        ),
        SizedBox(height: 72.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch..',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 17.sp,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
