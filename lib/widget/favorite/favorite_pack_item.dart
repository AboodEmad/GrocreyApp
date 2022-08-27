import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class FavoritePackItem extends StatelessWidget {
  String title, subTitle, img;
  double? oldPrice;
  double currentPrice;
  final void Function() onPressed;

  FavoritePackItem({
    Key? key,
    required this.img,
    required this.title,
    required this.subTitle,
    required this.currentPrice,
    required this.onPressed,
    this.oldPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: const Color(0xffECECEC),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 110.w,
                    child: Image.asset(
                      "imags/$img.png",
                      width: double.infinity,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
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
                        height: 10.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$ $currentPrice",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            oldPrice.toString(),
                            style: GoogleFonts.nunitoSans(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14.sp,
                              color: AppColors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    color: AppColors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
