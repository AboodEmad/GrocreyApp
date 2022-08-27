import 'package:flutter/material.dart';
import 'package:grocery_app/widget/empty_page.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPage(
      img: "empy_cart",
      title: "Oppss!",
      buttonText: "Start Browsing",
      supTitle: "Sorry, you have no product in your cart.",
    );
  }
}
