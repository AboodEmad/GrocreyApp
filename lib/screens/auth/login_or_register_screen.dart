import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_button.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "imags/login_back_img.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Image.asset(
            "imags/login_layer.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 46.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 125.h,
                ),
                Text(
                  "Welcome to our",
                  style: GoogleFonts.nunitoSans(
                    color: AppColors.black,
                    fontSize: 36.sp,
                  ),
                ),
                Text(
                  "E-Grocery",
                  style: GoogleFonts.nunitoSans(
                    color: AppColors.primary,
                    fontSize: 36.sp,
                  ),
                ),
                const Spacer(),
                AppButton(
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  content: "Continue with Email of Phone",
                  textColor: AppColors.white,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppButton(
                  onPressed: () {},
                  backgroundColor: AppColors.white,
                  content: "Create an account",
                  textColor: AppColors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
