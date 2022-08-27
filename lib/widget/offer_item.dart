import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import 'app_button.dart';
import 'custom_row.dart';

class OfferItem extends StatelessWidget {
  String offer, productName, expDate;
  Color backgroundColor;

  OfferItem({
    Key? key,
    required this.expDate,
    required this.productName,
    required this.offer,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: backgroundColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CustomPaint(
              foregroundPainter: MyCustomPaint(),
              child: SizedBox(
                height: 40.h,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 130.w,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 18.sp),
                  children: [
                    Text(
                      offer,
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
                    productName,
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
            child: Text(
              expDate,
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
    );
  }
}

class MyCustomPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(w, 0);
    path.arcToPoint(Offset(w, h), radius: const Radius.circular(15.0), clockwise: false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
