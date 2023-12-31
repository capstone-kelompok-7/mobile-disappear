import 'package:disappear/screens/checkout/payment_method/ewallet_transfer_screen.dart';
import 'package:disappear/screens/checkout/payment_method/manual_transfer_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_payment_method_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodCheckout extends StatefulWidget {
  const PaymentMethodCheckout({super.key});

  @override
  State<PaymentMethodCheckout> createState() => _PaymentMethodCheckoutState();
}

class _PaymentMethodCheckoutState extends State<PaymentMethodCheckout> {
  void _goToManualTransferOptionsScreen() {
    Navigator.of(context).pushNamed(ManualTransferScreen.routePath);
  }

  void _goToEWalletOptionsScreen() {
    Navigator.of(context).pushNamed(EWalletTransferScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: neutral00,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Metode Pembayaran',
                style: semiBoldBody7,
              ),
              Consumer<CheckoutPaymentMethodViewModel>(
                builder: (context, state, _) {
                  return Text(
                    state.methodName,
                    style: mediumBody8,
                  );
                }
              ),
            ],
          ),
        ),

        //E-WALLET
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: _goToEWalletOptionsScreen,
            child: const ListTile(
              title: Text(
                'E-Wallet',
                style: mediumBody7,
              ),
              subtitle: Text(
                'Gopay',
                style: regularBody8,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: Color.fromRGBO(37, 116, 90, 1),
              ),
            ),
          ),
        ),

        const Divider(
          height: 1,
          thickness: 0.1,
        ),

        //MANUAL TRANSFER
        GestureDetector(
          onTap: _goToManualTransferOptionsScreen,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: Text(
                'Manual Transfer',
                style: mediumBody7,
              ),
              subtitle: Text(
                'WhatsApp, Telegram',
                style: regularBody8,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: Color.fromRGBO(37, 116, 90, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
