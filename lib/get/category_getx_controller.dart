
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grocery_app/api/controllers/category_api_controller.dart';
import 'package:grocery_app/model/sub_category.dart';

import '../model/category.dart';


class CategoryGetController extends GetxController{
  List<Category> categories = [];
  bool isLoading  = false;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getCategories();
  }

  static CategoryGetController get to => Get.find<CategoryGetController>();

  final CategoriesApiController _controller = CategoriesApiController();

  void _getCategories() async {
    isLoading  = true;
    categories = await _controller.getCategories();
    isLoading  = false;
    update();
  }

   Future<String> getSubCategoryId(String categoryId) async {
    var res = await _controller.getSubCategories(categoryId: categoryId);
    return res[0].id.toString();
  }


}