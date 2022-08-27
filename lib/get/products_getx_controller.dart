

import 'package:get/get.dart';
import 'package:grocery_app/api/controllers/products_api_controller.dart';
import 'package:grocery_app/model/home.dart';
import 'package:grocery_app/model/product_offer.dart';

import '../model/api_response.dart';
import '../model/product.dart';

class ProductsGetController extends GetxController{
  List<Product> favoriteList = [];
  bool isLoading = false;
  Home? home;

  static ProductsGetController get to => Get.find<ProductsGetController>();

  final ProductsApiController _controller = ProductsApiController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getFavoriteProducts();
    _getHome();
  }

  Future<Product> getProductDetails(String productId) async {
    return await _controller.getProductDetails(productId: productId);
  }

  Future<List<ProductOffer>> getOffers() async {
    return await _controller.getOffers();
  }

  Future<List<Product>> getProductsForCategory(String subCategoryId) async {
    return await _controller.getProducts(subCategoryId: subCategoryId);
  }

  Future<ApiResponse> addToFavorite(Product product) async {
    var response = await _controller.addToFavoriteProducts(productId: product.id.toString());
    if(product.isFavorite){
      print("ha");
      favoriteList.add(product);
    }else{
      print("no");
      favoriteList.remove(product);
    }
    update();
    return response;
  }

  void deleteFromFavorite(int index) async {
    _controller.addToFavoriteProducts(productId: favoriteList[index].id.toString());
    favoriteList.removeAt(index);
    update();
  }

  void rateProduct(String productId,String rate) async{
    _controller.rateProduct(productId: productId, rate: rate);
  }

  void _getFavoriteProducts() async {
    isLoading = true;
    favoriteList = await _controller.getFavoriteProducts();
    isLoading = false;
    update();
  }

  void _getHome() async {
    isLoading = true;
    home = await _controller.getHomeProducts();
    isLoading = false;
    update();
  }
}