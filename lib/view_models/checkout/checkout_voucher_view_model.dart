import 'package:disappear/models/checkout/voucher/checkout_voucher_model.dart';
import 'package:disappear/services/checkout_service.dart';
import 'package:flutter/material.dart';

class CheckoutVoucherViewModel extends ChangeNotifier {
  Future<List<CheckoutVoucher>>? voucherFuture;

  CheckoutVoucher? _voucher;

  set voucher(CheckoutVoucher? voucher) {
    _voucher = voucher;
    notifyListeners();
  }

  CheckoutVoucher? get voucher => _voucher;

  CheckoutVoucher? _selectedVoucher;

  set selectedVoucher(CheckoutVoucher? voucher) {
    if (_selectedVoucher == voucher) {
      _selectedVoucher = null;
    } else {
      _selectedVoucher = voucher;
    }
    
    notifyListeners();
  }

  CheckoutVoucher? get selectedVoucher => _selectedVoucher;

  Future<List<CheckoutVoucher>> getVoucher() async {
    final service = CheckoutService();
    return await service.fetchVoucher();
  }
}