import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class ReviewItem extends StatelessWidget {
  final String name, comment, img, date;
  final double rate, likes;

  const ReviewItem({
    Key? key,
    required this.name,
    required this.comment,
    required this.img,
    required this.date,
    required this.rate,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 60.h,
                maxWidth: 60.w,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink,
              ),
              child: Image.asset("imags/$img.png"),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  RatingBar.builder(
                    initialRating: rate,
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
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    comment,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "${likes.toString()} Like",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 45.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.reply_all,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Reply",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          color: AppColors.lightGrey,
          thickness: 2,
        ),
      ],
    );
  }
}