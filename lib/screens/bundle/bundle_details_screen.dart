import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/widget/app_button.dart';

import '../../widget/page_view_indicator.dart';

class BundleDetailsScreen extends StatefulWidget {
  const BundleDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BundleDetailsScreen> createState() => _BundleDetailsScreenState();
}

class _BundleDetailsScreenState extends State<BundleDetailsScreen> {
  late PageController _pageController;
  int _currentPage = 0;


  bool isFav = false;
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bundle Details"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          Container(
            height: 320.h,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Stack(
                children: [
                  Center(
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      controller: _pageController,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, AppScreens.bundleDetailsScreen),
                          child: Image.asset("imags/pag_view_pack_1.png"),
                        ),
                        GestureDetector(
                          child: Image.asset("imags/pag_view_pack_1.png"),
                        ),
                        GestureDetector(
                          child: Image.asset("imags/pag_view_pack_1.png"),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => setState(() => isFav = !isFav),
                        icon: Icon(
                          Icons.favorite,
                          color: isFav ? AppColors.red : AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PageViewIndicator(
                          isCurrentPage: _currentPage == 0,
                          marginEnd: 10.w,
                        ),
                        PageViewIndicator(
                          isCurrentPage: _currentPage == 1,
                          marginEnd: 10.w,
                        ),
                        PageViewIndicator(
                          isCurrentPage: _currentPage == 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Bundle Pack",
            style: GoogleFonts.nunitoSans(
              color: AppColors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            children: [
              Text(
                "\$30",
                style: GoogleFonts.nunitoSans(
                  fontSize: 18.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "\$20",
                style: GoogleFonts.nunitoSans(
                  fontSize: 28.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    alignment: Alignment.topCenter,
                    icon: SvgPicture.asset("imags/plus.svg"),
                  ),
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                "2",
                style: GoogleFonts.nunitoSans(
                  fontSize: 20.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    alignment: Alignment.topCenter,
                    icon: SvgPicture.asset("imags/minus.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "25 Kg",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Weight",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Medum",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Size",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "17",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Item’s",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          Text(
            "Pack Details",
            style: GoogleFonts.nunitoSans(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 264.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 19.h),
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset("imags/tomato.png"),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Cabbage",
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "2 Kg",
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Text(
                "Review",
                style: GoogleFonts.nunitoSans(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                itemSize: 25,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          SizedBox(
            height: 11.h,
          ),
          Divider(
            height: 2.h,
            color: AppColors.grey,
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: isAddedToCart ? AppColors.gradientBlue :AppColors.white,
                  border: Border.all(
                    color: isAddedToCart ? AppColors.gradientBlue :AppColors.borderGrey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () =>
                      setState(() => isAddedToCart = !isAddedToCart),
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: isAddedToCart ? AppColors.white : AppColors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: AppButton(
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  content: "Buy Now",
                  onPressed: () =>
                      Navigator.pushNamed(context, AppScreens.checkOutScreen),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
