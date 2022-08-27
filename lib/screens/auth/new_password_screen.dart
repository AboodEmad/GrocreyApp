import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/dialog/success_dialog.dart';

import '../../api/controllers/auth_api_controller.dart';
import '../../utils/app_colors.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';

class NewPasswordScreen extends StatefulWidget {
  String code, mobile;

  NewPasswordScreen({Key? key, required this.code, required this.mobile})
      : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController _newPasswordTextController;
  late TextEditingController _repeatedPasswordTextController;
  bool _newPasswordObscure = true;
  bool _repeatedPasswordObscure = true;

  @override
  void initState() {
    super.initState();
    _newPasswordTextController = TextEditingController();
    _repeatedPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordTextController.dispose();
    _repeatedPasswordTextController.dispose();
    super.dispose();
  }

  void _confirmDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const SuccessDialog(
          title: "Verified!!",
          subTitle: "Hurrah!!  You have successfully change your password",
        );
      },
    ).then((value) => {
      Navigator.pop(context)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("New Password"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 16.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 73.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New password",
              style: GoogleFonts.nunitoSans(
                fontSize: 24.sp,
                color: AppColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 21.h,
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
              inputType: TextInputType.emailAddress,
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
              content: "Done",
              onPressed: () => _verify(),
            ),
          ],
        ),
      ),
    );
  }

  void _verify() async {
    var apiResponse = await AuthApiController().resetPassword(
      mobile: widget.mobile,
      code: widget.code,
      password: _newPasswordTextController.text,
      passwordConfirmation: _repeatedPasswordTextController.text,
    );
    if (apiResponse.status) {
      _confirmDialog();
    } else {
      // ignore: use_build_context_synchronously
      context.showSnackBar(
        message: apiResponse.message,
        error: !apiResponse.status,
      );
    }
  }
}
