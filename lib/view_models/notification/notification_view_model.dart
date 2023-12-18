import 'package:disappear/models/notification_model.dart';
import 'package:disappear/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  Future<List<NotificationModel>> getNotification() async {
    final notificationService = NotificationService();
    return await notificationService.getNotification();
  }
}
