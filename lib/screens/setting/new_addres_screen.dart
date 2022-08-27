import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/address_api_controller.dart';
import 'package:grocery_app/get/address_getx_controller.dart';
import 'package:grocery_app/model/address.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/city.dart';
import 'package:grocery_app/utils/context_extenssion.dart';

import '../../api/controllers/auth_api_controller.dart';
import '../../utils/app_colors.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';

class NewAddressScreen extends StatefulWidget {
  NewAddressScreen({Key? key,this.address}) : super(key: key);

  Address? address;
  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  late TextEditingController _addressNameTextController;
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _addressInfoTextController;

  bool isDefault = false;

  int? _selectedCityId;

  @override
  void initState() {
    super.initState();
    _addressNameTextController = TextEditingController()..text = widget.address != null ? widget.address!.name : "";
    _phoneNumberTextController = TextEditingController()..text = widget.address != null ? widget.address!.contactNumber : "";
    _addressInfoTextController = TextEditingController()..text = widget.address != null ? widget.address!.info : "";
     _selectedCityId = widget.address != null ? widget.address!.cityId : null;
  }

  @override
  void dispose() {
    _addressNameTextController.dispose();
    _phoneNumberTextController.dispose();
    _addressInfoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: const Text("New Address"),
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
          children: [
            AppTextField(
              textFiledController: _addressNameTextController,
              labelText: "Address Name",
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              textFiledController: _phoneNumberTextController,
              labelText: "Phone Number",
              inputType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: false,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                textFiledController: _addressInfoTextController,
                labelText: "Address Info",
                inputType: TextInputType.streetAddress),
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder<List<City>>(
              future: AuthApiController().getCities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.grey, width: 1),
                    ),
                    child: DropdownButton<int>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('City'),
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      ),
                      onChanged: (int? value) {
                        setState(() => _selectedCityId = value!);
                      },
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print('Tapped');
                      },
                      dropdownColor: AppColors.lightGrey,
                      elevation: 1,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: AppColors.primary,
                      ),
                      value: _selectedCityId,
                      items: [],
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.grey, width: 1),
                    ),
                    child: DropdownButton<int>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('City'),
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      ),
                      onChanged: (int? value) {
                        setState(() => _selectedCityId = value!);
                      },
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print('Tapped');
                      },
                      dropdownColor: AppColors.lightGrey,
                      elevation: 1,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: AppColors.primary,
                      ),
                      value: _selectedCityId,
                      items: snapshot.data!.map(
                            (city) {
                          return DropdownMenuItem<int>(
                            value: city.id,
                            child: Text(
                              city.nameAr,
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 30.w,
            ),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Save",
              onPressed: () => _performCreateAddress(),
            ),
          ],
        ),
      ),
    );
  }

  void _performCreateAddress() {
    if (_checkData()) {
      _createAddress();
    }
  }

  bool _checkData() {
    if (_phoneNumberTextController.text.isNotEmpty &&
        _addressInfoTextController.text.isNotEmpty &&
        _addressInfoTextController.text.isNotEmpty &&
        _selectedCityId != null) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  void _createAddress() async {
    final ApiResponse response;
    var address = Address(
      name: _addressNameTextController.text,
      info: _addressInfoTextController.text,
      contactNumber: _phoneNumberTextController.text,
      cityId: _selectedCityId!,);
    if(widget.address == null){
      response = await AddressGetController.to.createNewAddress(address);
    }else{
      address.id = widget.address!.id;
      response = await AddressGetController.to.updateAddress(address);
    }
    // ignore: use_build_context_synchronously
    context.showSnackBar(message: response.message,error: !response.status);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}

List<DropdownMenuItem<T>> toDropDownItemsList<T>(List<City> list) {
  return list
      .map(
        (e) =>
        DropdownMenuItem<T>(
          value: e.id as T,
          child: Text(
            e.nameAr,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ),
        ),
  )
      .toList();
}
