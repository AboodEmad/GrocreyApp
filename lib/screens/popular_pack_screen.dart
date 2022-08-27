import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_button.dart';

import '../../widget/product_item.dart';

class PopularIPackScreen extends StatelessWidget {
  const PopularIPackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Popular Items"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
        child: Stack(
          children: [
            GridView.builder(
              shrinkWrap: true,
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
                  img: "pack_3",
                  title: "Bundle Pack",
                  subTitle: "Onion,Oil,Salt...",
                  currentPrice: 35,
                );
              },
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 53.h,
                width: 364.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.primary,
                      offset: Offset(0.0, 3.0), //(x,y)
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    const Icon(
                      Icons.shopping_bag_rounded,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      "Create Own Pack",
                      style: GoogleFonts.nunitoSans(
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
