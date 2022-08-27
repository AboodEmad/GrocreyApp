import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widget/status_item.dart';

import '../utils/app_colors.dart';
import '../widget/custom_row.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);

  List<String> imgs = [
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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: const Text("Order Details"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
          children: [
            SizedBox(
              height: 380.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order id #30398505202",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        StatusClass().verticalProcessing,
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OrderRow(
                                icon: Icons.done,
                                time: "01:00 PM",
                                status: "Order Confirmed",
                                date: "12.12.020",
                                borderColor: AppColors.confirmedColor,
                              ),
                              OrderRow(
                                icon: Icons.handyman,
                                time: "01:00 PM",
                                status: "Order Processing",
                                date: "12.12.020",
                                borderColor: AppColors.shippedColor,
                              ),
                              OrderRow(
                                icon: Icons.local_shipping_outlined,
                                time: "01:00 PM",
                                status: "Order Shipped",
                                date: "12.12.020",
                                borderColor: AppColors.gradientBlue,
                              ),
                              OrderRow(
                                icon: Icons.delivery_dining,
                                time: "01:00 PM",
                                status: "Delivery",
                                date: "12.12.020",
                                borderColor: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              "Product Deatils",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 21.h,
            ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "2 Kg",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 14.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            SizedBox(
                              height: 9.h,
                            ),
                            Text(
                              "\$14",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "x5",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
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
            SizedBox(
              height: 25.h,
            ),
            CustomRow(leading: "Total Amount", trilling: "6"),
            CustomRow(
              leading: "Paid From",
              trilling: "Credit Card",
              margitTop: 17,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderRow extends StatelessWidget {
  String status, time, date;
  Color borderColor;
  IconData icon;

  OrderRow({
    Key? key,
    required this.icon,
    required this.time,
    required this.status,
    required this.date,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
            color: borderColor,
          ),
          child: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          width: 30.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                status,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                date,
                style: GoogleFonts.nunitoSans(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Text(
            time,
            style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
