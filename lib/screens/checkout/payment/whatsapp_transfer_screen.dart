import 'package:disappear/helper.dart';
import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/manual_transfer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhatsappTransferScreen extends StatefulWidget {
  static String routePath = '/whatsapp-screen';

  const WhatsappTransferScreen({Key? key}) : super(key: key);

  @override
  State<WhatsappTransferScreen> createState() => _WhatsappTransferScreenState();
}

class _WhatsappTransferScreenState extends State<WhatsappTransferScreen> {
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
                Consumer<ManualTransferViewModel>(
                  builder: (context, state, _) {
                    return Text(
                      formattedPrice(state.createdOrder!.totalAmountPaid),
                      style: semiBoldTitle4.copyWith(color: whiteColor),
                    );
                  }
                ),
                const SizedBox(height: 18),
                Consumer<ManualTransferViewModel>(
                  builder: (context, state, _) {
                    return Text(
                      formattedDate(state.createdOrder?.createdAt, format: 'd-M-yyyy | HH.mm a'),
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
                            'WhatsApp',
                            style: mediumBody6.copyWith(
                              color: blackColor,
                            ),
                          ),
                          Image.asset(
                            'assets/img/whatsappLogo.png',
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
                          Consumer<ManualTransferViewModel>(
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/img/bigwhatsappLogo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Yuk, segera bayar via WhatsApp!',
                      style: semiBoldBody5.copyWith(color: blackColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'Jangan lupa konfirmasi ya. Ga ribet, dan cepat\nselesai. Terima kasih!',
                      textAlign: TextAlign.center,
                      style: regularBody7.copyWith(color: blackColor),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Consumer<ManualTransferViewModel>(
              builder: (context, state, _) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(340, 45)),
                  ),
                  onPressed: state.payWhatsapp,
                  child: const Text(
                    'Konfirmasi Pembayaran',
                    style: mediumBody8,
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
