import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/order_item.dart';
import 'package:grocery_app/widget/order_tab.dart';

import '../model/order.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("My Order"),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
          ),
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
        body: TabBarView(
          children: [
            OrderTab(),
            OrderTab(),
            OrderTab(),
          ],
        ),
      ),
    );
  }
}
