import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/address.dart';

import '../utils/app_colors.dart';

class DeliveryAddressItem extends StatefulWidget {
  Address address;
  int value,groupValue;
  final void Function(int) onPressed;
  final void Function() onUpdatePressed;
  final void Function() onDeletePressed;

  DeliveryAddressItem({
    Key? key,
    required this.address,
    required this.value,
    required this.groupValue,
    required this.onPressed,
    required this.onUpdatePressed,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  State<DeliveryAddressItem> createState() => _DeliveryAddressItemState();
}

class _DeliveryAddressItemState extends State<DeliveryAddressItem> {

  bool get isDefault {
    return widget.value == widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        bool selected = widget.value != widget.groupValue;
        if(selected){
          widget.onPressed(widget.value);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  width: 16.w,
                  height: 16.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isDefault ? AppColors.primary : AppColors.white,
                      border: Border.all(
                        color: isDefault ? AppColors.primary : AppColors.grey,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 5.h),
                    children: [
                      Text(
                        widget.address.name,
                        style: GoogleFonts.nunitoSans(
                          height: 0,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        widget.address.info,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        widget.address.contactNumber,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: widget.onUpdatePressed,
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    IconButton(
                      onPressed: widget.onDeletePressed,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
            const Divider(
              color: AppColors.lightGrey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
