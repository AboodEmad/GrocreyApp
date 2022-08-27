import 'package:flutter/material.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/widget/state_page.dart';

class OrderStateScreen extends StatelessWidget {
  const OrderStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,automaticallyImplyLeading: false),
      backgroundColor: AppColors.white,
      body: StatePage(
        onPressed: () => Navigator.pushReplacementNamed(context, AppScreens.orderListScreen),
        trackable: true,
        img: "success_order",
        title: "Order Placed Successfully ",
        buttonText: "Continue",
        supTitle:"Thanks for your order. Your order has placed successfully. Please continue your order.",
      ),
    );
  }
}
