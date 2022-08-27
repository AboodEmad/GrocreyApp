import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
    required this.leading,
    required this.onPressed,
    this.trilling = "View All",
    this.leadingTextSize = 18,
    this.trillingTextSize = 14,
  }) : super(key: key);

  final String leading,trilling;
  final double leadingTextSize,trillingTextSize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leading,
          style: GoogleFonts.nunitoSans(
            fontSize: leadingTextSize.sp,
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'View All',
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.normal,
              color: AppColors.primary,
              fontSize: trillingTextSize.sp,
            ),
          ),
        )
      ],
    );
  }
}
