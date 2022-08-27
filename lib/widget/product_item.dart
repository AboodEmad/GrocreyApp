import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  String title, subTitle, img;
  double? oldPrice;
  double currentPrice;

  ProductItem({
    Key? key,
    required this.img,
    required this.title,
    required this.subTitle,
    required this.currentPrice,
    this.oldPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
      height: 205.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: const Color(0xffECECEC),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset("imags/$img.png"),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            title,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            subTitle,
            style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(
                "\$${currentPrice.toString()}",
                style: GoogleFonts.nunitoSans(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              oldPrice != null
                  ? Text(
                oldPrice.toString(),
                style: GoogleFonts.nunitoSans(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.normal,
                ),
              )
                  : const SizedBox(),
              const Spacer(),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 28.h,
                  maxWidth: 28.w,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}