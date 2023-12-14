import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_payment_method_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EWalletTransferScreen extends StatefulWidget {
  static const String routePath = '/ewalletTransfer';
  const EWalletTransferScreen({super.key});

  @override
  State<EWalletTransferScreen> createState() => _EWalletTransferScreenState();
}

class _EWalletTransferScreenState extends State<EWalletTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios, color: whiteColor)
        ),
        title: Text(
          'E-Money',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 48,
          left: 25,
          right: 25,
          top: 31,
        ),
        child: Column(
          children: [
            /// WhatSapp
            Consumer<CheckoutPaymentMethodViewModel>(
              builder: (context, state, _) {
                return InkWell(
                  onTap: () => state.selectedMethod = 'gopay',
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: neutral10,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/img/logo_gopay.png'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Gopay',
                          style: mediumBody8.copyWith(
                            color: blackColor,
                          ),
                        ),
                        const Spacer(),
                        state.selectedMethod == 'gopay'
                            ? const Icon(Icons.check_rounded)
                            : const Icon(
                                Icons.check_rounded,
                                color: whiteColor,
                              ),
                      ],
                    ),
                  ),
                );
              }
            ),
            const Spacer(),
            Consumer<CheckoutPaymentMethodViewModel>(
              builder: (context, state, _) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(340, 45),
                    ),
                  ),
                  onPressed: () {
                    state.method = state.selectedMethod;
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Konfirmasi',
                    style: mediumBody8,
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
