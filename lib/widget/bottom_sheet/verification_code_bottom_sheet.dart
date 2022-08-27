import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../app_button.dart';
import '../verification_number_widget.dart';


class VerificationCodeBottomSheet extends StatelessWidget {
  final String email;
  final void Function() onPressed;
  final PageController pageController;
  late List<TextEditingController> controllers;

  VerificationCodeBottomSheet({
  Key? key,
  required this.onPressed,
  required this.email,
  required this.pageController,
  required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      onClosing: () {},
      builder: (context) {
        return ConstrainedBox(
          constraints:
          BoxConstraints(maxWidth: double.infinity.w.h, maxHeight: 414.h),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 30.h),
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      VerifyWidget(email: email),
                      EnterCodeWidget(controllers: controllers,)
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AppButton(
                      content: "Verify",
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.white,
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class VerifyWidget extends StatelessWidget {
  final String email;

  const VerifyWidget({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Thank You!",
          style: GoogleFonts.nunitoSans(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "We will sent 4 digits verification code to "
          "$email "
          "please take a look and verify it",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunitoSans(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer()
      ],
    );
  }
}

class EnterCodeWidget extends StatelessWidget {
  late List<TextEditingController> controllers;
  EnterCodeWidget({Key? key,required this.controllers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Enter The Code",
          style: GoogleFonts.nunitoSans(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Enter the 4 digits code that you recived on your email",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunitoSans(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        VerificationNumberRow(controllers: controllers),
        const Spacer(),
      ],
    );
  }
}
