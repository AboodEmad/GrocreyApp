import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../widget/app_button.dart';
import '../widget/page_view_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late PageController _pageController;
  int _currentPage = 0;

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
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          Container(
            height: 320.h,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
              child: Stack(
                children: [
                  Center(
                    child: PageView(
                      onPageChanged: (index){
                        setState( ()=> _currentPage = index);
                      },
                      controller: _pageController,
                      children: [
                        Image.asset("imags/product_img.png"),
                        Image.asset("imags/product_img.png"),
                        Image.asset("imags/product_img.png"),
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppColors.black,
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
          Text(
            "Weight: 5kg",
            style: GoogleFonts.nunitoSans(
              color: AppColors.black,
              fontSize: 16.sp,
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
            height: 16.h,
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
            height: 12.h,
          ),
          Text(
            "Duis aute veniam veniam qui aliquip irure duis sint magna occaecat dolore nisi culpa do. Est nisi incididunt aliquip  commodo aliqua tempor.",
            style: GoogleFonts.nunitoSans(
              color: AppColors.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            thickness: 2,
            color: AppColors.lightGrey,
          ),
          SizedBox(
            height: 15.h,
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
          const Divider(
            thickness: 2,
            color: AppColors.lightGrey,
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
                  color: AppColors.white,
                  border: Border.all(color: AppColors.borderGrey, width: 1),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.black,
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
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}