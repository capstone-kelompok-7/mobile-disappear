import 'package:disappear/screens/notification/empty_notification_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const String routePath = '/notification';

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text('Notifikasi', style: semiBoldBody1.copyWith(color: whiteColor),),
        centerTitle: true,
      ),
      body: const EmptyNotificationScreen(),
    );
  }
}