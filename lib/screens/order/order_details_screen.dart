import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/oder_api_controller.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/order_details.dart';
import 'package:grocery_app/widget/status_item.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../widget/custom_row.dart';
import '../../widget/order/order_details_row.dart';

class OrderDetailsScreen extends StatelessWidget {

  OrderDetailsScreen({Key? key,required this.id}) : super(key: key);

  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: FutureBuilder<ApiResponse<OrderDetails>>(
        future: OrderApiController().getOrderDetails(id: id),
        builder:(context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: AppColors.primary,),);
          }else{
            var order = snapshot.data!.model!;
            var products = order.products;
            DateTime parsedDate = DateTime.parse(order.date);
            var date = DateFormat("dd-MM-yyyy").format(parsedDate);
            var time = DateFormat("hh:mm:ss").format(parsedDate);
            return Container(
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
                  Text(
                    "id #${order.id.toString()}",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  OrderDetailsRow(
                    time: time.toString(),
                    status: order.status,
                    date: date,
                    borderColor: AppColors.primary,
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
                    itemCount: products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Image.network(products[index].imageUrl),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index].nameEn,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 16.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    products[index].infoEn,
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
                                    "\$${products[index].price}",
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
                                    "x${order.productsCount}",
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
                  CustomRow(leading: "Total Amount", trilling: order.total),
                  CustomRow(
                    leading: "Paid From",
                    trilling: order.paymentType,
                    margitTop: 17,
                  ),
                ],
              ),
            );
          }
      },
      ),
    );
  }
}
