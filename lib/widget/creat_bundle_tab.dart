import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/widget/product_item.dart';

import '../model/product.dart';

class CreateBundleTab extends StatelessWidget {

  final List<Product> list = [];

  CreateBundleTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        pattern: const [
          WovenGridTile(184/190,alignment: AlignmentDirectional.center),
          WovenGridTile(184/220,alignment: AlignmentDirectional.center),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: list.length,(context, index) {
          var product = list.elementAt(index);
          return ProductItem(
            onPressed: (){},
            img: product.imageUrl,
            title: product.nameAr,
            subTitle: product.infoAr.toString(),
            currentPrice: product.price,
          );
      },
      ),
    );
  }
}
