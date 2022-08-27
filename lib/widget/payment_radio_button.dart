import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class PaymentRadioButton extends StatefulWidget {
  final String value, groupValue;
  final String text, img;
  final Color color, selectedColor, selectedBorderColor, borderColor;
  final void Function(String) onChange;

  PaymentRadioButton({
    Key? key,
    required this.text,
    required this.img,
    required this.value,
    required this.groupValue,
    this.selectedBorderColor = AppColors.primary,
    this.selectedColor = AppColors.primaryLight,
    this.color = AppColors.white,
    this.borderColor = AppColors.grey,
    required this.onChange,
  }) : super(key: key);

  @override
  State<PaymentRadioButton> createState() => _PaymentRadioButtonState();
}

class _PaymentRadioButtonState extends State<PaymentRadioButton> {

  bool get isSelected {
    return widget.value == widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        bool selected = widget.value != widget.groupValue;
        if(selected){
          widget.onChange(widget.value);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 9.h,
          bottom: 13.w,
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
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("imags/${widget.img}.svg"),
            SizedBox(height: 5.h,),
            Text(
              widget.text,
              style: GoogleFonts.nunitoSans(
                height: 0,
                fontSize: 12.sp,
                color: AppColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
