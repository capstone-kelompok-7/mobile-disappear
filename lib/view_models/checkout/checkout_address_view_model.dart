import 'package:disappear/models/checkout/address/checkout_address_model.dart';
import 'package:disappear/services/checkout_service.dart';
import 'package:flutter/material.dart';

class CheckoutAddressViewModel extends ChangeNotifier {
  CheckoutAddress? _address;

  set address(CheckoutAddress? address) {
    if (_address == address) {
      _address = null;
    } else {
      _address = address;
    }

    notifyListeners();
  }

  CheckoutAddress? get address => _address;

  Future? addressFuture;

  Future<void> getAddress() async {
    final service = CheckoutService();
    final addresses = await service.fetchAddress();

    isLoading = false;

    this.addresses = addresses;

    page = 1;

    setMainAddress();
  }

  void setMainAddress() {
    if (addresses.isNotEmpty && address == null) {
      final mainAddress = addresses.where((element) => element.isPrimary).first;
      address = mainAddress;
    }
  }

  int _page = 1;

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  int get page => _page;

  bool _isLoading = true;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  bool _isAddingMoreAddress = true;

  set isAddingMoreAddress(bool isAddingMoreAddress) {
    _isAddingMoreAddress = isAddingMoreAddress;
    notifyListeners();
  }

  bool get isAddingMoreAddress => _isAddingMoreAddress;

  List<CheckoutAddress> _addresses = [];

  set addresses(List<CheckoutAddress> addresses) {
    _addresses = addresses;
    notifyListeners();
  }

  List<CheckoutAddress> get addresses => _addresses;

  Future<void> addAddress() async {
    page++;
    isAddingMoreAddress = true;

    final service = CheckoutService();
    final newAddresses = await service.fetchAddress(page: page);

    addresses = [...addresses, ...newAddresses];

    isAddingMoreAddress = false;
  }
}