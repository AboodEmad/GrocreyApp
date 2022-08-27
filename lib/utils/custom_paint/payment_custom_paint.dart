
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class PaymentCustomPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    var paint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    var path = Path()
      ..moveTo(w * 0.6, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h * 0.7)
      ..close();

    canvas.drawPath(path, paint);

    canvas.drawCircle(Offset(w * 0.85, h * 0.85), 20.h, paint..color = Colors.green);
    canvas.drawCircle(Offset(w * 0.8, h * 0.85), 20.h, paint..color = Colors.pink.shade200);
    canvas.drawCircle(Offset(w * 0.8, h * 0.4), 20.h, paint..color = AppColors.primaryLight);


    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(0, h,),
        width: 200,
        height: 180,
      ),
      toRadians(degree: -30),
      toRadians(degree: -360),
      false,
      paint..color = Colors.pink.shade200..style = PaintingStyle.stroke..strokeWidth = 70.w,
    );
    /*
        // var firstStartPoint = Offset(w/4 - w/8, h-60);
    // var firstEndPoint = Offset(w/4 + w/8, h-70);
    //
    // var secondStartPoint = Offset(w/2, h-70);
    // var secondEndPoint = Offset(w/2 + w/8, h-50);
    //
    // var thirdStartPoint = Offset(3 * (w/4)+w/8, h-30);
    // var thirdEndPoint = Offset(w , h-90);
    // var p = Path()
    // ..lineTo(0, h)
    // ..quadraticBezierTo(firstStartPoint.dx, firstStartPoint.dy, firstEndPoint.dx, firstEndPoint.dy)
    // ..quadraticBezierTo(secondStartPoint.dx, secondStartPoint.dy, secondEndPoint.dx, secondEndPoint.dy)
    // ..quadraticBezierTo(thirdStartPoint.dx, thirdStartPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy)
    // ..lineTo(w, 0);
    //
    // canvas.drawPath(p, paint);
     */
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }

  double toRadians({required double degree}) {
    return degree * (pi / 180);
  }

}