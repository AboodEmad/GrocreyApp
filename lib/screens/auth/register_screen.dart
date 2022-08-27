import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneNumberTextController;
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
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
    _nameTextController.dispose();
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
        padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 126.h),
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
            SizedBox(height: 32.h,),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.white,
              ),
              child: ListView(
                padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 56.h,bottom: 51.h),
                shrinkWrap: true,
                children: [
                  AppTextField(
                    textFiledController: _nameTextController,
                    labelText: "Name",
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  AppTextField(
                    textFiledController: _emailTextController,
                    labelText: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
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
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 24.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primary,
                          minimumSize: Size(80.w, 56.h),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          )
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 43.h,),
                  Center(child: RichText(
                    text: TextSpan(
                      text: "Already Have Account?",
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black45,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: "Log In",
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
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
