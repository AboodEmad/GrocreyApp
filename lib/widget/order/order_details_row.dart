import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class OrderDetailsRow extends StatelessWidget {
  final String status, time, date;
  final Color borderColor;
  late IconData icon;

  OrderDetailsRow({
    Key? key,
    required this.time,
    required this.status,
    required this.date,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
            color: borderColor,
          ),
          child: Icon(
            iconData,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          width: 30.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                status,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                date,
                style: GoogleFonts.nunitoSans(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Text(
            time,
            style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  IconData get iconData {
    switch (status) {
      case "Waiting":
        return Icons.done;
      case "Processing":
        return Icons.handyman;
      case "Shipped":
        return Icons.local_shipping_outlined;
      case "Delivery":
        return Icons.delivery_dining;
    }
    return Icons.abc;
  }
}