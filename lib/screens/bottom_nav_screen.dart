import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/screen_model.dart';
import 'package:grocery_app/screens/bottom_nav/categories_screen.dart';
import 'package:grocery_app/utils/app_screens.dart';
import '../utils/app_colors.dart';
import '../widget/app_drawer.dart';
import '../widget/bottom_nav_item.dart';
import 'bottom_nav/favorite_list_screen.dart';
import 'bottom_nav/home_screen.dart';
import 'bottom_nav/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedScreenIndex = 0;

  List<ScreenModel> screens = [
    ScreenModel(screen: const HomeScreen(), screenName: "Home"),
    ScreenModel(screen: const CategoriesScreen(), screenName: "Categories"),
    ScreenModel(screen: const FavoriteListScreen(), screenName: "Favorites"),
    ScreenModel(screen: const ProfileScreen(), screenName: "Profile"),
  ];

  bool get isExtendBehindAppBar => selectedScreenIndex == 3;

  Widget? get drawer => isExtendBehindAppBar
      ? null
      : const Drawer(
          child: AppDrawer(),
        );

  Widget get search => isExtendBehindAppBar
      ? const SizedBox()
      : IconButton(
          onPressed: () =>
              Navigator.pushNamed(context, AppScreens.searchScreen),
          icon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
        );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      extendBodyBehindAppBar: isExtendBehindAppBar,
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNav(
        list: [
          BottomNavItem(
            onPressed: () {
              setState(() => selectedScreenIndex = 0);
            },
            icon: "home",
            height: 25,
            width: 20,
            isSelected: selectedScreenIndex == 0,
          ),
          BottomNavItem(
            onPressed: () => setState(() => selectedScreenIndex = 1),
            icon: "category",
            height: 22,
            width: 20,
            isSelected: selectedScreenIndex == 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
          ),
          BottomNavItem(
            onPressed: () {
              setState(() => selectedScreenIndex = 2);
            },
            icon: "favorite",
            height: 22,
            width: 20,
            isSelected: selectedScreenIndex == 2,
          ),
          BottomNavItem(
            onPressed: () => setState(() => selectedScreenIndex = 3),
            icon: "profile",
            height: 25,
            width: 22,
            isSelected: selectedScreenIndex == 3,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          screens[selectedScreenIndex].screenName,
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            color: isExtendBehindAppBar ? AppColors.white : AppColors.black,
          ),
        ),
        elevation: 0,
        backgroundColor:
            isExtendBehindAppBar ? AppColors.primary : AppColors.white,
        actions: [search],
      ),
      body: screens[selectedScreenIndex].screen,
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0.4,
      child: Container(
        width: 70.w,
        height: 70.h,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary,
              offset: Offset(5, 0),
              blurRadius: 10,
            ),
            BoxShadow(
              color: AppColors.primary,
              offset: Offset(-5, 0),
              blurRadius: 10,
            ),
            BoxShadow(
              color: AppColors.primary,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.white,
          size: 30,
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final List<Widget> list;

  const BottomNav({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppScreens.cartPageScreen),
            child: const Cart(),
          ),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list,
            ),
          ),
        ],
      ),
    );
  }
}
