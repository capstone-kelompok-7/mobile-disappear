import 'dart:io';

import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/gopay_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GopayScreen extends StatefulWidget {
  static String routePath = '/gopayTransfer';

  const GopayScreen({Key? key}) : super(key: key);

  @override
  State<GopayScreen> createState() => _GopayScreenState();
}

class _GopayScreenState extends State<GopayScreen> {
  void _goToApp() async{
    final gopayViewModel = Provider.of<GopayViewModel>(context, listen: false);
    final url = gopayViewModel.createdOrder!.actions
      .where((element) => element.name == 'deeplink-redirect')
      .first
      .url;

    if (Platform.isIOS) {
      await launchUrl(Uri.parse(url));
    } else {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor),
          onPressed: () => Navigator.popUntil(context, ModalRoute.withName(MainScreen.routePath)),
        ),
        title: Text('Detail Pembayaran', style: semiBoldBody1.copyWith(color: whiteColor),),
        centerTitle: true,
      ),
      body: ListView(
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
                  'Total Pembayaran',
                  style: semiBoldBody5.copyWith(
                    color: whiteColor,
                  ),
                ),
                const SizedBox(height: 10),
                Consumer<GopayViewModel>(
                  builder: (context, state, _) {
                    return Text(
                      '${state.createdOrder?.formattedTotalAmountPaid}',
                      style: semiBoldTitle4.copyWith(color: whiteColor),
                    );
                  }
                ),
                const SizedBox(height: 18),
                Consumer<GopayViewModel>(
                  builder: (context, state, _) {
                    return Text(
                      '${state.createdOrder?.formattedCreatedAt}',
                      style: regularBody5.copyWith(
                        color: whiteColor,
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
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
                        'Metode Pembayaran',
                        style: mediumBody5.copyWith(color: blackColor),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gopay',
                            style: mediumBody6.copyWith(
                              color: blackColor,
                            ),
                          ),
                          Image.asset(
                            'assets/img/logo_gopay.png',
                            width: 50,
                            height: 11,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selesaikan Pembayaran Sebelum',
                            style: regularBody7.copyWith(color: blackColor),
                          ),
                          const SizedBox(height: 3),
                          Consumer<GopayViewModel>(
                            builder: (context, state, _) {
                              return Text(
                                '${state.createdOrder?.formattedPayUntil}',
                                style: semiBoldBody7.copyWith(),
                              );
                            }
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Selesaikan Pembayaran dalam 1 j 20 mnt',
                            maxLines: 2,
                            style: regularBody7.copyWith(color: blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: neutral00),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Consumer<GopayViewModel>(
                    builder: (context, state, _) {
                      return Image.network(
                        state.createdOrder!.actions
                          .where((element) => element.name == 'generate-qr-code')
                          .first
                          .url,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                      );
                    }
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(340, 45)),
              ),
              onPressed: _goToApp,
              child: const Text(
                'Lanjutkan ke Aplikasi',
                style: mediumBody8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}