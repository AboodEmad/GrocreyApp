import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/auth/forgot_password_screen.dart';
import 'package:grocery_app/screens/auth/login_or_register_screen.dart';
import 'package:grocery_app/screens/auth/login_screen.dart';
import 'package:grocery_app/screens/auth/login_with_Screen.dart';
import 'package:grocery_app/screens/auth/new_items_screen.dart';
import 'package:grocery_app/screens/auth/new_password_screen.dart';
import 'package:grocery_app/screens/auth/register_screen.dart';
import 'package:grocery_app/screens/auth/verification_number_screen.dart';
import 'package:grocery_app/screens/bottom_nav_screen.dart';
import 'package:grocery_app/screens/bundel_details_screen.dart';
import 'package:grocery_app/screens/bundle_details_page_screen.dart';
import 'package:grocery_app/screens/cart_page_screen.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/category_screen.dart';
import 'package:grocery_app/screens/change_password_screen.dart';
import 'package:grocery_app/screens/change_phone_number_screen.dart';
import 'package:grocery_app/screens/checkout_screen.dart';
import 'package:grocery_app/screens/create_pack_screen.dart';
import 'package:grocery_app/screens/delivery_address_screen.dart';
import 'package:grocery_app/screens/empty_cart_screen.dart';
import 'package:grocery_app/screens/favorite_list_screen.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/language_setting_screen.dart';
import 'package:grocery_app/screens/new_addres_screen.dart';
import 'package:grocery_app/screens/notification_screen.dart';
import 'package:grocery_app/screens/notification_settings_screen.dart';
import 'package:grocery_app/screens/offer_and_promos_2_scren.dart';
import 'package:grocery_app/screens/offer_and_promos_screen.dart';
import 'package:grocery_app/screens/on_boarding_screen.dart';
import 'package:grocery_app/screens/order_details_screen.dart';
import 'package:grocery_app/screens/order_list_screen.dart';
import 'package:grocery_app/screens/order_tracking_screen.dart';
import 'package:grocery_app/screens/popular_pack_screen.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/screens/profile_screen.dart';
import 'package:grocery_app/screens/search_result_screen.dart';
import 'package:grocery_app/screens/search_screen.dart';
import 'package:grocery_app/screens/setting_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';

import 'screens/lunch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData(color: Colors.grey),
              color: AppColors.white,
              titleTextStyle: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.normal,
                fontSize: 18.sp,
                color: AppColors.black,
              ),
              elevation: 1,
              centerTitle: true,
            ),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en"),
            Locale("ar"),
          ],
          locale: const Locale("en"),
          initialRoute: "/bottom_nav_screen",
          routes: {
            "/lunch_screen": (context) => const LunchScreen(),
            "/login_or_register_screen": (context) =>
                const LoginOrRegisterScreen(),
            "/on_boarding_screen": (context) => OnBoardingScreen(),
            "/login_screen": (context) => const LoginScreen(),
            "/login_with_screen": (context) => const LoginWithScreen(),
            "/register_screen": (context) => const RegisterScreen(),
            "/verification_number_screen": (context) =>
                const VerificationNumberScreen(),
            "/forgot_password_screen": (context) =>
                const ForgotPasswordScreen(),
            "/new_password_screen": (context) => const NewPasswordScreen(),
            "/home_screen": (context) => const HomeScreen(),
            "/new_items_screen": (context) => const NewItemsScreen(),
            "/popular_pack_screen": (context) => const PopularIPackScreen(),
            "/bundle_details_screen": (context) => const BundleDetailsScreen(),
            "/product_details_screen": (context) =>
                const ProductDetailsScreen(),
            "/bundle_details_page_screen": (context) =>
                BundleDetailsPageScreen(),
            "/cart_page_screen": (context) => const CartPageScreen(),
            "/favorite_list_screen": (context) => const FavoriteListScreen(),
            "/checkout_screen": (context) => const CheckoutScreen(),
            "/search_screen": (context) => const SearchScreen(),
            "/search_result_screen": (context) => const SearchResultScreen(),
            "/empty_cart_screen": (context) => const EmptyCartScreen(),
            "/profile_screen": (context) => const ProfileScreen(),
            "/notification_settings_screen": (context) =>
                const NotificationSettingsScreen(),
            "/notification_screen": (context) => NotificationScreen(),
            "/categories_screen": (context) => const CategoriesScreen(),
            "/category_screen": (context) => const CategoryScreen(),
            "/create_pack_screen": (context) => const CreatePackScreen(),
            "/order_list_screen": (context) => OrderListScreen(),
            "/offer_and_promotes_screen": (context) =>
                const OfferAndPromosScreen(),
            "/offer_and_promotes_screen2": (context) =>
                const OfferAndPromosScreen2(),
            "/settings_screen": (context) => const SettingScreen(),
            "/order_tracking_screen": (context) => const OrderTrackingScreen(),
            "/delivery_address_screen": (context) =>
                const DeliveryAddressScreen(),
            "/new_address_screen": (context) => const NewAddressScreen(),
            "/change_password_screen": (context) =>
                const ChangePasswordScreen(),
            "/change_phone_number_screen": (context) =>
                const ChangePhoneNumberScreen(),
            "/language_setting_screen": (context) =>
                const LanguageSettingScreen(),
            "/order_details_screen": (context) => OrderDetailsScreen(),
            "/bottom_nav_screen": (context) => BottomNavScreen(),
          },
        );
      },
    );
  }
}
