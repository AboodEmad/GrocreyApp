import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CartProduct extends StatefulWidget {
  CartProduct({
    Key? key,
    required this.img,
    required this.name,
    required this.info,
    required this.price,
    required this.quantity,
    required this.onPlusPressed,
    required this.onMinusPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  String img, name, info, price, quantity;
  final void Function() onPlusPressed,onMinusPressed,onDeletePressed;
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
              child: Image.network(widget.img),
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.info,
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
                                onPressed:widget.onPlusPressed,
                                alignment: Alignment.topCenter,
                                icon: SvgPicture.asset("imags/plus.svg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            widget.quantity,
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
                                onPressed: widget.onMinusPressed,
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
                        onPressed:widget.onDeletePressed,
                        icon: const Icon(
                          Icons.delete_outline,
                          color: AppColors.grey,
                        ),
                      ),
                      Text(
                        "\$${widget.price}",
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
