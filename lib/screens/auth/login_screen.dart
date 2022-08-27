import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/app_text_field.dart';
import 'package:flutter_svg/avd.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  bool _obscure = true;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
    // _tapGestureRecognizer.onTap = createNewAccountAction;
  }

  void createNewAccountAction() =>
      Navigator.pushNamed(context, "/register_screen");

  @override
  void dispose() {
    _emailTextController.dispose();
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
                margin: EdgeInsets.only(top: 77.h, bottom: 22.h),
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
                textFiledController: _emailTextController,
                labelText: "Phone Number"),
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
                  onPressed: () =>
                      Navigator.pushNamed(context, "/forgot_password_screen"),
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
                onPressed: (){},
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                content: "Login"),
            SizedBox(
              height: 49.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomWidget(
                  text: "Google",
                  img: "google",
                  borderColor: Colors.red,
                ),
                SizedBox(width: 10.w,),
                CustomWidget(
                  text: "Apple",
                  img: "apple",
                  borderColor: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 26.h,),
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
}

class CustomWidget extends StatelessWidget {
  String text, img;
  Color borderColor;

  CustomWidget(
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
