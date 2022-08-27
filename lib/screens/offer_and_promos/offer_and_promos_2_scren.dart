import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/products_getx_controller.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/model/product_offer.dart';
import 'package:grocery_app/widget/app_button.dart';

import '../../get/cart_getx_controller.dart';
import '../../utils/app_colors.dart';

class OfferAndPromosScreen2 extends StatelessWidget {
  OfferAndPromosScreen2({Key? key}) : super(key: key);

  List<Color> colors = [
    AppColors.primary,
    AppColors.primaryLight,
    AppColors.shippedColor,
    AppColors.borderGrey,
    AppColors.gradientLightBlue,
    AppColors.gradientBlue,
    AppColors.red,
    AppColors.gradientDarkPurple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Order Tracking",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: FutureBuilder<List<ProductOffer>>(
        future: ProductsGetController.to.getOffers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var list = snapshot.data;
            if (list == null) {
              return Center(
                child: Text(
                  "No Data",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 24.sp, color: AppColors.black),
                ),
              );
            } else {
              return GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 177.w / 250.h,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.w,
                ),
                itemBuilder: (context, index) {
                  int colorIndex = Random().nextInt(colors.length);
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: colors[colorIndex],
                    ),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      children: [
                        Text(
                          list[index].nameEn,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          list[index].infoEn,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Discount",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${list[index].originalPrice} ",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              list[index].discountPrice,
                              style: GoogleFonts.nunitoSans(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: AppButton(
                            backgroundColor: colors[colorIndex].withOpacity(0.8),
                            textColor: AppColors.white,
                            content: "Collect",
                            onPressed: () => CartGetxController.to.create(
                              Cart(
                                productId: list[index].productId,
                                info: list[index].infoEn,
                                name: list[index].nameEn,
                                img: list[index].imageUrl,
                                price: double.parse(list[index].discountPrice),
                                quantity: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
