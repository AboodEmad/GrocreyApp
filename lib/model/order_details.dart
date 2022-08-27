import 'package:grocery_app/model/product.dart';

class OrderDetails {
  late int id;
  late String total;
  late String date;
  late String paymentType;
  late String status;
  late String storeId;
  late String userId;
  late String addressId;
  String? paymentCardId;
  late String productsCount;
  late List<Product> products;

  OrderDetails();

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    productsCount = json['products_count'];
    print("ss $storeId");
    var data = json["products"] as List;
    products = data.map((e) => Product.fromJson(e)).toList();
  }
}