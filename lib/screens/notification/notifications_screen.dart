import 'package:disappear/screens/notification/components/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      itemCount: 20,
      separatorBuilder: (context, index) => const SizedBox(height: 14,),
      itemBuilder: (context, index) => const NotificationItem(),
    );
  }
}