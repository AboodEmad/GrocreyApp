import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Order Tracking",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "imags/map.png",
            height: double.infinity,
            width: double.infinity,
          ),
          PositionedDirectional(
            bottom: 0,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 15.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 40.h,
                          width: 40.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.gradientPink,
                          ),
                          child: const Icon(
                            Icons.access_time_rounded,
                            color: AppColors.white,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Your Delivery Time",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.sp,
                                color: AppColors.grey,
                              ),
                            ),
                            Text(
                              "30 Min",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 40.h,
                          width: 40.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.gradientPink,
                          ),
                          child: const Icon(
                            Icons.access_time_rounded,
                            color: AppColors.white,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Your Delivery Time",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.sp,
                                color: AppColors.grey,
                              ),
                            ),
                            Text(
                              "30 Min",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Divider(
                    color: AppColors.lightGrey,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50.h,
                        width: 60.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.shippedColor,
                        ),
                        child: Image.asset(
                          "imags/profile.png",
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Your Shipper",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.sp,
                                color: AppColors.grey,
                              ),
                            ),
                            Text(
                              "Jondy Carlos",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.primary,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 20.w,
                          icon: const Icon(
                            Icons.call,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
