import 'package:grocery_app/model/category.dart';
import 'package:grocery_app/model/product.dart';

import 'home_slider.dart';

class Home {
  late List<HomeSlider> sliders;
  late List<Category> categories;
  late List<Product> latestProducts;
  late List<Product> famousProducts;

  Home();

  Home.fromJson(Map<String, dynamic> json){

    var data = json["slider"] as List;
    sliders = data.map((e) => HomeSlider.fromJson(e)).toList();

    var jsonCategories = json["categories"] as List;
    categories = jsonCategories.map((e) => Category.fromHomeJson(e)).toList();

    var jsonLatestProducts = json["latest_products"] as List;
    latestProducts = jsonLatestProducts.map((e) => Product.fromJson(e)).toList();

     var jsonFamousProducts = json["famous_products"] as List;
     famousProducts = jsonFamousProducts.map((e) => Product.fromJson(e)).toList();

  }
}
