import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_screens.dart';

import '../../utils/app_colors.dart';
import '../app_button.dart';


class SuccessDialog extends StatelessWidget {
  final String title, subTitle, img;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.subTitle,
    this.img = "verified_img",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 25.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset("imags/$img.svg"),
                Positioned(
                  bottom: 0,
                  child: Text(
                    title,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                height: 0,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.grey,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Back to login",
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
