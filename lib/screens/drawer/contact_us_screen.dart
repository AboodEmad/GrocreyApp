import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Contact Us",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 16.w,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            color: AppColors.white,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 53.h,horizontal: 20.w),
            children: [
              Text(
                "Contact Us",
                style: GoogleFonts.nunitoSans(
                  fontSize: 20.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 1),
                        color: AppColors.white,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.call,
                      color: AppColors.primary,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "+8801710000000",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16.sp,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          "+8801710000000",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16.sp,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 1),
                        color: AppColors.white,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.mail,
                      color: AppColors.primary,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Text(
                      "Jonarban45@gmail.com",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp,
                        color: AppColors.grey,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 1),
                        color: AppColors.white,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.wrong_location_rounded,
                      color: AppColors.primary,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Text(
                      "26/C Mohammadpur Dhaka, Bangladesh",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 31.h,),
              Image.asset("bottom_icons/contact_map.png"),
            ],
          ),
        ),
      ),
    );
  }
}
