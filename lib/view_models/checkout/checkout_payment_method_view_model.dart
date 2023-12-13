import 'package:flutter/material.dart';

class CheckoutPaymentMethodViewModel extends ChangeNotifier {
  String? _method;

  set method(String? method) {
    _method = method;
    notifyListeners();
  }

  String? get method => _method;

  String? _selectedMethod;

  set selectedMethod(String? selectedMethod) {
    _selectedMethod = selectedMethod;
    notifyListeners();
  }

  String? get selectedMethod => _selectedMethod;

  String get methodName {
    if (method == 'whatsapp') {
      return 'Whatsapp';
    }

    if (method == 'telegram') {
      return 'Telegram';
    }

    return '-';
  }
}