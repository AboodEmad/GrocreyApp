import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/payment_api_controller.dart';
import 'package:grocery_app/get/payment_getx_controller.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/payment.dart';
import 'package:grocery_app/screens/payment/add_new_paymeny_option_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';

import '../../utils/custom_paint/payment_custom_paint.dart';
import '../../widget/payment/payment_card.dart';
import '../../widget/payment/payment_option.dart';

class PaymentOptionScreen extends StatefulWidget {
  const PaymentOptionScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionScreen> createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  PaymentGetController controller =
      Get.put<PaymentGetController>(PaymentGetController());

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text("Payment Option"),
        ),
        body: GetBuilder<PaymentGetController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else {
              var list = controller.list;
              print("abood");
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "My Card",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                        ),
                        child: IconButton(
                          constraints:
                              BoxConstraints(maxWidth: 40.w, maxHeight: 40.h),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddNewPaymentOptionScreen(),
                            ),
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 191.h,
                    child: PageView(
                        controller: _pageController,
                        onPageChanged: (int) {
                          //setState(() => currentPage == int);
                        },
                        children: list
                            .map(
                              (e) => PaymentCard(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddNewPaymentOptionScreen(
                                      payment: e,
                                    ),
                                  ),
                                ),
                                name: e.holderName,
                                expDate: e.expDate,
                                type: e.type,
                                id: e.cardNumber,
                              ),
                            )
                            .toList()),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Text(
                    "Other Payment Option",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 18.sp, color: AppColors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const PaymentOptionItem(
                    title: "Paypal",
                    subTitle: "Mypaypal@gmail.com",
                    img: "paypal",
                  ),
                  const PaymentOptionItem(
                    title: "Cash On Delivery",
                    subTitle: "Mypaypal@gmail.com",
                    img: "paypal",
                  ),
                  const PaymentOptionItem(
                    title: "Apple Pay",
                    subTitle: "applepay.com",
                    img: "paypal",
                  ),
                ],
              );
            }
          },
        ));
  }
}
