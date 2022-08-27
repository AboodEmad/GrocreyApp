import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

class SelectedCategory extends StatefulWidget {
  Color? color, textColor;
  String text;
  bool isSelected = false;

  SelectedCategory({
    Key? key,
    required this.text,
    this.color = AppColors.white,
    this.textColor = AppColors.grey,
  }) : super(key: key);

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            widget.isSelected = !widget.isSelected;
            if (widget.isSelected) {
              widget.textColor = AppColors.white;
              widget.color = AppColors.primary;
            } else {
              widget.color = AppColors.white;
              widget.textColor = AppColors.grey;
            }
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: widget.color,
          border: Border.all(
            color: AppColors.primary,
            width: 1.w,
          ),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
