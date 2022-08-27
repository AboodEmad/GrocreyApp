import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class TermAndConditionsScreen extends StatelessWidget {
  const TermAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("About Us"),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
        children: [
          Text(
            "General site usage last revised December 12-01-2020.",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 18.h,),
          Text(
            "Welcome to www.saydulmoon.info. Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 15.h,),
          Text(
            "1.  Agreement",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 18.h,),
          Text(
            "Welcome to www.saydulmoon.info. Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 15.h,),
          Text(
            "2.  Account",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 18.h,),
          Text(
            "Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis ",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 15.h,),
          Text(
            "3.  Relationship With Groceries",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 18.h,),
          Text(
            "Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis ",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}
