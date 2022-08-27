import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/address_api_controller.dart';
import 'package:grocery_app/api/controllers/auth_api_controller.dart';
import 'package:grocery_app/get/address_getx_controller.dart';
import 'package:grocery_app/model/address.dart';
import 'package:grocery_app/model/user.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/screens/auth/verification_number_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/app_text_field.dart';
import '../../model/city.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _passwordTextController;
  late TextEditingController _addressInfoTextController;
  late TextEditingController _addressNameTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneNumberTextController;
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _obscure = true;

  String _gender = 'M';
  int _cityId = 1;

  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
    _addressInfoTextController = TextEditingController();
    _addressNameTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
    // _tapGestureRecognizer.onTap = createNewAccountAction;
  }

  void createNewAccountAction() =>
      Navigator.pushReplacementNamed(context, AppScreens.loginScreen);

  @override
  void dispose() {
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _addressNameTextController.dispose();
    _addressInfoTextController.dispose();
    _phoneNumberTextController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
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
                    textFiledController: _phoneNumberTextController,
                    labelText: "Phone Number",
                    inputType: TextInputType.phone,
                    formats: [
                      LengthLimitingTextInputFormatter(9),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey, width: 1),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: AppColors.primary,
                            title: Text('Male',
                                style: GoogleFonts.nunitoSans(fontSize: 15.sp)),
                            value: 'M',
                            groupValue: _gender,
                            onChanged: (String? value) {
                              setState(() => _gender = value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: AppColors.primary,
                            title: Text('Female',
                                style: GoogleFonts.nunitoSans(fontSize: 15.sp)),
                            value: 'F',
                            groupValue: _gender,
                            onChanged: (String? value) {
                              setState(() => _gender = value!);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  FutureBuilder<List<City>>(
                    future: AuthApiController().getCities(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColors.grey, width: 1),
                          ),
                          child: DropdownButton<int>(
                            isExpanded: true,
                            underline: const SizedBox(),
                            hint: const Text('City'),
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grey,
                            ),
                            onChanged: (int? value) {
                              setState(() => _cityId = value!);
                            },
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              print('Tapped');
                            },
                            dropdownColor: AppColors.lightGrey,
                            elevation: 1,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.primary,
                            ),
                            value: _cityId,
                            items: [],
                          ),
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColors.grey, width: 1),
                          ),
                          child: DropdownButton<int>(
                            isExpanded: true,
                            underline: const SizedBox(),
                            hint: const Text('City'),
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grey,
                            ),
                            onChanged: (int? value) {
                              setState(() => _cityId = value!);
                            },
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              print('Tapped');
                            },
                            dropdownColor: AppColors.lightGrey,
                            elevation: 1,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.primary,
                            ),
                            value: _cityId,
                            items: snapshot.data!.map(
                              (city) {
                                return DropdownMenuItem<int>(
                                  value: city.id,
                                  child: Text(
                                    city.nameAr,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.black,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  AppTextField(
                    textFiledController: _addressNameTextController,
                    labelText: "Address Name",
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  AppTextField(
                      textFiledController: _addressInfoTextController,
                      labelText: "Address Info",
                      inputType: TextInputType.streetAddress),
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
                        onPressed: () => _performRegister(),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                            minimumSize: Size(80.w, 56.h),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            )),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 43.h,
                  ),
                  Center(
                    child: RichText(
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

  void _performRegister() async {
    if (_checkData()) {
      _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _phoneNumberTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  void _register() async {
    var res = await AuthApiController().register(user: user);
    // ignore: use_build_context_synchronously
    context.showSnackBar(
      message: res.message,
      error: !res.status,
    );
    if (res.status) {
      var rout = MaterialPageRoute(
        builder: (context) => VerificationNumberScreen(
          code: res.model!.toString(),
          address: address,
          password: _passwordTextController.text,
          mobile: _phoneNumberTextController.text.toString(),
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, rout);
    }
  }

  Map<String, dynamic> get user => User.register(
        name: _nameTextController.text,
        password: _passwordTextController.text,
        mobile: _phoneNumberTextController.text,
        gender: _gender,
        cityId: _cityId.toString(),
      ).toJson();

  Address get address {
    return Address(
      name: _addressNameTextController.text,
      info: _addressInfoTextController.text,
      contactNumber: _phoneNumberTextController.text,
      cityId: _cityId,
    );
  }
}
