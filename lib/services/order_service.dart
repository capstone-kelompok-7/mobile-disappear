import 'package:dio/dio.dart';
import 'package:disappear/models/order_all_user_model.dart';
import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/services/api.dart';

class OrderService {
  final dio = createDio();

  Future<List<OrderAllUserModel>> getAllOrderUser(String orderStatus) async {
    try {
      Response response =
          await dio.get('/order/by-users?order_status=$orderStatus');

      // Check if 'data' is not null and is a List<dynamic>
      if (response.data['data'] != null &&
          response.data['data'] is List<dynamic>) {
        List<dynamic> orderData = response.data['data'];
        List<OrderAllUserModel> orders =
            orderData.map<OrderAllUserModel>((data) {
          return OrderAllUserModel.fromJson(data);
        }).toList();

        // Assuming you want to return the first order; modify accordingly if needed
        return orders;
      } else {
        throw Exception('Unexpected data structure in the API response');
      }
    } catch (error) {
      throw Exception('Failed to fetch orders: $error');
    }
  }

  Future<OrderDetailByIdModel> getDetailsOrderById(String id) async {
    try {
      Response response = await dio.get('/order/$id');

      // Assuming you want to return the first order; modify accordingly if needed
      return OrderDetailByIdModel.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to fetch orders: $error');
    }
  }
}
