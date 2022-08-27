import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/widget/app_button.dart';

class LoginWithScreen extends StatelessWidget {
  const LoginWithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 210.h,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 9.h),
                padding: EdgeInsets.symmetric(vertical: 37.h, horizontal: 32.w),
                height: 140.h,
                width: 140.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Image.asset("imags/logo2.png"),
              ),
            ),
            Text(
              "Welcome to our",
              style: GoogleFonts.nunitoSans(
                fontSize: 36.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "E-Grocery",
              style: GoogleFonts.nunitoSans(
                fontSize: 36.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            AppButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppScreens.loginScreen),
              content: "Login With Phone",
            ),
            SizedBox(
              height: 23.h,
            ),
            Text(
              "OR",
              style: GoogleFonts.nunitoSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("imags/apple2.svg"),
                  SvgPicture.asset("imags/google2.svg"),
                  SvgPicture.asset("imags/twitter.svg"),
                  SvgPicture.asset("imags/facebook.svg"),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomWidget2 extends StatelessWidget {
  String img;
  Color borderColor;

  CustomWidget2({Key? key, required this.img, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: SvgPicture.asset("imags/$img.svg"),
    );
  }
}
