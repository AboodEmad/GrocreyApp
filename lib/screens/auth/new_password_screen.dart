import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';


class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
        title: const Text("Forget Password"),
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
              content: "Done",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
