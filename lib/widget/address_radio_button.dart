import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class AddressRadioButton extends StatefulWidget {
  final int value, groupValue;
  final Color color, selectedColor, selectedBorderColor, borderColor;
  final void Function(int?)? onChange;
  final double marginBottom;

  AddressRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    this.color = AppColors.white,
    this.selectedBorderColor = AppColors.primary,
    this.borderColor = AppColors.grey,
    this.onChange,
    this.selectedColor = AppColors.primaryLight,
    this.marginBottom = 20.0,
  }) : super(key: key);

  @override
  State<AddressRadioButton> createState() => _AddressRadioButtonState();
}

class _AddressRadioButtonState extends State<AddressRadioButton> {

  bool get isSelected {
    return widget.value == widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        bool selected = widget.value != widget.groupValue;
        if(selected){
          widget.onChange!(widget.value);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: widget.marginBottom.h),
        constraints: BoxConstraints(
          maxHeight: 92.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 11.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? widget.selectedColor
              : widget.color,
          border: Border.all(
            color: isSelected
                ? widget.selectedBorderColor
                : widget.borderColor,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 16.h,
                maxWidth: 16.w,
              ),
              margin: EdgeInsets.only(top: 4.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? widget.selectedBorderColor
                    : widget.color,
                border: Border.all(
                  color: isSelected
                      ? widget.selectedBorderColor
                      : widget.borderColor,
                  width: 2.w,
                ),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home Address",
                  style: GoogleFonts.nunitoSans(
                    height: 0,
                    fontSize: 14.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "(309) 071-9396-939",
                  style: GoogleFonts.nunitoSans(
                    height: 0,
                    fontSize: 14.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "1749 Custom Road, Chhatak",
                  style: GoogleFonts.nunitoSans(
                    height: 0,
                    fontSize: 14.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
