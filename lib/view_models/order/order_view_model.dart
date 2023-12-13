import 'package:disappear/models/order_all_user_model.dart';
import 'package:disappear/models/order_detail_by_id_model.dart';
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
}
