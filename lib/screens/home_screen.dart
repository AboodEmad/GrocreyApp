import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/utils/app_colors.dart';
import '../widget/home_section.dart';
import '../widget/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 33.h,
      ),
      children: [
        Container(
          height: 180.h,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.asset(
            "imags/home_top_img.png",
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        HomeSection(
          leading: "Popular Pack",
          onPressed: () =>
              Navigator.pushNamed(context, "/popular_pack_screen"),
        ),
        Row(
          children: [
            Expanded(
              child: ProductItem(
                img: "pack_1",
                title: "Bundle Pack",
                subTitle: "Onion,Oil,Salt...",
                currentPrice: 35,
                oldPrice: 50.32,
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: ProductItem(
                img: "pack_2",
                title: "Bundle Pack",
                subTitle: "Onion,Oil,Salt...",
                currentPrice: 35,
                oldPrice: 50.32,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        HomeSection(
          leading: "Our New Item",
          onPressed: () =>
              Navigator.pushNamed(context, "/new_items_screen"),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 184 / 205,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              img: "pack_3",
              title: "Bundle Pack",
              subTitle: "Onion,Oil,Salt...",
              currentPrice: 35,
            );
          },
        ),
      ],
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
