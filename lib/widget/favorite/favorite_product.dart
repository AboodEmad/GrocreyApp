import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class FavoriteProduct extends StatelessWidget {
  final String img, name, info;
  final String price;

  final void Function() onPressed,onDeletePressed;

  const FavoriteProduct({
    Key? key,
    required this.img,
    required this.info,
    required this.name,
    required this.price,
    required this.onPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 100.w,
                child: Image.network(img,fit: BoxFit.cover,),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          info,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14.sp,
                            color: AppColors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "\$ $price",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
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
                          onPressed: onDeletePressed,
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
                    SizedBox(
                      height: 16.h,
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
      ),
    );
  }
}
