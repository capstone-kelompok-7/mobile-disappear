import 'package:dio/dio.dart';
import 'package:disappear/models/cart/cart_model.dart';
import 'package:disappear/models/checkout/address/checkout_address_model.dart';
import 'package:disappear/models/checkout/created_order_gopay_model.dart';
import 'package:disappear/models/checkout/created_order_model.dart';
import 'package:disappear/models/checkout/voucher/checkout_voucher_model.dart';
import 'package:disappear/services/api.dart';

class CheckoutService {
  Future<List<CheckoutVoucher>> fetchVoucher() async {
    final dio = createDio();

    final Response response = await dio.get('/vouchers/users');

    if (response.data['data'] != null) {
      return response.data['data']
        .map<CheckoutVoucher>((data) => CheckoutVoucher.fromMap(data))
        .toList();
    }

    return [];
  }

  Future<List<CheckoutAddress>> fetchAddress({ int page = 1 }) async {
    final dio = createDio();

    final Response response = await dio.get('/address?page=$page');

    if (response.data['data'] != null) {
      return response.data['data']
        .map<CheckoutAddress>((data) => CheckoutAddress.fromMap(data))
        .toList();
    }

    return [];
  }

  Future<dynamic> createOrder({
    required int productId,
    required int addressId,
    required String note,
    required String paymentMethod,
    int? voucherId,
  }) async {
    final dio = createDio();

    final data = {
      'product_id': productId,
      'address_id': addressId,
      'voucher_id': voucherId,
      'note': note,
      'payment_method': paymentMethod,
      'shipment_fee': 0,
      'quantity': 1,
    };
    final Response response = await dio.post('/order', data: data);
    
    if (['whatsapp', 'telegram'].contains(paymentMethod)) {
      return CreatedOrder.fromMap(response.data['data']);
    }
    
    if (paymentMethod == 'gopay') {
      return CreatedGopayOrder.fromMap(response.data['data']);
    }

    return null;
  }

  Future<dynamic> createOrderByCart({
    required List<CartItem> cartItems,
    required int addressId,
    required String note,
    required String paymentMethod,
    int? voucherId,
  }) async {
    final dio = createDio();

    final data = {
      'cart_items': cartItems.map((e) => {'id': e.cartItemId}).toList(),
      'address_id': addressId,
      'voucher_id': voucherId,
      'note': note,
      'payment_method': paymentMethod,
      'shipment_fee': 0,
    };
    final Response response = await dio.post('/order/carts', data: data);
    
    if (['whatsapp', 'telegram'].contains(paymentMethod)) {
      return CreatedOrder.fromMap(response.data['data']);
    }
    
    if (paymentMethod == 'gopay') {
      return CreatedGopayOrder.fromMap(response.data['data']);
    }

    return null;
  }
}