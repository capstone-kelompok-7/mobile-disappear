// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class TelegramTransferScreen extends StatelessWidget {
  static String routePath = '/telegramTransfer';

  const TelegramTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          "Detail Pesanan",
          style: semiBoldBody5,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 415,
            height: 200,
            decoration: const ShapeDecoration(
              color: primary40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Pembayaran",
                  style: semiBoldBody5.copyWith(
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Rp. 142.000",
                  style: semiBoldTitle4.copyWith(
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "12-05-2023 | 12:00",
                  style: regularBody5.copyWith(
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 0,
              left: 25,
              right: 25,
              top: 20,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 2,
                          offset: Offset(-1, 2),
                          spreadRadius: 0,
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Metode Pembayaran",
                        style: mediumBody5.copyWith(
                          color: blackColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Telegram',
                            style: mediumBody6.copyWith(
                              color: blackColor,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 24,
                            width: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/img/telegramLogo.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selesaikan Pembayaran Sebelum",
                            style: mediumBody6.copyWith(
                              color: blackColor,
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "13.20 PM",
                            style: semiBoldBody6.copyWith(),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "Selesaikan Pembayaran dalam 1 j 20 mnt",
                            style: mediumBody6.copyWith(
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/img/bigtelegramLogo.png",
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  width: 332,
                  height: 73,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Yuk, segera bayar via Telegram',
                        style: semiBoldBody4.copyWith(
                          color: blackColor,
                        ),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: 310,
                        child: Text(
                          'Jangan lupa konfirmasi ya. Ga ribet, dan cepat\nselesai. Terima kasih!',
                          textAlign: TextAlign.center,
                          style: regularBody7.copyWith(
                            color: blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(
                Size(340, 45),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Konfirmasi Pembayaran',
              style: mediumBody8,
            ),
          ),
        ],
      ),
    );
  }
}
