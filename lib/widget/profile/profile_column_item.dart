import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';



class ProfileColumnItem extends StatelessWidget {
  Color color;
  String icon, text;
  double marginTop;
  final void Function() onPressed;

  ProfileColumnItem({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.marginTop = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: marginTop.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 30.w, maxHeight: 30.h),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: color,
                ),
                child: SvgPicture.asset(
                  "imags/$icon.svg",
                  height: 15.h,
                  width: 15.w,
                ),
              ),
              SizedBox(
                width: 29.w,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunitoSans(
                    height: 0,
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.black,
                  size: 13,
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColors.lightGrey,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}