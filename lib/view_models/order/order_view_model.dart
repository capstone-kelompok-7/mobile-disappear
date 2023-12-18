import 'package:dio/dio.dart';
import 'package:disappear/models/order_all_user_model.dart';
import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/screens/components/flushbar.dart';
import 'package:disappear/services/order_service.dart';
import 'package:flutter/foundation.dart';

class OrderViewModel extends ChangeNotifier {
  Future<OrderDetailByIdModel>? orderDetailFuture;

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

  bool _isOrderSummaryExpanded = false;

  set isOrderSummaryExpanded(bool isOrderSummaryExpanded) {
    _isOrderSummaryExpanded = isOrderSummaryExpanded;
    notifyListeners();
  }

  bool get isOrderSummaryExpanded => _isOrderSummaryExpanded;

  Future<void> getDetailsOrderById() async {
    final orderDetailService = OrderService();
    orderDetailFuture = orderDetailService.getDetailsOrderById(orderId!);
  }

  Future<void> acceptOrder() async {
    try {
      final acceptOrderService = OrderService();

      await acceptOrderService.acceptOrder(orderId!);

      await getDetailsOrderById();
      
      notifyListeners();

      showSuccessFlushbar(message: 'Pesanan telah diterima', withIcon: true);
    } on DioException catch (e) {
      if ([401, 500].contains(e.response?.statusCode)) {
        showFailedFlushbar(message: e.response!.data['message']);
      } else {
        showFailedFlushbar(message: 'Terjadi kesalahan pada server.');
      }
    }
  }
}
