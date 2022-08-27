import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/address/delivery_address_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';

import '../../widget/profile/profile_column_item.dart';
import '../../widget/profile/profile_row_item.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.lightGrey,
      child: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: CustomBackground(),
                child: Container(
                  color: AppColors.primary,
                  height: 397.h,
                  width: double.infinity.w,
                ),
              ),
              Expanded(
                child: ClipPath(
                  clipper: CustomBackground2(),
                  child: Container(
                    color: AppColors.lightGrey,
                    width: double.infinity.w,
                  ),
                ),
              ),
            ],
          ),
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 35.h,
            ),
            children: [
              SizedBox(height: 100.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 90.h,
                          maxWidth: 90.w,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.pink,
                        ),
                        child: Image.asset("imags/profile.png"),
                      ),
                      const PositionedDirectional(
                        bottom: 0,
                        end: 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Shakibul Islam",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "ID: 1540580",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.white,
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 15.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileRowItem(
                      onPressed: () => Navigator.pushNamed(context, AppScreens.orderListScreen),
                      color: AppColors.gradientBlue,
                      icon: "bus",
                      text: "My All Order",
                    ),
                    ProfileRowItem(
                      onPressed: () => Navigator.pushNamed(context, AppScreens.offerAndPromos2Screen),
                      color: AppColors.gradientPink,
                      icon: "gift",
                      text: "Offer & Promos",
                    ),
                    ProfileRowItem(
                      onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const DeliveryAddressScreen(),)),
                      color: AppColors.gradientLightBlue,
                      icon: "home",
                      text: "Delivery Address",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.white,
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  children: [
                    ProfileColumnItem(
                      onPressed: () => Navigator.pushNamed(context, AppScreens.profileSettingsScreen),
                      color: AppColors.gradientGreen,
                      icon: "user",
                      text: "My Profile",
                      marginTop: 0,
                    ),
                    ProfileColumnItem(
                      onPressed: () => Navigator.pushNamed(context, AppScreens.notificationScreen),
                      color: AppColors.gradientLightBlue,
                      icon: "notification",
                      text: "Notificaion",
                    ),
                    ProfileColumnItem(
                      onPressed: () => Navigator.pushNamed(context, AppScreens.settingScreen),
                      color: AppColors.gradientPurple,
                      icon: "settings",
                      text: "Setting",
                    ),
                    ProfileColumnItem(
                      onPressed: () => Navigator.pushNamed(context, AppScreens.paymentOptionScreen),
                      color: AppColors.gradientDarkPurple,
                      icon: "wallet",
                      text: "Payment",
                    ),
                    ProfileColumnItem(
                      onPressed: () => Navigator.pushReplacementNamed(context, AppScreens.loginScreen),
                      color: AppColors.gradientPink,
                      icon: "logout",
                      text: "Log Out",
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
class CustomBackground2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final h = size.height;
    final w = size.width;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(w/2, 50, w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}

class CustomBackground extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final h = size.height;
    final w = size.width;
    
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h-50);
    path.quadraticBezierTo(w/2, h, w, h-50);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}


class MyCustomPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;

    final mainPaint = Paint()
    ..color = AppColors.primary
    ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h-50);
    path.quadraticBezierTo(w/2, h, w, h-50);
    path.lineTo(w, 0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }

}

double toRadians({required double degree}) {
  return degree * (pi / 180);
}
