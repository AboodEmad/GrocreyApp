import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/database/controllers/cart_db_controller.dart';

import '../model/process_response.dart';
class CartGetxController extends GetxController {

  List<Cart> cartItems = <Cart>[];
  bool loading = false;
  double total = 0;
  int itemsCount = 0;

  static CartGetxController get to => Get.find<CartGetxController>();

  @override
  void onInit() {
    _read();
    super.onInit();
  } // List<Product> products = <Product>[];


  final CartDbController _dbController = CartDbController();

  Future<ProcessResponse> create(Cart cart) async {
    int productIndex = cartItems.indexWhere((element) => cart.productId == element.productId);
    if(productIndex == -1){
      int newRowId = await _dbController.create(cart);
      cartItems.add(cart);
      update();
      return getResponse(newRowId != 0);
    }else{
      cartItems[productIndex].quantity += 1;
      update();
      return changeQuantity(productIndex, cartItems[productIndex].quantity);
    }
  }

  void _read() async {
    loading = true;
    cartItems = await _dbController.read();
    loading = false;
    update();
  }

  Future<ProcessResponse> changeQuantity(int index, int count,[String operation= ""]) async {
    bool isDelete = count == 0;
    Cart cart = cartItems[index];
    bool result = isDelete
        ? await _dbController.delete(cart.productId)
        : await _dbController.update(cart);
    if(isDelete){
      total -= cartItems[index].price;
      cartItems.removeAt(index);
      itemsCount -= 1;
    }else{
      switch(operation){
        case "add" :
          cartItems[index].quantity = count;
          total += cartItems[index].price;
          itemsCount += 1;
          break;
        case "minus" :
          cartItems[index].quantity = count;
          total -= cartItems[index].price;
          itemsCount -= 1;
          break;
      }
    }
    if(cartItems.isEmpty){
      clear();
    }
    update();
    return getResponse(result);
  }


  Future<ProcessResponse> clear() async {
    bool cleared = await _dbController.clear();
    if (cleared) {
      cartItems.clear();
      total = 0;
      itemsCount = 0;
    }
    update();
    return getResponse(cleared);
  }

  void getTotal() async {
    total =  await _dbController.getTotal();
    update();
  }

  void getQuantity() async {
    itemsCount =  await _dbController.getQuantity();
    update();
  }

  ProcessResponse getResponse(bool success) {
    return ProcessResponse(
      message:
      success ? 'Operation completed successfully' : 'Operation failed!',
      success: success,
    );
  }
}