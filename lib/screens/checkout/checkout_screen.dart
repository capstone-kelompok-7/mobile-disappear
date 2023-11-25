import 'package:disappear/screens/checkout/components/address_information.dart';
import 'package:disappear/screens/checkout/components/detail_payment_total.dart';
import 'package:disappear/screens/checkout/components/order_information.dart';
import 'package:disappear/screens/checkout/components/payment_method_checkout.dart';
import 'package:disappear/screens/checkout/components/transport_information.dart';
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
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          AddressInfomation(),
          OrderInformation(),
          TransportInformation(),
          PaymentMethodCheckout(),
          DetailPaymentTotal(),
        ],
      ),
    );
  }
  
}
