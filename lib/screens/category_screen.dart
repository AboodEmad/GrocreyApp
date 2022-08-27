import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../widget/product_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Vagetables"),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 25.h,
        ),
        child: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            pattern: const [
              WovenGridTile(184/190,alignment: AlignmentDirectional.center),
              WovenGridTile(184/220,alignment: AlignmentDirectional.center),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: 10,(context, index) {
            return ProductItem(
              img: "pack_3",
              title: "Cauliflower Form The Garden",
              subTitle: "1 kg",
              currentPrice: 35,
            );
          },
          ),
        ),
      ),
    );
  }
}
