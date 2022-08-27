import 'dart:ui';

class NotificationModel {
  final String title, subTitle, time, icon;
  final Color color;

  const NotificationModel({
    required this.title,
    required this.subTitle,
    required this.time,
    required this.icon,
    required this.color,
  });
}
