import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../widget/app_button.dart';
import '../widget/app_text_field.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  late TextEditingController _fullNameTextController;
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _address1TextController;
  late TextEditingController _address2TextController;
  late TextEditingController _cityTextController;
  late TextEditingController _stateTextController;
  late TextEditingController _zipCodeTextController;

  bool isDefault = false;

  @override
  void initState() {
    super.initState();
    _fullNameTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _address1TextController = TextEditingController();
    _address2TextController = TextEditingController();
    _cityTextController = TextEditingController();
    _stateTextController = TextEditingController();
    _zipCodeTextController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameTextController.dispose();
    _phoneNumberTextController.dispose();
    _address1TextController.dispose();
    _address2TextController.dispose();
    _cityTextController.dispose();
    _stateTextController.dispose();
    _zipCodeTextController.dispose();
    super.dispose();
  }

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
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
          children: [
            AppTextField(
              textFiledController: _fullNameTextController,
              labelText: "Full Name",
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              textFiledController: _phoneNumberTextController,
              labelText: "Phone Number",
              inputType: const TextInputType.numberWithOptions(
                  decimal: false, signed: false),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                textFiledController: _address1TextController,
                labelText: "Address Link 1",
                inputType: TextInputType.streetAddress),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                textFiledController: _address2TextController,
                labelText: "Address Link 2",
                inputType: TextInputType.streetAddress),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                textFiledController: _cityTextController,
                labelText: "City",
                inputType: TextInputType.text),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                      textFiledController: _stateTextController,
                      labelText: "State",
                      inputType: TextInputType.text),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: AppTextField(
                    textFiledController: _zipCodeTextController,
                    labelText: "Zip Code",
                    inputType: const TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() => isDefault = !isDefault),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.h),
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
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Text(
                    "Make Default Default Shipping Address",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.w,
            ),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Save",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
