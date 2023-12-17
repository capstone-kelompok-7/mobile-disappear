import 'package:dio/dio.dart';
import 'package:disappear/models/notification_model.dart';
import 'package:disappear/services/api.dart';

class NotificationService {
  final Dio dio = createDio();

  Future<List<NotificationModel>> getNotification() async {
    try {
      Response response = await dio.get('/fcm/users');

      // Check if 'data' is not null and is a List<dynamic>
      if (response.data['data'] != null &&
          response.data['data'] is List<dynamic>) {
        List<dynamic> notification = response.data['data'];
        List<NotificationModel> notifications =
            notification.map<NotificationModel>((data) {
          return NotificationModel.fromJson(data);
        }).toList();

        // Assuming you want to return the first order; modify accordingly if needed
        return notifications;
      } else {
        throw Exception('Unexpected data structure in the API response');
      }
    } catch (error) {
      throw Exception('Failed to fetch orders: $error');
    }
  }
}
