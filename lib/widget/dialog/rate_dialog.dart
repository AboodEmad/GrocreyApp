import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/products_getx_controller.dart';
import 'package:grocery_app/utils/app_screens.dart';

import '../../utils/app_colors.dart';
import '../app_button.dart';


class RateDialog extends StatelessWidget {
  double rate;
  String productId;
  RateDialog({
    Key? key,
    required this.rate,
    required this.productId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Rate The Product",style: GoogleFonts.nunitoSans(fontSize: 18.sp,color: AppColors.black),),
            SizedBox(
              height: 15.h,
            ),
            RatingBar.builder(
              initialRating: rate,
              minRating: 1,
              direction: Axis.horizontal,
              itemSize: 25,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                rate = rating;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Submit",
              onPressed: () => {
                ProductsGetController.to.rateProduct(productId, rate.toString()),
                Navigator.pop(context)
              },
            )
          ],
        ),
      ),
    );
  }
}
