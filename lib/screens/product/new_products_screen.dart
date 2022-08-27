import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/products_getx_controller.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import '../../model/home.dart';
import '../../widget/product_item.dart';

class NewProductsScreen extends StatelessWidget {
  const NewProductsScreen({Key? key}) : super(key: key);

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
        title: const Text("New Items"),
      ),
      body: GetBuilder<ProductsGetController>(
        builder: (controller) {
          var home = controller.home;
          if (home != null) {
            return GridView.custom(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                pattern: const [
                  WovenGridTile(184 / 190,
                      alignment: AlignmentDirectional.center),
                  WovenGridTile(184 / 220,
                      alignment: AlignmentDirectional.center),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: home.latestProducts.length,
                (context, index) {
                  return ProductItem(
                    onPressed: () => Navigator.pushNamed(
                        context, AppScreens.productDetailsScreen),
                    img: home.latestProducts[index].imageUrl,
                    title: home.latestProducts[index].nameEn,
                    subTitle: home.latestProducts[index].infoEn,
                    currentPrice: home.latestProducts[index].price,
                  );
                },
              ),
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
        },
      ),
    );
  }
}
