import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_paint/payment_custom_paint.dart';

class PaymentCard extends StatelessWidget {
  final String name, expDate, id,type;
  final void Function() onPressed;

  const PaymentCard({
    Key? key,
    required this.name,
    required this.expDate,
    required this.type,
    required this.id,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          end: 20.w,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff294566),
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 217.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff294566),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: CustomPaint(
            painter: PaymentCustomPaint(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 19.w,
                vertical: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    id,
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    name,
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Text(
                        "Exp Date",
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(width: 15.w,),
                      Text(
                        expDate,
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
