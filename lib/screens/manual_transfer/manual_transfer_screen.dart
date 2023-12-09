import 'package:disappear/screens/manual_transfer/telegram_transfer_screen.dart';
import 'package:disappear/screens/manual_transfer/whatsapp_transfer_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_payment_method_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManualTransferScreen extends StatefulWidget {
  static const String routePath = '/manualTransfer';
  const ManualTransferScreen({super.key});

  @override
  State<ManualTransferScreen> createState() => _ManualTransferScreenState();
}

class _ManualTransferScreenState extends State<ManualTransferScreen> {
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
          'Manual Transfer',
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
                  onTap: () => state.selectedMethod = 'whatsapp',
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
                              image: AssetImage('assets/img/whatsappLogo.png'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'WhatsApp',
                          style: mediumBody8.copyWith(
                            color: blackColor,
                          ),
                        ),
                        const Spacer(),
                        state.selectedMethod == 'whatsapp'
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

            const SizedBox(height: 10,),

            /// Telegram
            Consumer<CheckoutPaymentMethodViewModel>(
              builder: (context, state, _) {
                return InkWell(
                  onTap: () => state.selectedMethod = 'telegram',
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
                          height: 24,
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/img/telegramLogo.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Telegram',
                          style: mediumBody8.copyWith(
                            color: blackColor,
                          ),
                        ),
                        const Spacer(),
                        state.selectedMethod == 'telegram'
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
