import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/auth_api_controller.dart';
import 'package:grocery_app/screens/auth/new_password_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/app_text_field.dart';
import 'package:grocery_app/widget/bottom_sheet/verification_code_bottom_sheet.dart';
import 'package:grocery_app/widget/verification_number_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _moblieTextController;

  @override
  void initState() {
    super.initState();
    _moblieTextController = TextEditingController();
    // _tapGestureRecognizer.onTap = createNewAccountAction;
  }

  @override
  void dispose() {
    _moblieTextController.dispose();
    super.dispose();
  }

  void showConfirmBottomSheet() {
    PageController pageController = PageController();
    bool isVerified = false;
    TextEditingController firstDigitController = TextEditingController();
    TextEditingController secondDigitController = TextEditingController();
    TextEditingController thirdDigitController = TextEditingController();
    TextEditingController fourthDigitController = TextEditingController();
    String verificationCode = "";

    showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return VerificationCodeBottomSheet(
                controllers: [
                  firstDigitController,
                  secondDigitController,
                  thirdDigitController,
                  fourthDigitController
                ],
                pageController: pageController,
                onPressed: () async {
                  if (isVerified) {
                    Navigator.pop(context);
                  } else {
                    var response = await AuthApiController()
                        .forgotPassword(mobile: _moblieTextController.text);
                    if (response.status) {
                      final code = response.model!;
                      verificationCode = code;
                      setState(() {
                        firstDigitController.text = code[0];
                        secondDigitController.text = code[1];
                        thirdDigitController.text = code[2];
                        fourthDigitController.text = code[3];
                        isVerified = true;
                      });
                      pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack,
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      context.showSnackBar(
                        message: response.message,
                        error: !response.status,
                      );
                    }
                  }
                },
                email: _moblieTextController.text,
              );
            },
          );
        }).then((value) {
      /// dispose
      pageController.dispose();
      firstDigitController.dispose();
      secondDigitController.dispose();
      thirdDigitController.dispose();
      fourthDigitController.dispose();

      /// then navigate
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NewPasswordScreen(
            mobile: _moblieTextController.text,
            code: verificationCode,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
              "Reset your password",
              style: GoogleFonts.nunitoSans(
                fontSize: 24.sp,
                color: AppColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              "Please enter your number. We will send a code to your phone to reset your password",
              style: GoogleFonts.nunitoSans(
                fontSize: 16.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            AppTextField(
              textFiledController: _moblieTextController,
              labelText: "Phone Number",
              inputType: TextInputType.phone,
            ),
            const Spacer(),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Send Me Link",
              onPressed: () => showConfirmBottomSheet(),
            ),
          ],
        ),
      ),
    );
  }
}
