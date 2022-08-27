import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widget/notification_item.dart';

import '../../model/notification_model.dart';
import '../../utils/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  final List<NotificationModel> list = const [
    NotificationModel(
      title: "Gifts Offer",
      subTitle: "Hot Deal Buy one get free one Offer Hery...",
      time: "Now",
      icon: "gift",
      color: AppColors.gradientBlue,
    ),
    NotificationModel(
      title: "Gifts Offer",
      subTitle: "Hot Deal Buy one get free one Offer Hery...",
      time: "Now",
      icon: "gift",
      color: AppColors.gradientBlue,
    ),
    NotificationModel(
      title: "Gifts Offer",
      subTitle: "Hot Deal Buy one get free one Offer Hery...",
      time: "Now",
      icon: "gift",
      color: AppColors.gradientBlue,
    ),
    NotificationModel(
      title: "Gifts Offer",
      subTitle: "Hot Deal Buy one get free one Offer Hery...",
      time: "Now",
      icon: "gift",
      color: AppColors.gradientBlue,
    ),
    NotificationModel(
      title: "Gifts Offer",
      subTitle: "Hot Deal Buy one get free one Offer Hery...",
      time: "Now",
      icon: "gift",
      color: AppColors.gradientBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        itemBuilder: (context, index) {
          NotificationModel model = list.elementAt(index);
          return NotificationItem(
            color: model.color,
            icon: model.icon,
            title: model.title,
            subTitle: model.subTitle,
            time: model.time,
          );
        },
      ),
    );
  }
}
