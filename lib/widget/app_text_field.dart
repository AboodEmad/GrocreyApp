import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textFiledController;
  final Color _fillColor = Colors.white;
  final Color _borderColor = AppColors.grey;
  bool obscure;
  Widget? suffix;
  TextInputType? inputType;
  String labelText;

  AppTextField({
    Key? key,
    required this.textFiledController,
    required this.labelText,
    this.obscure = false,
    this.suffix,
    this.inputType,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.labelText,
          style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        SizedBox(height: 9.h,),
        SizedBox(
          height: 50.h,
          child: TextField(
            obscureText: widget.obscure,
            controller: widget.textFiledController,
            textAlign: TextAlign.start,
            style: GoogleFonts.nunitoSans(color: Colors.black),
            keyboardType: widget.inputType,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              suffixIcon: widget.suffix,
              floatingLabelStyle: GoogleFonts.nunitoSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                height: 0,
                color: Colors.black,
              ),
              fillColor: widget._fillColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget._borderColor, width: 1.w),
                borderRadius: BorderRadius.circular(7.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget._borderColor, width: 1.w),
                borderRadius: BorderRadius.circular(7.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget._borderColor, width: 1.w),
                borderRadius: BorderRadius.circular(7.r),
              )
              //hintText: AppLocalizations.of(context)!.email,
            ),
          ),
        )
      ],
    );
  }
}
