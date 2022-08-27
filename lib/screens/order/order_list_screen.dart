import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/oder_api_controller.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/order/order_item.dart';
import 'package:grocery_app/widget/order/order_tab.dart';

import '../../model/order.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("My Order"),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(vertical: 14.h),
            indicatorColor: AppColors.primary,
            labelStyle: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
            ),
            unselectedLabelColor: AppColors.grey,
            unselectedLabelStyle: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
            ),
            labelColor: AppColors.primary,
            tabs: const [
              Text("All (58)"),
              Text("Running (58)"),
              Text("Previous (58)"),
            ],
          ),
        ),
        backgroundColor: AppColors.lightGrey,
        body: FutureBuilder<ApiResponse<List<Order>>>(
          future: OrderApiController().getPaymentCards(),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(color: AppColors.primary,),);
            }else{
              var list = snapshot.data!.model!;
              return TabBarView(
                children: [
                  OrderTab(list: list,),
                  OrderTab(list: list),
                  OrderTab(list: list),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
