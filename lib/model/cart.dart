import 'create_order.dart';

class Cart {
  static const String tableName = "cart";
  late String productId, info, name, img;
  late double price;
  late int quantity;

  Cart({
    required this.productId,
    required this.info,
    required this.name,
    required this.img,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["product_id"] = productId;
    map["quantity"] = quantity;
    map["name"] = name;
    map["info"] = info;
    map["img"] = img;
    map["price"] = price;
    return map;
  }

  CartObj toCartObj() {
    return CartObj(
      productId: int.parse(productId),
      quantity: quantity,
    );
  }

  Cart.fromJson(Map<String, dynamic> map) {
    productId = map["product_id"];
    quantity = map["quantity"];
    info = map["info"];
    name = map["name"];
    price = map["price"];
    img = map["img"];
  }

  Cart.fromProductJson(Map<String, dynamic> map) {
    productId = map["id"].toString();
    quantity = 1;
    info = map["info_en"];
    name = map["name_en"];
    price = double.parse(map["price"]);
    img = map["image_url"];
  }
}
