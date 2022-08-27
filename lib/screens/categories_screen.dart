import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/category.dart';

import '../model/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoryModel> list = [
    CategoryModel(icon: "category_apple", text: "Vegetables"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_apple", text: "Vegetables"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_apple", text: "Vegetables"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
    CategoryModel(icon: "category_fish", text: "Meat & Fish"),
  ];

  @override
  Widget build(BuildContext context) {
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
            CategoryModel model = list.elementAt(index);
            return CategoryItem(
              icon: model.icon,
              isSelected: model.isSelected,
              text: model.text,
              onPressed: (){
                setState(() => list.elementAt(index).isSelected = !list.elementAt(index).isSelected);
              },
            );
          },
        ),
      ],
    );
  }
}
