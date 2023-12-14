import 'package:dio/dio.dart';
import 'package:disappear/models/address_model.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class AddressService {
  final Dio _dio = createDio();

  Future<List<Address>> getAddresses(int page, int userId) async {
    try {
      final response = await _dio.get('/address?page=$page');
      final List<Address> addresses = (response.data['data'] as List)
          .map((json) => Address.fromJson(json))
          .toList();
      debugPrint('Addresses: $addresses');
      return addresses;
    } catch (error) {
      throw Exception('Failed to get addresses: $error');
    }
  }

  Future<Address> createAddress(Address address) async {
    try {
      final response = await _dio.post('/address', data: address.toJson());
      return Address.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to create address: $error');
    }
  }

  Future<Address> updateAddress(int id, Address updatedAddress) async {
    try {
      final response =
          await _dio.put('/address/$id', data: updatedAddress.toJson());
      return Address.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to update address: $error');
    }
  }

  Future<void> deleteAddress(int id) async {
    try {
      await _dio.delete('/address/$id');
    } catch (error) {
      throw Exception('Failed to delete address: $error');
    }
  }
}
