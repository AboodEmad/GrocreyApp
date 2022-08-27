import 'package:get/get.dart';
import 'package:grocery_app/api/controllers/address_api_controller.dart';
import 'package:grocery_app/model/api_response.dart';

import '../model/address.dart';
import '../prefs/shared_pref_controller.dart';

class AddressGetController extends GetxController{
  List<Address> list = [];
  late bool isLoading = false;
  Address? defaultAddress;

  final AddressApiController _controller = AddressApiController();

  static AddressGetController get to => Get.find<AddressGetController>();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getAddressList();
  }

  int get defaultAddressIndex {
    return list.indexWhere((element) => element.id == (defaultAddress!.id ?? 0));
  }

  Future<ApiResponse> createNewAddress(Address address) async {
    var res = await _controller.createNewAddress(address: address);
    if(res.status){
      list.add(res.model!);
    }
    update();
    return res;
  }

  Future<ApiResponse> updateAddress(Address address) async {
    var res = await _controller.updateAddress(address: address);
    if(res.status){
      int index = list.indexWhere((element) => address.id == element.id);
      list[index] = address;
    }
    update();
    return res;
  }

  Future<ApiResponse> deleteAddress(int index) async {
    String id = list[index].id.toString();
    var res = await _controller.deleteAddress(id: id);
    if(res.status){
      list.removeAt(index);
    }
    update();
    return res;
  }

  void setDefaultValue (Address address){
    SharedPrefController().saveDefaultAddress(address);
    defaultAddress = address;
    update();
  }

  void _getAddressList() async{
    isLoading = true;
    list = await _controller.getAddresses();
    isLoading = false;
    defaultAddress = list[0];
    update();
  }
}