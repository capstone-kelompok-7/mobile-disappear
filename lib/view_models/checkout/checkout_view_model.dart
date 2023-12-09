import 'package:disappear/models/product/product_model.dart';
import 'package:flutter/material.dart';

class CheckoutViewModel extends ChangeNotifier {
  String purchaseType = 'buy-now';

  Product? product;

  TextEditingController notesController = TextEditingController();
}