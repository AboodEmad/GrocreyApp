import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/custom_row.dart';
import 'package:grocery_app/widget/offer_item.dart';

class OfferAndPromosScreen extends StatelessWidget {
  const OfferAndPromosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Offers & Promos"),
      ),
      backgroundColor: AppColors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            "You Have 5 Copons to use",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          OfferItem(
            expDate: "Exp-28/12/2020",
            productName: "BlackCoffee",
            offer: "41%",
            backgroundColor: Colors.indigoAccent,
          ),
          OfferItem(
            expDate: "Exp-28/12/2020",
            productName: "Oreo Biscut",
            offer: "23%",
            backgroundColor: Colors.green,
          ),
          OfferItem(
            expDate: "Exp-28/12/2020",
            productName: "Oreo Biscut",
            offer: "23%",
            backgroundColor: Colors.purple,
          ),
          OfferItem(
            expDate: "Exp-28/12/2020",
            productName: "Tuna Fish",
            offer: "23%",
            backgroundColor: Colors.cyanAccent,
          ),
        ],
      ),
    );
  }
}
