import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../widget/product_item.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: const Text("Search Results"),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 23.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 15.h,
            ),
            Text(
              "33 Products Found",
              style: GoogleFonts.nunitoSans(
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 184 / 205,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(
                    onPressed: (){},
                    img: "pack_3",
                    title: "Bundle Pack",
                    subTitle: "Onion,Oil,Salt...",
                    currentPrice: "35",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
