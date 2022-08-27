import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../../widget/review/review_item.dart';
import '../../widget/review/review_row.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Review"),
      ),
      body: Column(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 25.h),
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height:80.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: Text(
                            "4.5",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 22.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h,),
                        Text(
                          "320 reviews",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14.sp,
                            color: AppColors.black,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 14,
                          itemCount: 5,
                          itemPadding:
                          const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      children: [
                        const ReviewRow(),
                        SizedBox(height: 8.h,),
                        const ReviewRow(),
                        SizedBox(height: 8.h,),
                        const ReviewRow(),
                        SizedBox(height: 8.h,),
                        const ReviewRow(),
                        SizedBox(height: 8.h,),
                        const ReviewRow(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              const Divider(
                color: AppColors.lightGrey,
                thickness: 2,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              itemBuilder: (context, index) {
                return const ReviewItem(
                  name: "Ronti Jordan",
                  comment:
                      "Aliqua officia duis occaecat consectetur fugiat nostrud anim dolor commodo officia proident. Voluptate nisi reprehenderit.",
                  img: "profile",
                  date: "12 Days ago",
                  rate: 5,
                  likes: 24,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




