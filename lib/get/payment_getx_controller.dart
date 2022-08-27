
import 'package:get/get.dart';
import 'package:grocery_app/api/controllers/payment_api_controller.dart';
import 'package:grocery_app/model/api_response.dart';

import '../model/payment.dart';
import '../prefs/shared_pref_controller.dart';

class PaymentGetController extends GetxController{
  List<Payment> list = [];
  bool isLoading = false;
  Payment? defaultPayment;

  final PaymentApiController _controller = PaymentApiController();

  static PaymentGetController get to => Get.find<PaymentGetController>();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getPaymentList();
  }

  void _getPaymentList() async {
    isLoading = true;
    list = await _controller.getPaymentCards();
    isLoading = false;
    update();
  }

  Future<ApiResponse> createNewPayment(Payment payment) async {
    var res = await _controller.createNewPaymentCard(payment: payment);
    if(res.status){
      list.add(res.model!);
      update();
    }
    return ApiResponse(message: res.message, status: res.status,model: res.model);
  }

  Future<ApiResponse<Payment>> updatePayment(Payment payment) async {
    var res = await _controller.updatePaymentCard(payment: payment);
    if(res.status){
      int index = list.indexWhere((element) => element.id == payment.id);
      list[index] = payment;
      update();
    }
    return ApiResponse(message: res.message, status: res.status,model: payment);
  }

  Future<ApiResponse> deletePayment(Payment payment) async {
    var res = await _controller.deletePaymentCard(id: payment.id.toString());
    if(res.status){
      list.remove(payment);
      update();
    }
    return ApiResponse(message: res.message, status: res.status);
  }

  void setDefaultPayment(Payment payment){
    SharedPrefController().saveDefaultPayment(payment);
    defaultPayment = payment;
    update();
  }

}