import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_text_field.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({Key? key}) : super(key: key);

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  late TextEditingController _passwordTextController;
  late TextEditingController _phoneNumberTextController;
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
    // _tapGestureRecognizer.onTap = createNewAccountAction;
  }

  void createNewAccountAction() =>
      Navigator.pushReplacementNamed(context, "/register_screen");

  @override
  void dispose() {
    _passwordTextController.dispose();
    _phoneNumberTextController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 126.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to our shop",
              style: GoogleFonts.nunitoSans(
                fontSize: 32.sp,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.white,
              ),
              child: ListView(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 56.h, bottom: 51.h),
                shrinkWrap: true,
                children: [
                  AppTextField(
                    textFiledController: _phoneNumberTextController,
                    labelText: "Phone Number",
                    inputType: TextInputType.phone,
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
                            context, "/forgot_password_screen"),
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
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 24.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, "/bottom_nav_screen"),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                            minimumSize: Size(80.w, 56.h),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15.r,
                              ),
                            )),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't Have Account?",
                        style: GoogleFonts.nunitoSans(
                          color: Colors.black45,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: "Sign Up",
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
            )
          ],
        ),
      ),
    );
  }
}
