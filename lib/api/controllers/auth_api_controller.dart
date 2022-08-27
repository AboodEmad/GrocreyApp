import 'dart:convert';
import 'dart:io';
import 'package:grocery_app/api/response_model/login_response.dart';
import 'package:grocery_app/model/user.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

import '../../model/address.dart';
import '../../model/api_response.dart';
import '../../model/city.dart';
import '../api_setting.dart';

class AuthApiController {
  Future<ApiResponse<User>> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse("https://smart-store.mr-dev.tech/api/auth/login");
    var response = await http.post(
      uri,
      body: {
        'mobile': mobile,
        'password': password,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      UserData? data;
      User? model;
      if (response.statusCode == 200) {
        data = UserData.fromJson(json["data"]);
        model = data.toUser();
      }
      return ApiResponse<User>(
          message: json["message"], status: json["status"], model: model);
    }
    return ApiResponse<User>(message: "Something going wrong!", status: false);
  }

  Future<ApiResponse<int>> register(
      {required Map<String, dynamic> user}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(
      uri,
      body: user,
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse<int>(
          message: json["message"],
          status: json["status"],
          model: json["code"]);
    }
    return ApiResponse<int>(message: "Something going wrong!", status: false);
  }

  Future<ApiResponse> updateProfile(
      {required Map<String, dynamic> user}) async {
    Uri uri = Uri.parse(ApiSettings.updateProfile);
    var response = await http.post(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
      body: user,
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(message: json["message"], status: json["status"]);
    }
    return ApiResponse<int>(message: "Something going wrong!", status: false);
  }

  Future<ApiResponse> logout({required String token}) async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      return ApiResponse<int>(message: json["message"], status: true);
    }
    return ApiResponse(message: "Something going wrong!", status: false);
  }

  Future<ApiResponse> activateAccount(
      {required String mobile, required String code}) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    var response = await http.post(uri, body: {
      "mobile": mobile,
      "code": code,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse<int>(message: json["message"], status: json["status"]);
    }
    return ApiResponse(message: "Something going wrong!", status: false);
  }

  Future<ApiResponse<String>> forgotPassword({required String mobile}) async {
    Uri uri = Uri.parse(ApiSettings.forgetPassword);

    var response = await http.post(uri, body: {
      "mobile": mobile,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse<String>(
          message: json["message"],
          status: json["status"],
          model: json["code"].toString());
    }
    return ApiResponse<String>(
        message: "Something going wrong!", status: false);
  }

  Future<ApiResponse> changePassword({required String currentPass, required String newPass, required String newPassConfirmation}) async {
    Uri uri = Uri.parse(ApiSettings.changePassword);

    var response = await http.post(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
      body: {
        "current_password": currentPass,
        "new_password": newPass,
        "new_password_confirmation": newPassConfirmation,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(
          message: json["message"],
          status: json["status"]);
    }
    return ApiResponse(
        message: "Something going wrong!", status: false);
  }

  Future<ApiResponse<int>> resetPassword(
      {required String mobile,
      required String code,
      required String password,
      required String passwordConfirmation}) async {
    Uri uri = Uri.parse(ApiSettings.resetPassword);

    var response = await http.post(uri, body: {
      "mobile": mobile,
      "code": code,
      "password": password,
      "password_confirmation": passwordConfirmation,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse<int>(
          message: json["message"],
          status: json["status"],
          model: json["code"]);
    }
    return ApiResponse(message: "Something going wrong!", status: false);
  }

  Future<List<City>> getCities() async {
    Uri uri = Uri.parse(ApiSettings.cities);

    var response = await http
        .get(uri, headers: {HttpHeaders.acceptHeader: "application/json"});

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<City> list = jsonObj.map((e) => City.fromJson(e)).toList();
      return list;
    }
    return [];
  }
}
