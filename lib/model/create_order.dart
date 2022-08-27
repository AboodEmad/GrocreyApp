import 'dart:convert';

class CreateOrder {
  String paymentType;
  String addressId;
  List<CartObj> cart;

  CreateOrder({
   required this.paymentType,
   required this.addressId,
   required this.cart,
  });

  String get cartList => json.encoder.convert(cart);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_type'] = paymentType;
    data['address_id'] = addressId;
    data['cart'] = json.encoder.convert(cart);
    return data;
  }

  // List<Map<String, int>> _getCartDetails() {
  //   List<Map<String, int>> cartList = [];
  //   for (int i = 0; i < cart.length; i++) {
  //     Map<String, int> map = {};
  //     map["product_id"] = cart[i].productId;
  //     map["quantity"] = cart[i].quantity;
  //     cartList.add(map);
  //   }
  //   return cartList;
  // }
}

class CartObj {
  int productId, quantity;

  CartObj({required this.productId, required this.quantity});

  Map<String, int> toJson() {
    final Map<String, int> data = <String, int>{};
    data['product_id'] = productId;
    data['quantity'] = quantity;
    return data;
  }

}
