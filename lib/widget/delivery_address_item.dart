import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class DeliveryAddressItem extends StatelessWidget {
  String address, number, road;
  bool isSelected;
  final void Function() onPressed;

  DeliveryAddressItem({
    Key? key,
    this.isSelected = false,
    required this.address,
    required this.number,
    required this.road,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  width: 16.w,
                  height: 16.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.white,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.grey,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        address,
                        style: GoogleFonts.nunitoSans(
                          height: 0,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        road,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        number,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              color: AppColors.lightGrey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
