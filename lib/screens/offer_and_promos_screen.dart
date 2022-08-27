import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/custom_row.dart';

class OfferAndPromosScreen extends StatelessWidget {
  const OfferAndPromosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 162.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "imags/offer_2.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 130.w,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 18.sp),
                        children: [
                          Text(
                            "23%",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 45.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Off",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 30.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDashLine(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "Lifebuoy Handwash",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 25.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                PositionedDirectional(
                  top: 0,
                  end: 15,
                  child: AppButton(
                    elevation: 0,
                    width: 90.w,
                    height: 30,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.primary,
                    content: "Collect",
                    onPressed: () {},
                  ),
                ),
                PositionedDirectional(
                  bottom: 10,
                  end: 15,
                  child:  Text(
                    "Exp-28/12/2020",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.w,),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 162.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "imags/offer_2.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 130.w,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 18.sp),
                        children: [
                          Text(
                            "23%",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 45.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Off",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 30.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDashLine(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "Lifebuoy Handwash",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 25.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                PositionedDirectional(
                  top: 0,
                  end: 15,
                  child: AppButton(
                    elevation: 0,
                    width: 90.w,
                    height: 30,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.primary,
                    content: "Collect",
                    onPressed: () {},
                  ),
                ),
                PositionedDirectional(
                  bottom: 10,
                  end: 15,
                  child:  Text(
                    "Exp-28/12/2020",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.w,),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 162.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "imags/offer_2.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 130.w,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 18.sp),
                        children: [
                          Text(
                            "23%",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 45.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Off",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 30.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDashLine(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "Lifebuoy Handwash",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 25.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                PositionedDirectional(
                  top: 0,
                  end: 15,
                  child: AppButton(
                    elevation: 0,
                    width: 90.w,
                    height: 30,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.primary,
                    content: "Collect",
                    onPressed: () {},
                  ),
                ),
                PositionedDirectional(
                  bottom: 10,
                  end: 15,
                  child:  Text(
                    "Exp-28/12/2020",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
