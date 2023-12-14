import 'package:disappear/models/address_model.dart';
import 'package:disappear/services/address_service.dart';
import 'package:flutter/material.dart';

class AddressViewModel extends ChangeNotifier {
  final AddressService _addressService = AddressService();
  List<Address> _addresses = [];
  final int _userId = 0;
  int addressId = 0;
  bool isMainAddress = true;
  List<Address> get addresses => _addresses;

  Future<void> getAddresses(int page) async {
    try {
      final addresses = await _addressService.getAddresses(_userId, page);
      _addresses = addresses;
      notifyListeners();
    } catch (error) {
      debugPrint('Error getting addresses: $error');
    }
  }

  Future<void> createAddress(Address address) async {
    try {
      // ignore: unnecessary_null_comparison
      if (_userId != null) {
        address = address.copyWith(userId: _userId);
        final newAddress = await _addressService.createAddress(address);
        _addresses.add(newAddress);
        notifyListeners();
      } else {
        debugPrint('Error: _userId is null');
      }
    } catch (error) {
      debugPrint('Error creating address: $error');
    }
  }

  Future<Address> updateAddress(Address address) async {
    try {
      final updatedAddress =
          await _addressService.updateAddress(addressId, address);
      return updatedAddress;
    } catch (error) {
      debugPrint('Error: $error');
      rethrow;
    }
  }

  Future<void> deleteAddress() async {
    try {
      await _addressService.deleteAddress(addressId);
      _addresses.removeWhere((address) => address.id == addressId);
      notifyListeners();
    } catch (error) {
      debugPrint('Error: $error');
    }
  }
}
