import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/api/controllers/products_api_controller.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/screens/product/product_details_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';

import '../../widget/product_item.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String subCategoryId;

  CategoryProductsScreen({Key? key, required this.subCategoryId})
      : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Vagetables"),
      ),
      backgroundColor: AppColors.white,
      body: FutureBuilder<List<Product>>(
        future: ProductsApiController().getProducts(subCategoryId: widget.subCategoryId),
        builder:(context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }else{
            var list = snapshot.data!;
            print("heelo abood ${list.length}");
           return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 25.h,
              ),
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  pattern: const [
                    WovenGridTile(184 / 190, alignment: AlignmentDirectional.center),
                    WovenGridTile(184 / 220, alignment: AlignmentDirectional.center),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: list.length,
                      (context, index) {
                    final product = list[index];
                    return ProductItem(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: list[index],
                            ),
                          ),
                        );
                      },
                      img: product.imageUrl,
                      title: product.nameEn,
                      subTitle: product.infoEn,
                      currentPrice: product.price,
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
