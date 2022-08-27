import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

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
            "About Us",
            style: GoogleFonts.nunitoSans(
              fontSize: 20.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 25.h,),
          Text(
            "In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus.",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            "Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien.",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            "Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 50.h,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("imags/logo2.png"),
              SizedBox(
                width: 10.w,
              ),
              RichText(
                text: TextSpan(
                  text: "e",
                  style: TextStyle(
                    height: 0,
                    fontSize: 42.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.primary,
                  ),
                  children: [
                    TextSpan(
                      text: "Grocery",
                      style: TextStyle(
                        height: 0,
                        fontSize: 42.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Developer Name: ",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18.sp,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    "Abood Emad",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Text(
                    "Email :",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18.sp,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    "fat70224@gmail.com",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
