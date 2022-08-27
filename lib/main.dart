import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/category_getx_controller.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/screens/address/delivery_address_screen.dart';
import 'package:grocery_app/screens/auth/forgot_password_screen.dart';
import 'package:grocery_app/screens/auth/login2_screen.dart';
import 'package:grocery_app/screens/auth/login_or_register_screen.dart';
import 'package:grocery_app/screens/auth/login_screen.dart';
import 'package:grocery_app/screens/auth/login_with_screen.dart';
import 'package:grocery_app/screens/bundle/created_bundle_details_screen.dart';
import 'package:grocery_app/screens/product/new_products_screen.dart';
import 'package:grocery_app/screens/auth/new_password_screen.dart';
import 'package:grocery_app/screens/auth/register_screen.dart';
import 'package:grocery_app/screens/auth/verification_number_screen.dart';
import 'package:grocery_app/screens/bottom_nav/categories_screen.dart';
import 'package:grocery_app/screens/bottom_nav/favorite_list_screen.dart';
import 'package:grocery_app/screens/bottom_nav/home_screen.dart';
import 'package:grocery_app/screens/bottom_nav/profile_screen.dart';
import 'package:grocery_app/screens/bottom_nav_screen.dart';
import 'package:grocery_app/screens/bundle/create_bundle_screen.dart';
import 'package:grocery_app/screens/bundle/bundle_details_screen.dart';
import 'package:grocery_app/screens/bundle/popular_bundle_screen.dart';
import 'package:grocery_app/screens/cart/cart_page_screen.dart';
import 'package:grocery_app/screens/category/category_products_screen.dart';
import 'package:grocery_app/screens/drawer/about_us_screen.dart';
import 'package:grocery_app/screens/drawer/contact_us_screen.dart';
import 'package:grocery_app/screens/drawer/faqs_screen.dart';
import 'package:grocery_app/screens/drawer/help_screen.dart';
import 'package:grocery_app/screens/drawer/term_and_conditions_screen.dart';
import 'package:grocery_app/screens/lunch_screen.dart';
import 'package:grocery_app/screens/notification/notification_screen.dart';
import 'package:grocery_app/screens/offer_and_promos/offer_and_promos_2_scren.dart';
import 'package:grocery_app/screens/offer_and_promos/offer_and_promos_screen.dart';
import 'package:grocery_app/screens/on_boarding_screen.dart';
import 'package:grocery_app/screens/order/order_details_screen.dart';
import 'package:grocery_app/screens/order/order_list_screen.dart';
import 'package:grocery_app/screens/order/order_state_screen.dart';
import 'package:grocery_app/screens/order/order_tracking_screen.dart';
import 'package:grocery_app/screens/payment/add_new_paymeny_option_screen.dart';
import 'package:grocery_app/screens/payment/checkout_screen.dart';
import 'package:grocery_app/screens/payment/payment_option_screen.dart';
import 'package:grocery_app/screens/product/product_details_screen.dart';
import 'package:grocery_app/screens/reivew/comments_screen.dart';
import 'package:grocery_app/screens/reivew/review_screen.dart';
import 'package:grocery_app/screens/search/search_result_screen.dart';
import 'package:grocery_app/screens/search/search_screen.dart';
import 'package:grocery_app/screens/setting/change_password_screen.dart';
import 'package:grocery_app/screens/setting/change_phone_number_screen.dart';
import 'package:grocery_app/screens/setting/language_setting_screen.dart';
import 'package:grocery_app/screens/setting/notification_settings_screen.dart';
import 'package:grocery_app/screens/setting/profile_settings_screen.dart';
import 'package:grocery_app/screens/setting/setting_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';

import 'database/controllers/db_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();
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
              iconTheme: const IconThemeData(color: Colors.black),
              color: AppColors.white,
              titleTextStyle: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.normal,
                fontSize: 18.sp,
                color: AppColors.black,
              ),
              elevation: 0,
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
          initialRoute: AppScreens.loginScreen,
          routes: {
            AppScreens.lunchScreen : (context) => const LunchScreen(),
            AppScreens.loginOrRegisterScreen: (context) => const LoginOrRegisterScreen(),
            AppScreens.onBoardingScreen: (context) => OnBoardingScreen(),
            AppScreens.loginScreen: (context) => const LoginScreen(),
            AppScreens.login2Screen: (context) => const Login2Screen(),
            AppScreens.loginWithScreen: (context) => const LoginWithScreen(),
            AppScreens.registerScreen: (context) => const RegisterScreen(),
            AppScreens.forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
            AppScreens.homeScreen: (context) => const HomeScreen(),
            AppScreens.newProductsScreen: (context) => const NewProductsScreen(),
            AppScreens.popularBundlesScreen: (context) => const PopularBundlesScreen(),
            AppScreens.bundleDetailsScreen: (context) => const BundleDetailsScreen(),
            AppScreens.createdBundleDetailsScreen: (context) => const CreatedBundleDetailsScreen(),
            AppScreens.cartPageScreen: (context) => const CartPageScreen(),
            AppScreens.favoriteListScreen: (context) => const FavoriteListScreen(),
            AppScreens.checkOutScreen: (context) => CheckoutScreen(cart: []),
            AppScreens.searchScreen: (context) => const SearchScreen(),
            AppScreens.searchResultScreen: (context) => const SearchResultScreen(),
            AppScreens.profileScreen: (context) => const ProfileScreen(),
            AppScreens.profileSettingsScreen: (context) => const ProfileSettingsScreen(),
            AppScreens.notificationSettingsScreen: (context) => const NotificationSettingsScreen(),
            AppScreens.notificationScreen: (context) => const NotificationScreen(),
            AppScreens.categoriesScreen: (context) => const CategoriesScreen(),
            AppScreens.createBundleScreen: (context) => const CreateBundleScreen(),
            AppScreens.orderListScreen: (context) => const OrderListScreen(),
            AppScreens.offerAndPromosScreen: (context) => const OfferAndPromosScreen(),
            AppScreens.offerAndPromos2Screen: (context) => OfferAndPromosScreen2(),
            AppScreens.settingScreen: (context) => const SettingScreen(),
            AppScreens.orderTrackingScreen: (context) => const OrderTrackingScreen(),
            AppScreens.deliveryAddressScreen: (context) => const DeliveryAddressScreen(),
            AppScreens.changePasswordScreen: (context) => const ChangePasswordScreen(),
            AppScreens.changePhoneNumberScreen: (context) => const ChangePhoneNumberScreen(),
            AppScreens.languageSettingScreen: (context) => const LanguageSettingScreen(),
            AppScreens.bottomNavScreen: (context) => const BottomNavScreen(),
            AppScreens.reviewScreen: (context) => const ReviewScreen(),
            AppScreens.commentsScreen: (context) => const CommentsScreen(),
            AppScreens.aboutUsScreen: (context) => const AboutUsScreen(),
            AppScreens.faqScreen: (context) => const FaqsScreen(),
            AppScreens.termAndConditionsScreen: (context) => const TermAndConditionsScreen(),
            AppScreens.helpScreen: (context) => const HelpScreen(),
            AppScreens.paymentOptionScreen: (context) => const PaymentOptionScreen(),
            AppScreens.orderStateScreen: (context) => const OrderStateScreen(),
            AppScreens.contactUsScreen: (context) => const ContactUsScreen(),
          },
        );
      },
    );
  }
}
