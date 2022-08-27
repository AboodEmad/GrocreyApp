import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, AppScreens.onBoardingScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("imags/logo2.png"),
            SizedBox(
              width: 11.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    text: "e",
                    style: TextStyle(
                      height: 0,
                      fontSize: 42.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.primary,
                    ),
                    children: [
                      TextSpan(
                        text: "Grocery",
                        style: TextStyle(
                          height: 0,
                          fontSize: 42.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "your daily needs",
                  style: TextStyle(
                    height: 0,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
