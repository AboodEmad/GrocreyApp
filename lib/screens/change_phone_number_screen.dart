import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../widget/app_button.dart';
import '../widget/app_text_field.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<ChangePhoneNumberScreen> createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  late TextEditingController _newPhoneNumberTextController;
  late TextEditingController _repeatedPhoneNumberTextController;

  @override
  void initState() {
    super.initState();
    _newPhoneNumberTextController = TextEditingController();
    _repeatedPhoneNumberTextController = TextEditingController();
  }

  @override
  void dispose() {
    _newPhoneNumberTextController.dispose();
    _repeatedPhoneNumberTextController.dispose();
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
        title: const Text("Change Phone Number"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 16.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 56.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
                textFiledController: _newPhoneNumberTextController,
                labelText: "New Phone Number",
                inputType: TextInputType.phone),
            SizedBox(
              height: 26.h,
            ),
            AppTextField(
                textFiledController: _repeatedPhoneNumberTextController,
                labelText: "ReType Phone Number",
                inputType: TextInputType.phone),
            const Spacer(),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Update Phone Number",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
