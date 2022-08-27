import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(
              width: 100.w,
              child: Image.asset("imags/pack_1.png"),
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sulphurfree Bura",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "570 Ml",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        children: [
                          ConstrainedBox(
                            constraints:
                            BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.grey, width: 1),
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.white,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                alignment: Alignment.topCenter,
                                icon: SvgPicture.asset("imags/plus.svg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            "2",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 20.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          ConstrainedBox(
                            constraints:
                            BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.grey, width: 1),
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.white,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                alignment: Alignment.topCenter,
                                icon: SvgPicture.asset("imags/minus.svg"),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
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
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "\$20",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: AppColors.lightGrey,
        ),
      ],
    );
  }
}