import 'package:dio/dio.dart';
import 'package:disappear/models/cart/cart_model.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class CartService {
  Future<Cart?> fetchCart() async {
    final dio = createDio();

    final Response response = await dio.get('/carts');

    if (response.data['data'] != null && response.data['data']['cart_items'] != null) {
      debugPrint(response.data['data'].toString());
      return Cart.fromMap(response.data['data']);
    }

    return null;
  }

  Future<bool> addCartItemQuantity(int productId) async {
    final dio = createDio();

    final Response response = await dio.post(
      '/carts',
      data: {
        'product_id': productId,
        'quantity': 1
      }
    );
    
    return response.statusCode == 201;
  }

  Future<bool> reduceCartItemQuantity(int cartItemId) async {
    final dio = createDio();

    final Response response = await dio.put(
      '/carts/reduce/quantity',
      data: {
        'cart_item_id': cartItemId,
        'quantity': 1
      }
    );
    
    return response.statusCode == 200;
  }

  Future<bool> removeCartItem(int cartItemId) async {
    final dio = createDio();

    final Response response = await dio.delete('/carts/cart-items/$cartItemId');
    
    return response.statusCode == 200;
  }
}