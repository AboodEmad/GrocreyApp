import 'dart:convert';
import 'dart:io';

import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/home.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/product_offer.dart';
import 'package:http/http.dart' as http;

import '../../prefs/shared_pref_controller.dart';
import '../api_setting.dart';

class ProductsApiController {
  final _token = SharedPrefController().token;

  Future<List<Product>> getProducts({required String subCategoryId}) async {
    Uri uri = Uri.parse(ApiSettings.readProducts.replaceFirst('{id}', subCategoryId));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<Product> list = jsonObj.map((e) => Product.fromJson(e)).toList();
      return list;
    }
    return [];
  }

  Future<Product> getProductDetails({required String productId}) async {
    Uri uri = Uri.parse(
        ApiSettings.productDetails.replaceFirst('{id}', productId));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["object"] as Map<String, dynamic>;
      Product product = Product.fromJson(jsonObj);
      return product;
    }
    return Product();
  }

  Future<Home> getHomeProducts() async {
    Uri uri = Uri.parse(ApiSettings.home);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["data"] as Map<String, dynamic>;
      var homeProducts = Home.fromJson(jsonObj);
      return homeProducts;
    }
    return Home();
  }

  Future<List<ProductOffer>> getOffers() async {
    Uri uri = Uri.parse(ApiSettings.offers);

    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<ProductOffer> list = jsonObj.map((e) => ProductOffer.fromJson(e)).toList();
      return list;
    }
    return [];
  }

  Future<List<Product>> getFavoriteProducts() async {
    Uri uri = Uri.parse(ApiSettings.favoriteProducts);

    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<Product> list = jsonObj.map((e) => Product.fromJson(e)).toList();
      return list;
    }
    return [];
  }

  Future<ApiResponse> addToFavoriteProducts({required String productId}) async {
    Uri uri = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.post(
      uri,
      body: {
        "product_id": productId,
      },
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      return ApiResponse(message: json["message"], status: json["status"]);
    }
    return ApiResponse(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<ApiResponse> rateProduct({required String productId,required String rate}) async {
    Uri uri = Uri.parse(ApiSettings.rateProduct);

    var response = await http.post(
      uri,
      body: {
        "product_id": productId,
        "rate": rate,
      },
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      return ApiResponse(message: json["message"], status: json["status"]);
    }
    return ApiResponse(
      message: "Something going wrong!",
      status: false,
    );
  }
}
