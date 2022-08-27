import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widget/app_button.dart';

import '../utils/app_colors.dart';

class OfferAndPromosScreen2 extends StatelessWidget {
  const OfferAndPromosScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: Text(
          "Order Tracking",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 177.w / 250.h,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.w,
        ),
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.gradientPurple,
            ),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              children: [
                Text(
                  "Black Coffee",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Turkey",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Discount",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$120",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                Opacity(
                  opacity: 0.7,
                  child: AppButton(
                    backgroundColor: AppColors.gradientPurple,
                    textColor: AppColors.white,
                    content: "Collect",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
