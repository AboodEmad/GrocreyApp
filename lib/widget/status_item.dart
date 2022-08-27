import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/utils/app_colors.dart';

class StatusClass{
  Widget get horizontalShipped => SizedBox(
    height: 14+19.h,
    child: Row(
      children: [
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.shippedColor,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.shippedColor,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.shippedColor,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.shippedColor,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.shippedColor,
            ),
          ),
        ),
        /*Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "Shipped:",
                style: GoogleFonts.nunitoSans(
                  fontSize: 14.sp,
                  color: AppColors.shippedColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),*/
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.lightGrey,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    ),
  );
  Widget get horizontalConfirmed => SizedBox(
    height: 14+19.h,
    child: Row(
      children: [
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.confirmedColor,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.lightGrey,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.lightGrey,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.lightGrey,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    ),
  );
  Widget get horizontalDelivered => SizedBox(
    height: 14+19.h,
    child: Row(
      children: [
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    ),
  );
  Widget get horizontalCanceled => SizedBox(
    height: 14+19.h,
    child: Row(
      children: [
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.canceledColor,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.canceledColor,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.canceledColor,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.canceledColor,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.canceledColor,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.canceledColor,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.canceledColor,
            ),
          ),
        ),
      ],
    ),
  );
  Widget get horizontalProcessing => SizedBox(
    height: 14+19.h,
    child: Row(
      children: [
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.lightGrey,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 4.h,
            child: const Material(
              color: AppColors.lightGrey,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    ),
  );


  Widget get verticalProcessing => SizedBox(
    width: 14,
    child: Column(
      children: [
        SizedBox(
          height: 14.h,
          width: 14.w,
          child:  DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color:AppColors.primary,width: 2),
              color: AppColors.white,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 4.h,
            child: const Material(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child:  DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color:AppColors.primary,width: 2),
              color: AppColors.white,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 4.h,
            child: const Material(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child:  DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color:AppColors.primary,width: 2),
              color: AppColors.white,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 4.h,
            child: const Material(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          width: 14.w,
          child:  DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color:AppColors.primary,width: 2),
              color: AppColors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

