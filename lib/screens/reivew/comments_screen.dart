import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widget/dialog/success_dialog.dart';
import 'package:grocery_app/widget/app_button.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController()
      ..text =
          "Irure velit sunt cupidatat nulla exercitation Lorem sint in ut eiusmod nisi. Fugiat sint elit do irure ex ex magna enim enim labore ad mollit adipisicing veniam. ";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  void _confirmDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const SuccessDialog(
          title: "Congratulatios!",
          subTitle: "Hurrah!!  we just deliverred your #15425050 order successfully.",
          img: "congrates",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Submit Review",
          style: GoogleFonts.nunitoSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 16.w,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            color: AppColors.white,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            children: [
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 100.h,
                    maxWidth: 100.w,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.pink,
                  ),
                  child: Image.asset("imags/profile.png"),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Saydulmonn",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Text(
                "How would you rate the quality of this Products",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.nunitoSans(
                  fontSize: 20.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemSize: 30,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Text(
                "Leave a your valuable comments",
                textAlign: TextAlign.start,
                style: GoogleFonts.nunitoSans(
                  fontSize: 20.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              TextField(
                controller: textEditingController,
                minLines: 1,
                maxLines: 7,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                ),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        const BorderSide(color: AppColors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        const BorderSide(color: AppColors.grey, width: 1),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              AppButton(
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                content: "Submit",
                onPressed: () => _confirmDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
