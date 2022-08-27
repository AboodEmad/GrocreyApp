import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widget/delivery_address_item.dart';

import '../model/delivery_address_model.dart';
import '../utils/app_colors.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  List<DeliverAddressModel> list = [
    DeliverAddressModel(
        address: "Puraton Custom, Chhatak",
        road: "216/c East Road",
        number: "+8801710071000"),
    DeliverAddressModel(
        address: "Puraton Custom, Chhatak",
        road: "216/c East Road",
        number: "+8801710071000"),
    DeliverAddressModel(
        address: "Puraton Custom, Chhatak",
        road: "216/c East Road",
        number: "+8801710071000"),
    DeliverAddressModel(
        address: "Puraton Custom, Chhatak",
        road: "216/c East Road",
        number: "+8801710071000"),
    DeliverAddressModel(
        address: "Puraton Custom, Chhatak",
        road: "216/c East Road",
        number: "+8801710071000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: Text(
          "Order Tracking",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 16.w,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            color: AppColors.white,
          ),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: list.length,
            itemBuilder: (context, index) {
              var model = list.elementAt(index);
              return DeliveryAddressItem(
                address: model.address,
                number: model.number,
                isSelected: model.isSelected,
                road: model.road,
                onPressed: () {
                  setState(()=> list.elementAt(index).isSelected = !list.elementAt(index).isSelected);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
