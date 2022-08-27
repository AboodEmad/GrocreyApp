import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/language.dart';
import 'package:grocery_app/screens/setting_screen.dart';

import '../utils/app_colors.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  List<Language> suggested = [
    Language(language: "Bangladesh"),
    Language(language: "Canada"),
    Language(language: "Australia"),
    Language(language: "United States"),
  ];

  List<Language> all = [
    Language(language: "Bangladesh"),
    Language(language: "Canada"),
    Language(language: "Australia"),
    Language(language: "United States"),
    Language(language: "Cuba"),
    Language(language: "Span"),
    Language(language: "Palestine"),
    Language(language: "Palestine"),
    Language(language: "Palestine"),
    Language(language: "Palestine"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: const Text("Select Language"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
          children: [
            TextField(
              style: GoogleFonts.nunitoSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.black,
              ),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                constraints: BoxConstraints(maxWidth: double.infinity.w),
                contentPadding: EdgeInsets.only(top: 2.h,left: 10.w),
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
            SizedBox(height: 15.h,),
            Text(
              "Suggested",
              style: GoogleFonts.nunitoSans(
                fontSize: 16.sp,
                color: AppColors.grey,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggested.length,
              itemBuilder: (context, index) {
                return SettingRow(
                  text: suggested.elementAt(index).language,
                  icon: Icons.done,
                  isSelected: suggested.elementAt(index).isSelected,
                  iconColor: AppColors.primary,
                  onPressed: (){
                    setState( ()=> suggested.elementAt(index).isSelected = !suggested.elementAt(index).isSelected);
                  },
                );
              },
            ),
            SizedBox(height: 35.h,),
            Text(
              "All Countries/Regions",
              style: GoogleFonts.nunitoSans(
                fontSize: 16.sp,
                color: AppColors.grey,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: all.length,
              itemBuilder: (context, index) {
                return SettingRow(
                  text: all.elementAt(index).language,
                  icon: Icons.done,
                  isSelected: all.elementAt(index).isSelected,
                  iconColor: AppColors.primary,
                  onPressed: (){
                    setState( ()=> all.elementAt(index).isSelected = !all.elementAt(index).isSelected);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
