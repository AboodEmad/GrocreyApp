import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/auth_api_controller.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/dialog/success_dialog.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/verification_number_widget.dart';
import '../../api/controllers/address_api_controller.dart';
import '../../model/address.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_screens.dart';

class VerificationNumberScreen extends StatefulWidget {
  String code, mobile,password;
  Address address;

  VerificationNumberScreen({
    Key? key,
    required this.code,
    required this.mobile,
    required this.password,
    required this.address,
  }) : super(key: key);

  @override
  State<VerificationNumberScreen> createState() =>
      _VerificationNumberScreenState();
}

class _VerificationNumberScreenState extends State<VerificationNumberScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _firstDigitController;
  late TextEditingController _secondDigitController;
  late TextEditingController _thirdDigitController;
  late TextEditingController _fourthDigitController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
    _firstDigitController = TextEditingController()..text = widget.code[0];
    _secondDigitController = TextEditingController()..text = widget.code[1];
    _thirdDigitController = TextEditingController()..text = widget.code[2];
    _fourthDigitController = TextEditingController()..text = widget.code[3];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    _firstDigitController.dispose();
    _secondDigitController.dispose();
    _thirdDigitController.dispose();
    _fourthDigitController.dispose();
    super.dispose();
  }

  void createNewAccountAction() {}

  void _confirmDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const SuccessDialog(
          title: "Verified!!",
          subTitle: "Hurrah!!  You have successfully verified the account",
        );
      },
    ).then((value) =>
        {Navigator.pushReplacementNamed(context, AppScreens.loginScreen)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      body: Padding(
        padding: EdgeInsets.only(
          top: 130.h,
          right: 16.w,
          left: 16.w,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              top: 51.h,
              bottom: 43.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Entry Your 4 digit code",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Container(
                  height: 160.h,
                  width: 240.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset("imags/mail_box.svg"),
                ),
                SizedBox(
                  height: 60.h,
                ),
                VerificationNumberRow(
                  controllers: [
                    _firstDigitController,
                    _secondDigitController,
                    _thirdDigitController,
                    _fourthDigitController
                  ],
                ),
                SizedBox(
                  height: 116.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Did you don’t get code?",
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black45,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: "Resend",
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
                SizedBox(
                  height: 45.h,
                ),
                AppButton(
                  onPressed: () => _verify(),
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  content: "Verify",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verify() async {
    var apiResponse = await AuthApiController().activateAccount(
      mobile: widget.mobile,
      code: widget.code,
    );
    if (apiResponse.status) {
      /*******************************************************/
      // here i made login request to get user token to create default address
      var res = await AuthApiController().login(mobile: widget.mobile, password: widget.password);
      SharedPrefController().save(user: res.model!);
      AddressApiController().createNewAddress(address: widget.address);
      /*******************************************************/
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
