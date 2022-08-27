import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/status_item.dart';

enum StatusEnum { confirmed, processing, shipped, delivery, cancel }

class OrderItem extends StatelessWidget {
  String id, date, status;
  final void Function() onPressed;

  OrderItem({
    Key? key,
    required this.id,
    required this.date,
    required this.status,
    required this.onPressed,
  }) : super(key: key);

  Widget getStatus() {
    switch (status) {
      case "Waiting":
        return StatusClass().horizontalConfirmed;
      case "Processing":
        return StatusClass().horizontalProcessing;
      case "Shipped":
        return StatusClass().horizontalShipped;
      case "Delivery":
        return StatusClass().horizontalDelivered;
      case "Cancel":
        return StatusClass().horizontalCanceled;
      default:
        return const SizedBox();
    }
  }

  Color getTextColor() {
    switch (status) {
      case "Waiting":
        return AppColors.confirmedColor;
      case "Processing":
        return AppColors.primary;
      case "Shipped":
        return AppColors.shippedColor;
      case "Delivery":
        return AppColors.primary;
      case "Cancel":
        return AppColors.canceledColor;
      default:
        return AppColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(
          vertical: 11.h,
          horizontal: 20.w,
        ),
        height: 130.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Oreder ID:",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Expanded(
                  child: Text(
                    "2324252627",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  "25 Nov",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              children: [
                Text(
                  "Status:",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 19.w,
                ),
                Expanded(
                  child: getStatus(),
                ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                status,
                style: GoogleFonts.nunitoSans(
                  color: getTextColor(),
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
