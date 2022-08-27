import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/ScreenModel.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/favorite_list_screen.dart';
import 'package:grocery_app/screens/profile_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/bottom_nav_item.dart';

import 'home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isExtendBehindAppBar ? null : Drawer(),
      extendBodyBehindAppBar: isExtendBehindAppBar,
      backgroundColor: AppColors.white,
      bottomNavigationBar: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 70),
            painter: CustomBottomNav(),
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
              heightFactor: 0.5,
              child: Container(
                width: 70.w,
                height: 70.h,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primary,
                        offset: Offset(0, 1),
                        blurRadius: 1)
                  ],
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomNavItem(
                  onPressed: () => setState(() => selectedScreenIndex = 0),
                  icon: "home",
                  height: 25,
                  width: 20,
                  isSelected: selectedScreenIndex == 0,
                ),
                BottomNavItem(
                  onPressed: () => setState(() => selectedScreenIndex = 1),
                  icon: "menu",
                  height: 22,
                  width: 20,
                  isSelected: selectedScreenIndex == 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                BottomNavItem(
                  onPressed: () => setState(() => selectedScreenIndex = 2),
                  icon: "fav",
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
      ),
      body: screens[selectedScreenIndex].screen,
    );
  }
}

class CustomBottomNav extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.lightGrey
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 5);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
