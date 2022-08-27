import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/setting/setting_screen.dart';

import '../../utils/app_colors.dart';
import '../../widget/setting/setting_row.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  final List<String> topQuestions = const [
    "How do I return my items?",
    "How to use collection point?",
    "What is Grocery?",
    "How can i add new delivery address?",
    "How can i avail Sticker Price?",
  ];

  final List<String> topics = const [
    "My Account",
    "Payments & Wallet",
    "Shiping & Delivery",
    "Vouchers & Promotions",
    "Ordering",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Help"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
        children: [
          Text(
            "Hi! How can we help?",
            style: GoogleFonts.nunitoSans(
              fontSize: 18.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 35.h,),
          TextField(
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.black,
            ),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              constraints: BoxConstraints(maxWidth: double.infinity.w),
              contentPadding: EdgeInsets.only(top: 2.h, left: 10.w),
              filled: true,
              focusColor: AppColors.lightGrey,
              suffixIcon: const Icon(
                Icons.search,
                color: AppColors.black,
              ),
              hintText: "Search",
              hintStyle: GoogleFonts.nunitoSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: AppColors.lightGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: AppColors.lightGrey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Top Questions",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topQuestions.length,
            itemBuilder: (context, index) {
              return SettingRow(
                text: topQuestions.elementAt(index),
                icon: Icons.arrow_forward_ios_outlined,
                iconColor: AppColors.grey,
                isIconVisibile: true,
                onPressed: () {},
              );
            },
          ),
          SizedBox(
            height: 35.h,
          ),
          Text(
            "Topics",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.grey,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return SettingRow(
                text: topics.elementAt(index),
                icon: Icons.arrow_forward_ios_outlined,
                iconColor: AppColors.grey,
                isIconVisibile: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
