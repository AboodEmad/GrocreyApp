import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

class VerificationNumberRow extends StatelessWidget {
  Color borderColor = Colors.grey.shade200;
  Color backgroundColor = AppColors.white;
  late List<TextEditingController> controllers;

  VerificationNumberRow({Key? key,required this.controllers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VerificationNumberItem(firstItem: true,borderColor: borderColor, backgroundColor: backgroundColor,controller: controllers[0],),
          VerificationNumberItem(borderColor: borderColor, backgroundColor: backgroundColor,controller: controllers[1],),
          VerificationNumberItem(borderColor: borderColor, backgroundColor: backgroundColor,controller: controllers[2],),
          VerificationNumberItem(lastItem: true,borderColor: borderColor, backgroundColor: backgroundColor,controller: controllers[3],),
        ],
      ),
    );
  }
}

class VerificationNumberItem extends StatelessWidget {
  Color backgroundColor, borderColor;
  bool firstItem,lastItem;
  late TextEditingController controller;

  VerificationNumberItem({
    Key? key,
    this.firstItem = false,
    this.lastItem = false,
    required this.borderColor,
    required this.backgroundColor,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: 68.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.5.w),
      ),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if(value.isNotEmpty && !lastItem){
            FocusScope.of(context).nextFocus();
          }else if(value.isEmpty && !firstItem){
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(
          fontSize: 30.sp,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: const TextInputType.numberWithOptions(
            signed: false, decimal: false),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
