import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/api/controllers/auth_api_controller.dart';
import 'package:grocery_app/utils/context_extenssion.dart';

import '../../utils/app_colors.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';

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
                  setState(
                      () => _currentPasswordObscure = !_currentPasswordObscure);
                },
                icon: Icon(
                  _currentPasswordObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
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
                  setState(() =>
                      _repeatedPasswordObscure = !_repeatedPasswordObscure);
                },
                icon: Icon(
                  _repeatedPasswordObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
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
              onPressed: () => _performChangePassword(),
            ),
          ],
        ),
      ),
    );
  }

  void _performChangePassword(){
    if(_checkDate()){
      _changePassword();
    }
  }

  void _changePassword() async {
    var res = await AuthApiController().changePassword(
      currentPass: _currentPasswordTextController.text,
      newPass: _newPasswordTextController.text,
      newPassConfirmation: _repeatedPasswordTextController.text,
    );
    if(res.status){
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
    // ignore: use_build_context_synchronously
    context.showSnackBar(
      message: res.message,
      error: !res.status,
    );
  }

  bool _checkDate() {
    if (_currentPasswordTextController.text.isNotEmpty &&
        _repeatedPasswordTextController.text.isNotEmpty &&
        _newPasswordTextController.text.isNotEmpty) {
      if (_newPasswordTextController.text ==
          _repeatedPasswordTextController.text) {
        return true;
      } else {
        context.showSnackBar(
          message: "Passwords not match",
          error: false,
        );
        return false;
      }
    }
    context.showSnackBar(
      message: "Enter date",
      error: false,
    );
    return false;
  }
}
