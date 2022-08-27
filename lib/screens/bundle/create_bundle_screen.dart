import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/widget/creat_bundle_tab.dart';

class CreateBundleScreen extends StatefulWidget {
  const CreateBundleScreen({Key? key}) : super(key: key);

  @override
  State<CreateBundleScreen> createState() => _CreateBundleScreenState();
}

class _CreateBundleScreenState extends State<CreateBundleScreen>
    with SingleTickerProviderStateMixin {
  List<SelectedProduct> list = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text('Create My Pack'),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: double.infinity.w),
                      contentPadding: EdgeInsetsDirectional.only(start: 20.w),
                      filled: true,
                      focusColor: AppColors.lightGrey,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.black,
                      ),
                      hintText: "Search",
                      hintStyle: GoogleFonts.nunitoSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TabBar(
                    labelStyle: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    unselectedLabelStyle: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    unselectedLabelColor: AppColors.grey,
                    labelColor: AppColors.white,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 12.h,
                    ),
                    isScrollable: true,
                    indicator: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    tabs: const [
                      Text(
                        "Vegetables",
                      ),
                      Text(
                        "Meat & Fish",
                      ),
                      Text(
                        "Medicine",
                      ),
                      Text(
                        "Baby Care",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        CreateBundleTab(),
                        CreateBundleTab(),
                        CreateBundleTab(),
                        CreateBundleTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 20.h,
                    top: 32.h,
                  ),
                  height: 111.h,
                  color: AppColors.primary,
                  child: Row(
                    children: [
                      const SelectedProductItem(),
                      const SelectedProductItem(),
                      const SelectedProductItem(),
                      const SelectedProductItem(),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 26.h),
                        child: Text(
                          "\$35.05",
                          style: GoogleFonts.nunitoSans(
                            color: AppColors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                        ),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, AppScreens.createdBundleDetailsScreen),
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedProductItem extends StatelessWidget {
  const SelectedProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 60.w,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50.h,
              width: 50.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "bottom_icons/carrot.png",
                width: 40,
                height: 20,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 16.h,
              width: 16.w,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                "x1",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontSize: 12.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    var path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(w / 2, 50, w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SelectedProduct {
  String img;
  int count;

  SelectedProduct({
    required this.img,
    this.count = 0,
  });
}
