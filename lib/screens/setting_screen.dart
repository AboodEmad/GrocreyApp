import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 16.w,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            color: AppColors.white,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 35.h),
            children: [
              SettingRow(text: "Language",marginTop: 0,),
              SettingRow(text: "Change Password"),
              SettingRow(text: "Edit Home Address"),
              SettingRow(text: "Location"),
              SettingRow(text: "Profile Settings"),
              SettingRow(text: "Deactivate Account"),
              SizedBox(height: 217.h,),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  String text;
  IconData icon;
  double marginTop;
  Color iconColor;
  bool isSelected;
  final void Function()? onPressed;

  SettingRow({
    Key? key,
    required this.text,
    this.onPressed,
    this.marginTop = 10,
    this.iconColor = AppColors.black,
    this.isSelected = false,
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
                  visible: isSelected,
                  child: Icon(
                    icon,
                    color: iconColor,
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
