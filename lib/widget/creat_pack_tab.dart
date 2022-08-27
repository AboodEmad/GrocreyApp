import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/widget/product_item.dart';

import '../model/product.dart';

class CreatePackTab extends StatelessWidget {

  List<Product> list = [
    Product(name: "Cauliflower Form The Garden", weight: 1, price: 13, img: "pack_3"),
    Product(name: "Cauliflower Form The Garden", weight: 1, price: 13, img: "pack_2"),
    Product(name: "Cauliflower Form The Garden", weight: 1, price: 13, img: "pack_1"),
    Product(name: "Cauliflower Form The Garden", weight: 1, price: 13, img: "pack_3"),
    Product(name: "Cauliflower Form The Garden", weight: 1, price: 13, img: "pack_3"),
    Product(name: "Cauliflower Form The Garden", weight: 1, price: 13, img: "pack_1"),
    Product(name: "Cauliflower Form The Garden", weight: 1, price: 13, img: "pack_2"),
  ];
  CreatePackTab({Key? key}) : super(key: key);

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
            img: product.img,
            title: product.name,
            subTitle: product.weight.toString(),
            currentPrice: product.price,
          );
      },
      ),
    );
  }
}
