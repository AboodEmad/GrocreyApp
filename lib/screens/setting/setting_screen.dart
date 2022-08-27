import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_screens.dart';

import '../../get/address_getx_controller.dart';
import '../../utils/app_colors.dart';
import '../../widget/setting/setting_row.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: const Text(
          "Settings",
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
            children: [
              SettingRow(
                onPressed: ()=> Navigator.pushNamed(context, AppScreens.languageSettingScreen),
                text: "Language",
                marginTop: 0,
                isIconVisibile: true,
              ),
              SettingRow(
                onPressed: ()=> Navigator.pushNamed(context, AppScreens.changePasswordScreen),
                text: "Change Password",
                isIconVisibile: true,
              ),
              SettingRow(
                onPressed: ()=> Navigator.pushNamed(context, AppScreens.newAddressScreen),
                text: "Edit Home Address",
                isIconVisibile: true,
              ),
              SettingRow(
                onPressed: ()=> Navigator.pushNamed(context, AppScreens.notificationSettingsScreen),
                text: "Notification Setitings",
                isIconVisibile: true,
              ),
              SettingRow(
                onPressed: ()=> Navigator.pushNamed(context, AppScreens.changePhoneNumberScreen),
                text: "Change Phone Number",
                isIconVisibile: true,
              ),
              const SettingRow(
                text: "Deactivate Account",
                isIconVisibile: true,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
