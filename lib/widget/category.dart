import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CategoryItem extends StatefulWidget {
  String text, icon;
  final void Function() onPressed;

  CategoryItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color:AppColors.lightGrey,
            ),
            alignment: Alignment.center,
            child: Image.network(
              widget.icon,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            widget.text,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
