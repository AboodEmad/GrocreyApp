import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/auth_api_controller.dart';
import 'package:grocery_app/get/cart_getx_controller.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/screens/setting/setting_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/setting/setting_row.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primaryLight,
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.primaryLight,
              child: Image.asset("imags/profile.png"),
            ),
            accountName: Text(
              'Abood Emad',
              style: GoogleFonts.nunitoSans(
                fontSize: 18.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              'abood@gmail.com',
              style: GoogleFonts.nunitoSans(
                fontSize: 18.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            otherAccountsPictures: [
              InkWell(
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("imags/profile.png"),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: 25.h,
                horizontal: 20.w,
              ),
              children: [
                SettingRow(
                  text: "Invite Friend",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () {},
                ),
                SettingRow(
                  text: "About Us",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () =>
                      Navigator.pushNamed(context, "/about_us_screen"),
                ),
                SettingRow(
                  text: "FAQs",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () => Navigator.pushNamed(context, "/faqs_screen"),
                ),
                SettingRow(
                  text: "Terms & Conditions",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () => Navigator.pushNamed(
                      context, "/term_and_conditions_screen"),
                ),
                SettingRow(
                  text: "Help Center",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () => Navigator.pushNamed(context, "/help_screen"),
                ),
                SettingRow(
                  text: "Rate This App",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () =>
                      Navigator.pushNamed(context, "/payment_option_screen"),
                ),
                SettingRow(
                  text: "Privacy Policy",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () {},
                ),
                SettingRow(
                  text: "Contact Us",
                  icon: Icons.arrow_forward_ios_outlined,
                  iconColor: AppColors.grey,
                  isIconVisibile: true,
                  onPressed: () => Navigator.pushNamed(context, "/contact_us_screen"),
                ),
                SizedBox(
                  height: 100.h,
                ),
                SettingRow(
                  text: "Logout",
                  icon: Icons.logout,
                  iconSize: 20,
                  iconColor: Colors.red,
                  isIconVisibile: true,
                  onPressed: () => _logout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) async {
    await AuthApiController().logout(token: SharedPrefController().getValueFor(PrefKeys.token.name));
    SharedPrefController().clear();
    CartGetxController.to.clear();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/login_screen");
  }
}
