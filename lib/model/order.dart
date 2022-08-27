class Order {
  late int id;
  late String total;
  late String date;
  late String paymentType;
  late String status;
  late String storeId;
  late String userId;
  late String addressId;
  String? paymentCardId;
  late String orderProductsCount;

  Order();

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    orderProductsCount = json['order_products_count'];
  }
}
