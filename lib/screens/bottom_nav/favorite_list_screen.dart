import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/products_getx_controller.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/widget/favorite/favorite_pack_item.dart';
import 'package:grocery_app/widget/favorite/favorite_product.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widget/product_item.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();

}

class _FavoriteListScreenState extends State<FavoriteListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsGetController>(
      init: ProductsGetController(),
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else {;
          var list = controller.favoriteList;
          if (list.isNotEmpty) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              children: [
                Text(
                  "Products",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18.sp,
                    color: AppColors.black,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.symmetric(
                    vertical: 19.h,
                    horizontal: 21.w,
                  ),
                  itemBuilder: (context, index) {
                    return FavoriteProduct(
                        img: list[index].imageUrl,
                        info: list[index].infoEn,
                        name: list[index].infoAr,
                        price: list[index].price,
                        onDeletePressed: () => controller.deleteFromFavorite(index),
                        onPressed: () => Navigator.pushNamed(context, AppScreens.productDetailsScreen));
                  },
                )
              ],
            );
          } else {
            return Center(
              child: Text(
                "No Data",
                style: GoogleFonts.nunitoSans(
                  fontSize: 24.sp,
                  color: AppColors.black,
                ),
              ),
            );
          }
        }
      },
    );
  }
}
