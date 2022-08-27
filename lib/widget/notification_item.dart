import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

class NotificationItem extends StatelessWidget {
  String icon, title, subTitle, time;
  Color color;

  NotificationItem({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 7.h),
          constraints: BoxConstraints(maxWidth: 50.w, maxHeight: 50.h),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 13.h,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: SvgPicture.asset(
            "imags/$icon.svg",
            height: 15.h,
            width: 15.w,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                subTitle,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey,
                ),
              ),
              Text(
                time,
                style: GoogleFonts.nunitoSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              const Divider(
                color: AppColors.lightGrey,
                thickness: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
