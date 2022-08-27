import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/category_api_controller.dart';
import 'package:grocery_app/get/category_getx_controller.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/screens/category/category_products_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/category.dart';

import '../../model/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<CategoryGetController>(CategoryGetController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryGetController>(
      init: CategoryGetController(),
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else {
          if (controller.categories.isEmpty) {
            return Center(
              child: Text(
                "No Data",
                style: GoogleFonts.nunitoSans(
                    fontSize: 24.sp, color: AppColors.black),
              ),
            );
          } else {
            List<Category> list = controller.categories;
            return ListView(
              children: [
                Center(
                  child: Text(
                    "Choose a Category",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 30.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 39.h,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 24.w,
                    childAspectRatio: 105.w / 120.h,
                  ),
                  itemBuilder: (context, index) {
                    Category model = list.elementAt(index);
                    return CategoryItem(
                      icon: model.imageUrl,
                      text: model.nameEn,
                      // onPressed: () => Navigator.pushNamed(context, AppScreens.categoryScreen),
                      onPressed: () async {
                        String id = await controller.getSubCategoryId(model.id.toString());
                        final rout = MaterialPageRoute(
                            builder: (context) =>
                                CategoryProductsScreen(subCategoryId: id));
                        // ignore: use_build_context_synchronously
                        Navigator.push(context, rout);
                      },
                    );
                  },
                ),
              ],
            );
          }
        }
      },
    );
  }
}
