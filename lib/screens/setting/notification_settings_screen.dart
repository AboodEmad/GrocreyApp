import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

class NotificationSettingsScreen extends StatefulWidget {


  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool appNotification = false,phoneNumberNotification = false,offerNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: const Text(
          "Notification",
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 16.w,),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            color: AppColors.white,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              SizedBox(width: 56.h,),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                //************
                inactiveTrackColor: AppColors.grey,
                inactiveThumbColor: AppColors.white,
                title: Text(
                  'App Notification',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    height: 0,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                value: appNotification,
                onChanged: (bool value) {
                  setState(() => appNotification = value);
                },
              ),
              SizedBox(height: 15.h,),
              const Divider(color: AppColors.lightGrey,thickness: 2,),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                //************
                inactiveTrackColor: AppColors.grey,
                inactiveThumbColor: AppColors.white,
                title: Text(
                  'Phone Number Notification',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    height: 0,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                value: phoneNumberNotification,
                onChanged: (bool value) {
                  setState(() => phoneNumberNotification = value);
                },
              ),
              SizedBox(height: 15.h,),
              const Divider(color: AppColors.lightGrey,thickness: 2,),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                //************
                inactiveTrackColor: AppColors.grey,
                inactiveThumbColor: AppColors.white,
                title: Text(
                  'Offer Notification',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    height: 0,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                value: offerNotification,
                onChanged: (bool value) {
                  setState(() => offerNotification = value);
                },
              ),
              SizedBox(height: 15.h,),
              const Divider(color: AppColors.lightGrey,thickness: 2,),
              SizedBox(height:50.h),
            ],
          ),
        ),
      ),
    );
  }
}
