import 'dart:convert';
import 'dart:io';

import 'package:grocery_app/model/payment.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../../prefs/shared_pref_controller.dart';
import '../api_setting.dart';

class PaymentApiController {
  final _token = SharedPrefController().token;

  Future<List<Payment>> getPaymentCards() async {
    Uri uri = Uri.parse(ApiSettings.paymentCards.replaceFirst('/{id}', ""));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Payment.fromJson(e)).toList();
      return list;
    }
    return [];
  }

  Future<ApiResponse<Payment>> createNewPaymentCard({required Payment payment}) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards.replaceFirst('/{id}', ""));
    var response = await http.post(
      uri,
      body: payment.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if(response.statusCode == 201){
        var jsonObj = json["object"];
        return ApiResponse<Payment>(
          message: json["message"],
          status: json["status"],
          model: Payment.fromJson(jsonObj),
        );
      }else{
        return ApiResponse<Payment>(
          message: json["message"],
          status: json["status"],
        );
      }
    }
    return ApiResponse<Payment>(
      message: "Something going wrong!",
      status: false,
    );
  }


  Future<ApiResponse> updatePaymentCard({required Payment payment}) async {
    Uri uri = Uri.parse("${ApiSettings.paymentCards.replaceFirst('{id}',payment.id.toString())}?exp_date=${payment.expDate}");
    var response = await http.put(
      uri,
      body: payment.toJson(),
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(
        message: json["message"],
        status: json["status"],
      );
    }
    return ApiResponse(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<ApiResponse> deletePaymentCard({required String id}) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards.replaceFirst('{id}',id));
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
}
