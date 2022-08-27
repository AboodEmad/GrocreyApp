import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widget/app_button.dart';

import '../utils/app_colors.dart';

class EmptyPage extends StatelessWidget {
  String img, title, supTitle, buttonText;

  EmptyPage(
      {Key? key,
      required this.img,
      required this.title,
      required this.buttonText,
      required this.supTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: const Text("Search Results"),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              constraints: BoxConstraints(maxWidth: 280.w, maxHeight: 280.h),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Image.asset("imags/$img.png"),
            ),
            SizedBox(
              height: 33.h,
            ),
            Text(
              title,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.normal,
                color: AppColors.black,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              supTitle,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.normal,
                color: AppColors.black,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 83.h,),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: buttonText,
              onPressed: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
