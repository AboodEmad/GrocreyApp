import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/selected_category.dart';

import '../model/popularity.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: const Text("Search"),
      ),
      backgroundColor: AppColors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 23.w,
        ),
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: 50.h, maxWidth: double.infinity.w),
                  child: Stack(
                    children: [
                      TextField(
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 2.h),
                          filled: true,
                          focusColor: AppColors.lightGrey,
                          prefixIcon: const Icon(
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
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 50.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () => showFilterBottomSheet(context),
                            icon: const Icon(
                              Icons.filter_list_sharp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 23.w,
              ),
              Text(
                "Cancel",
                style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 8.h),
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vegetables",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grey,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          height: 12,
                          "imags/top_left_arrow.svg",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColors.lightGrey,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  List<Popularity> list = [
    Popularity(text: "pop1", id: 1),
    Popularity(text: "pop2", id: 2),
    Popularity(text: "pop3", id: 3),
    Popularity(text: "pop4", id: 4),
    Popularity(text: "pop15", id: 5),
  ];

  List<String> categories = [
    "Office Supplies",
    "Gardening",
    "Vagetabals",
    "See All"
  ];

  List<String> brands = ["Any", "Square", "ACI Limited", "See All"];

  int? _selectedPopularityId;

  RangeValues _priceValues = const RangeValues(10, 100);

  showModalBottomSheet(
    clipBehavior: Clip.antiAlias,
    backgroundColor: AppColors.white,
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.r),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 1,
        builder: (context,controller){
          return StatefulBuilder(
            builder: (context, setState) {
              return ListView(
                controller: controller,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                children: [
                  Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 50.w,maxHeight: 5.h,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.black,
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 40.h),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: SvgPicture.asset("imags/x.svg"),
                        ),
                      ),
                      Text(
                        "Filter",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Reset",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Sort By",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 100.w,
                        child: DropdownButton<int>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          hint: const Text('Popularity'),
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.grey,
                          ),
                          onChanged: (int? value) {
                            setState(() => _selectedPopularityId = value!);
                          },
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            print('Tapped');
                          },
                          dropdownColor: AppColors.lightGrey,
                          elevation: 1,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: AppColors.primary,
                          ),
                          value: _selectedPopularityId,
                          items: list.map(
                                (popularity) {
                              return DropdownMenuItem<int>(
                                value: popularity.id,
                                child: Text(
                                  popularity.text,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.black,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                  Text(
                    "Price range",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                  ),
                  RangeSlider(
                    values: _priceValues,
                    min: 10,
                    max: 100,
                    divisions: 10,
                    labels: RangeLabels(
                      _priceValues.start.toString(),
                      _priceValues.end.toString(),
                    ),
                    activeColor: AppColors.primary,
                    inactiveColor: AppColors.grey,
                    onChanged: (RangeValues value) {
                      setState(() => _priceValues = value);
                    },
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Text(
                    "Categories",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 116.h / 45.h,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return SelectedCategory(
                        text: categories.elementAt(index),
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Brand",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: brands.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 116.h / 45.h,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return SelectedCategory(
                        text: brands.elementAt(index),
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Rating Star",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemSize: 30,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsetsDirectional.only(end: 5.w),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AppButton(
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.white,
                    content: "Apply Filter",
                    onPressed: () {},
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
