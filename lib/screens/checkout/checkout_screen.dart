import 'package:disappear/screens/checkout/components/address_information.dart';
import 'package:disappear/screens/checkout/components/detail_payment_total.dart';
import 'package:disappear/screens/checkout/components/order_information.dart';
import 'package:disappear/screens/checkout/components/payment_method_checkout.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routePath = '/checkout-screen';
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Checkout', style: semiBoldBody1.copyWith(color: whiteColor),),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          AddressInfomation(),
          OrderInformation(),
          PaymentMethodCheckout(),
          DetailPaymentTotal(),
        ],
      ),
    );
  }
  
}
