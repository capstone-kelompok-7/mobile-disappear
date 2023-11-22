import 'package:disappear/screens/manualTransfer/whatsapp_transfer_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ManualTransferScreen extends StatefulWidget {
  static const String routePath = '/manualTransfer';
  const ManualTransferScreen({super.key});

  @override
  State<ManualTransferScreen> createState() => _ManualTransferScreenState();
}

class _ManualTransferScreenState extends State<ManualTransferScreen> {
  bool isSelected1 = false;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          'Manual Transfer',
          style: semiBoldBody1,
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
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected1 = !isSelected1;
                  isSelected2 = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                margin: const EdgeInsets.only(
                  bottom: 10,
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
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'WhatsApp',
                      style: mediumBody8.copyWith(
                        color: blackColor,
                      ),
                    ),
                    const Spacer(),
                    isSelected1
                        ? const Icon(Icons.check_rounded)
                        : const Icon(
                            Icons.check_rounded,
                            color: whiteColor,
                          ),
                  ],
                ),
              ),
            ),

            /// Telegram
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected1 = false;
                  isSelected2 = !isSelected2;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                margin: const EdgeInsets.only(
                  bottom: 10,
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
                    isSelected2
                        ? const Icon(Icons.check_rounded)
                        : const Icon(
                            Icons.check_rounded,
                            color: whiteColor,
                          ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(340, 45),
                ),
              ),
              onPressed: () {
                int selected = isSelected1 ? 1 : (isSelected2 ? 2 : 0);
                if (selected == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WhatsappTransferScreen()),
                  );
                } else if (selected == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const WhatsappTransferScreen()), //Telegram Screen belum dibuat.
                  );
                }
              },
              child: const Text(
                'Konfirmasi',
                style: mediumBody8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
