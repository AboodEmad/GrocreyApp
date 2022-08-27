import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/auth_api_controller.dart';
import 'package:grocery_app/get/address_getx_controller.dart';
import 'package:grocery_app/get/payment_getx_controller.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _passwordTextController;
  bool _obscure = true;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
    // _tapGestureRecognizer.onTap = createNewAccountAction;
  }

  void createNewAccountAction() {
    Navigator.pushNamed(context, AppScreens.registerScreen);
  }

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
    _passwordTextController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 90.h, bottom: 22.h),
                padding: const EdgeInsets.all(25),
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Image.asset("imags/logo2.png"),
              ),
            ),
            Text(
              "Welcome to our",
              style: GoogleFonts.nunitoSans(
                fontSize: 24.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "E-Grocery",
              style: GoogleFonts.nunitoSans(
                fontSize: 24.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
            AppTextField(
              inputType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              textFiledController: _phoneNumberTextController,
              labelText: "Phone Number",
              formats: [
                LengthLimitingTextInputFormatter(9),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(
              height: 26.h,
            ),
            AppTextField(
              textFiledController: _passwordTextController,
              labelText: "Password",
              obscure: _obscure,
              suffix: IconButton(
                onPressed: () {
                  setState(() => _obscure = !_obscure);
                },
                icon: Icon(
                  _obscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                  onPressed: () => Navigator.pushNamed(
                      context, AppScreens.forgotPasswordScreen),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  )),
            ),
            SizedBox(
              height: 29.h,
            ),
            AppButton(
              onPressed: () => _performLogin(),
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Login",
            ),
            SizedBox(
              height: 49.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OptionsBorder(
                  text: "Google",
                  img: "google",
                  borderColor: Colors.red,
                ),
                SizedBox(
                  width: 10.w,
                ),
                OptionsBorder(
                  text: "Apple",
                  img: "apple",
                  borderColor: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 26.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don’t Have Account?",
                  style: GoogleFonts.nunitoSans(
                    color: Colors.black45,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: "Sign up",
                      recognizer: _tapGestureRecognizer,
                      style: GoogleFonts.nunitoSans(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_phoneNumberTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  void _login() async {
    var res = await AuthApiController().login(
      mobile: _phoneNumberTextController.text,
      password: _passwordTextController.text,
    );
    if (res.status) {
      SharedPrefController().save(user: res.model!);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppScreens.bottomNavScreen);
    }
    // ignore: use_build_context_synchronously
    context.showSnackBar(
      message: res.message,
      error: !res.status,
    );
  }
}

class OptionsBorder extends StatelessWidget {
  String text, img;
  Color borderColor;

  OptionsBorder(
      {Key? key,
      required this.text,
      required this.img,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset("imags/$img.svg"),
          SizedBox(
            width: 15.w,
          ),
          Text(
            text,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: borderColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
