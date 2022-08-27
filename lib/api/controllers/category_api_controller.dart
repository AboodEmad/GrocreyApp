import 'dart:convert';
import 'dart:io';

import 'package:grocery_app/api/api_setting.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/sub_category.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

import '../../model/category.dart';

class CategoriesApiController{
  final _token = SharedPrefController().token;

  Future<List<Category>> getCategories() async {
    Uri uri = Uri.parse(ApiSettings.categories.replaceFirst('/{id}', ""));
    var response = await http.get(uri,headers: {
      HttpHeaders.authorizationHeader:_token,
    });
    if(response.statusCode == 200 || response.statusCode == 401){
      print("heelo");
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<Category> list = jsonObj.map((e) => Category.fromJson(e)).toList();
      print("heelo");
      return list;
    }
    return [];
  }


  Future<List<SubCategory>> getSubCategories({required String categoryId}) async {
    Uri uri = Uri.parse(ApiSettings.categories.replaceFirst('{id}', categoryId));
    var response = await http.get(uri,headers: {
      HttpHeaders.authorizationHeader:_token,
    });
    if(response.statusCode == 200 || response.statusCode == 401){
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<SubCategory> list = jsonObj.map((e) => SubCategory.fromJson(e)).toList();
      return list;
    }
    return [];
  }
}