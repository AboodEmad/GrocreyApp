import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/verification_number_widget.dart';
import '../../utils/app_colors.dart';

class VerificationNumberScreen extends StatefulWidget {
  const VerificationNumberScreen({Key? key}) : super(key: key);

  @override
  State<VerificationNumberScreen> createState() =>
      _VerificationNumberScreenState();
}

class _VerificationNumberScreenState extends State<VerificationNumberScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountAction;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void createNewAccountAction() =>
      Navigator.pushNamed(context, "/register_screen");

  void _confirmDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60.h,horizontal: 25.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset("imags/verified_img.svg"),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          "Verified!!",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Text(
                    "Hurrah!!  You have successfully verified the account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunitoSans(
                      height: 0,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  AppButton(
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.white,
                    content: "Browse Home",
                    onPressed: () => Navigator.pop(context),
                  )
                ],
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
                VerificationNumberRow(),
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
                  onPressed: () => _confirmDialog(),
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
}
