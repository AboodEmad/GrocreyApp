import 'dart:convert';
import 'dart:io';

import 'package:grocery_app/api/api_setting.dart';
import 'package:grocery_app/model/address.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../../prefs/shared_pref_controller.dart';

class AddressApiController {
  final _token = SharedPrefController().token;

  Future<List<Address>> getAddresses() async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('/{id}', ""));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Address.fromJson(e)).toList();
      return list;
    }
    return [];
  }

  Future<ApiResponse<Address>> createNewAddress({required Address address}) async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('/{id}', ""));
    var response = await http.post(
      uri,
      body: address.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse<Address>(message: json["message"], status: json["status"], model: Address.fromJson(json["object"]));
    }
    return ApiResponse<Address>(message: "Something going wrong!", status: false);
  }

  Future<ApiResponse> deleteAddress({required String id}) async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('{id}',id));
    var response = await http.delete(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(message: json["message"], status: true);
    }
    return ApiResponse(message: "Something going wrong!", status: false);
  }


  Future<ApiResponse<Address>> updateAddress({required Address address}) async {
    String queryString = Uri(queryParameters: address.toJson()).query;
    var requestUrl = Uri.parse("${ApiSettings.addresses.replaceFirst('{id}', address.id.toString())}?$queryString");
    var response = await http.put(
      requestUrl,
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse<Address>(message: json["message"], status: json["status"]);
    }
    return ApiResponse<Address>(message: "Something going wrong!", status: false);
  }


}
