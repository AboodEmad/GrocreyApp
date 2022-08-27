import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CategoryItem extends StatefulWidget {
  String text, icon;
  bool isSelected;
  final void Function() onPressed;

  CategoryItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.isSelected,
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
            padding: EdgeInsets.symmetric(
              vertical: 28.h,
              horizontal: 30.w,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isSelected ? AppColors.primary : AppColors.lightGrey,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "imags/${widget.icon}.svg",
              color: widget.isSelected ? AppColors.white : AppColors.black,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            widget.text,
            style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
