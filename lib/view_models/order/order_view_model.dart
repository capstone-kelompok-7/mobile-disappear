import 'package:dio/dio.dart';
import 'package:disappear/models/order_all_user_model.dart';
import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/screens/components/flushbar.dart';
import 'package:disappear/services/order_service.dart';
import 'package:flutter/foundation.dart';

class OrderViewModel extends ChangeNotifier {
  String? _orderStatus;

  set orderStatus(String? orderStatus) {
    _orderStatus = orderStatus;
  }

  String? get orderStatus => _orderStatus;

  Future<List<OrderAllUserModel?>> getAllOrderUser() async {
    final orderService = OrderService();

    return await orderService.getAllOrderUser(orderStatus!);
  }

  String? _orderId;

  set orderId(String? orderId) {
    _orderId = orderId;
  }

  String? get orderId => _orderId;

  Future<OrderDetailByIdModel> getDetailsOrderById() async {
    final orderDetailService = OrderService();
    return await orderDetailService.getDetailsOrderById(orderId!);
  }

  Future<void> acceptOrder() async {
    try {
      final acceptOrderService = OrderService();

      await acceptOrderService.acceptOrder(orderId!);
      showSuccessFlushbar(message: 'Pesanan telah diterima');
    } on DioException catch (e) {
      if ([401, 500].contains(e.response?.statusCode)) {
        showFailedFlushbar(message: e.response!.data['message']);
      } else {
        showFailedFlushbar(message: 'Terjadi kesalahan pada server.');
      }
    }
  }
}
