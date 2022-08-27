import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../widget/app_button.dart';
import '../widget/app_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _newPasswordTextController;
  late TextEditingController _repeatedPasswordTextController;
  late TextEditingController _currentPasswordTextController;
  bool _newPasswordObscure = true;
  bool _currentPasswordObscure = true;
  bool _repeatedPasswordObscure = true;

  @override
  void initState() {
    super.initState();
    _newPasswordTextController = TextEditingController();
    _repeatedPasswordTextController = TextEditingController();
    _currentPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordTextController.dispose();
    _currentPasswordTextController.dispose();
    _repeatedPasswordTextController.dispose();
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
        title: const Text("Change Password"),
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
              textFiledController: _currentPasswordTextController,
              labelText: "Current Password",
              obscure: _currentPasswordObscure,
              suffix: IconButton(
                onPressed: () {
                  setState(() => _currentPasswordObscure = !_currentPasswordObscure);
                },
                icon: Icon(
                  _currentPasswordObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            AppTextField(
              textFiledController: _newPasswordTextController,
              labelText: "New Password",
              obscure: _newPasswordObscure,
              suffix: IconButton(
                onPressed: () {
                  setState(() => _newPasswordObscure = !_newPasswordObscure);
                },
                icon: Icon(
                  _newPasswordObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            AppTextField(
              textFiledController: _repeatedPasswordTextController,
              obscure: _repeatedPasswordObscure,
              suffix: IconButton(
                onPressed: () {
                  setState(() => _repeatedPasswordObscure = !_repeatedPasswordObscure);
                },
                icon: Icon(
                  _repeatedPasswordObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade400,
                ),
              ),
              labelText: "Retype Password",
            ),
            const Spacer(),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Update Password",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
