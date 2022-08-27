import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/cart_getx_controller.dart';
import 'package:grocery_app/screens/payment/checkout_screen.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/widget/app_button.dart';

import '../../utils/app_colors.dart';
import '../../widget/cart_product.dart';
import '../../widget/custom_row.dart';
import '../../widget/state_page.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({Key? key}) : super(key: key);

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<CartGetxController>(CartGetxController());
    CartGetxController.to.getQuantity();
    CartGetxController.to.getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => CartGetxController.to.clear(),
            icon: const Icon(
              Icons.delete,
              color: AppColors.red,
            ),
          ),
        ],
        elevation: 0,
        title: const Text("Cart Page"),
      ),
      backgroundColor: AppColors.white,
      body: GetBuilder<CartGetxController>(
        builder: (controller) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else {
            if (controller.cartItems.isNotEmpty) {
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Products",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 18.sp, color: AppColors.black),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CartProduct(
                        img: controller.cartItems[index].img,
                        name: controller.cartItems[index].name,
                        info: controller.cartItems[index].info,
                        price: controller.cartItems[index].price.toString(),
                        quantity:
                            controller.cartItems[index].quantity.toString(),
                        onDeletePressed: () =>
                            controller.changeQuantity(index, 0),
                        onPlusPressed: () => controller.changeQuantity(
                          index,
                          controller.cartItems[index].quantity += 1,
                          "add",
                        ),
                        onMinusPressed: () => controller.changeQuantity(
                          index,
                          controller.cartItems[index].quantity -= 1,
                          "minus",
                        ),
                      );
                    },
                  ),
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
                                borderSide: BorderSide(
                                    color: AppColors.lightGrey, width: 1.w),
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.lightGrey, width: 1.w),
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
                      CustomRow(
                        leading: "Total Item",
                        trilling: controller.itemsCount.toString(),
                      ),
                      CustomRow(
                        leading: "Discount",
                        trilling: "\$ 0.0",
                      ),
                      const DashLine(),
                      CustomRow(
                        leading: "Total Price",
                        trilling: controller.total.toString(),
                        margitTop: 7,
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      AppButton(
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.white,
                        content: "Checkout",
                        onPressed: (){
                          var cart = controller.cartItems.map((e) => e.toCartObj()).toList();
                          print("cart $cart");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CheckoutScreen(cart: cart),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              );
            } else {
              return StatePage(
                onPressed: () {},
                img: "empy_cart",
                title: "Oppss!",
                buttonText: "Start Browsing",
                supTitle: "Sorry, you have no product in your cart.",
              );
            }
          }
        },
      ),
    );
  }
}
