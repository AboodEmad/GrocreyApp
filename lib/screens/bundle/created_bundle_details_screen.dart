import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/widget/app_button.dart';

import '../../utils/app_colors.dart';
import '../../widget/custom_row.dart';

class CreatedBundleDetailsScreen extends StatelessWidget {
  const CreatedBundleDetailsScreen({Key? key}) : super(key: key);
  final List<String> imgs = const[
    "vegetable_1.png",
    "vegetable_2.png",
    "vegetable_1.png",
    "vegetable_2.png",
    "vegetable_1.png",
    "vegetable_2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bundle Details Page"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 29.h, horizontal: 20.h),
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: imgs.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Image.asset("imags/${imgs.elementAt(index)}"),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Caulifiower",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "From The Garden",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "2 Kg",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 31.w,
                      ),
                      Text(
                        "\$14",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(color: AppColors.lightGrey, thickness: 2),
                ],
              );
            },
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CustomRow(leading: "Total Item", trilling: "6"),
              CustomRow(leading: "Weight", trilling: "33 Kg"),
              CustomRow(leading: "Price", trilling: "\$ 82.25"),
              CustomRow(leading: "Discount", trilling: "\$ 12.25"),
              const DashLine(),
              CustomRow(
                leading: "Total Price",
                trilling: "6",
                margitTop: 7,
              ),
              SizedBox(
                height: 26.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: AppButton(
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  content: "Create Bundle Pack",
                  onPressed: () => Navigator.pushReplacementNamed(context, AppScreens.createBundleScreen),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


