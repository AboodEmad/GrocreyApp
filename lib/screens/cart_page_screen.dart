import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/app_text_field.dart';

import '../utils/app_colors.dart';
import '../widget/cart_product.dart';
import '../widget/custom_row.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({Key? key}) : super(key: key);

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Cart Page"),
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
        padding: const EdgeInsets.all(20),
        children: [
          const CartProduct(),
          const CartProduct(),
          const CartProduct(),
          const CartProduct(),
          SizedBox(
            height: 25.h,
          ),
          Text(
            "Add Coupon",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            height: 46.h,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      height: 0,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.nunitoSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        height: 0,
                        color: Colors.grey,
                      ),
                      hintText: "Entry Voucher Code",
                      fillColor: AppColors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.lightGrey, width: 1.w),
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.lightGrey, width: 1.w),
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      //hintText: AppLocalizations.of(context)!.email,
                    ),
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                AppButton(
                  elevation: 0,
                  radius: 7,
                  backgroundColor: AppColors.lightGrey,
                  textColor: AppColors.grey,
                  content: "Apply",
                  onPressed: () {},
                  width: 132.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
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
              AppButton(
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                content: "Checkout",
                onPressed: () {},
              )
            ],
          ),

        ],
      ),
    );
  }
}
