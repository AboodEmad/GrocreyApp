import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_screens.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';
import '../../widget/bottom_sheet/verification_code_bottom_sheet.dart';
import '../auth/forgot_password_screen.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<ChangePhoneNumberScreen> createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  late TextEditingController _newPhoneNumberTextController;
  late TextEditingController _repeatedPhoneNumberTextController;
  late TextEditingController _emailTextController;


  late PageController _pageController;

  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _pageController = PageController();
    _newPhoneNumberTextController = TextEditingController();
    _repeatedPhoneNumberTextController = TextEditingController();
  }

  @override
  void dispose() {
    _newPhoneNumberTextController.dispose();
    _pageController.dispose();
    _repeatedPhoneNumberTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  void nextPage() {
    isVerified = true;
    _pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutBack,
    );
  }

  void showConfirmBottomSheet() {
    showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return VerificationCodeBottomSheet(
            controllers: [],
            pageController: _pageController,
            onPressed: () => isVerified
                ? Navigator.pushReplacementNamed(
              context,
              AppScreens.newPasswordScreen,
            )
                : nextPage(),
            email: _emailTextController.text,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
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
              onPressed: () => showConfirmBottomSheet(),
            ),
          ],
        ),
      ),
    );
  }
}
