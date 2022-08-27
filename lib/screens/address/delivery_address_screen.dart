import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/address_api_controller.dart';
import 'package:grocery_app/get/address_getx_controller.dart';
import 'package:grocery_app/model/address.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/screens/setting/new_addres_screen.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/delivery_address_item.dart';
import '../../utils/app_colors.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {

  int addressIdIndex = AddressGetController.to.defaultAddressIndex;
  int? defaultValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Delivery Address",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      body: GetBuilder<AddressGetController>(
        init: AddressGetController(),
        builder:(controller){
          if (controller.isLoading) {
            print("is l ${controller.isLoading}");
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else {
            var data = controller.list;
            if(data.isEmpty){
              return Center(child: Text("No Data",style: GoogleFonts.nunitoSans(fontSize: 24.sp,color: AppColors.primary),),);
            }else{
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.h,
                  horizontal: 16.w,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.r),
                    color: AppColors.white,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return DeliveryAddressItem(
                            onUpdatePressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewAddressScreen(
                                  address: data[index],
                                ),
                              ),
                            ),
                            onDeletePressed: () => controller.deleteAddress(index),
                            address: data[index],
                            value: index,
                            groupValue: defaultValue ?? addressIdIndex,
                            onPressed:(index){
                              setState(() => defaultValue = index);
                              controller.setDefaultValue(data[index]);
                            },
                          );
                        },
                      ),
                      PositionedDirectional(
                        bottom: 20.h,
                        start: 20.w,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewAddressScreen(),
                            ),
                          ),
                          child: Container(
                            height: 44.h,
                            width: 44.w,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary,
                                  offset: Offset(0.0, 3.0), //(x,y)
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
