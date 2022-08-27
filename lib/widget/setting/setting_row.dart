import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';


class SettingRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final double marginTop,iconSize;
  final Color iconColor;
  final bool isIconVisibile;
  final void Function()? onPressed;

  const SettingRow({
    Key? key,
    required this.text,
    this.onPressed,
    this.marginTop = 10,
    this.iconSize = 14,
    this.iconColor = AppColors.black,
    this.isIconVisibile = false,
    this.icon = Icons.arrow_forward_ios_outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: marginTop),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  text,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Visibility(
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  visible: isIconVisibile,
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            const Divider(
              color: AppColors.lightGrey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}