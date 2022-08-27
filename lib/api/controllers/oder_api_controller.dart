import 'dart:convert';
import 'dart:io';

import 'package:grocery_app/model/faq.dart';
import 'package:grocery_app/model/order.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../../model/create_order.dart';
import '../../model/order_details.dart';
import '../../prefs/shared_pref_controller.dart';
import '../api_setting.dart';

class OrderApiController {
  final _token = SharedPrefController().token;

  Future<ApiResponse<List<Order>>> getPaymentCards() async {
    Uri uri = Uri.parse(ApiSettings.orders.replaceFirst('/{id}', ""));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Order.fromJson(e)).toList();
      return ApiResponse<List<Order>>(
        message: json["message"],
        status: json["status"],
        model: list,
      );
    }
    return ApiResponse<List<Order>>(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<ApiResponse<OrderDetails>> getOrderDetails(
      {required String id}) async {
    Uri uri = Uri.parse(ApiSettings.orders.replaceFirst('{id}', id));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    print("state ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["data"];
      var data = OrderDetails.fromJson(jsonObj);
      return ApiResponse<OrderDetails>(
        message: json["message"],
        status: json["status"],
        model: data,
      );
    }
    return ApiResponse<OrderDetails>(
      message: "Something going wrong!",
      status: false,
    );
  }

  Future<ApiResponse> createOrder({required CreateOrder order}) async {
    Uri uri = Uri.parse(ApiSettings.orders.replaceFirst('/{id}', ""));
    var response = await http.post(
      uri,
      body: {
        "payment_type" : order.paymentType,
        "address_id" : order.addressId,
        "cart" : order.cartList
      },
      headers: {
        HttpHeaders.authorizationHeader: _token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(
        message: json["message"],
        status: true,
      );
    }
    return ApiResponse(
      message: "Something going wrong!",
      status: false,
    );
  }


  Future<List<Faq>> getFaqs() async {
    Uri uri = Uri.parse(ApiSettings.faqs);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: _token,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      final list = jsonObj.map((e) => Faq.fromJson(e)).toList();
      return list;
    }
    return [];
  }
}
