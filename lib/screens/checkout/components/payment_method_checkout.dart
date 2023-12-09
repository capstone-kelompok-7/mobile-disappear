import 'package:disappear/screens/manual_transfer/manual_transfer_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class PaymentMethodCheckout extends StatefulWidget {
  const PaymentMethodCheckout({super.key});

  @override
  State<PaymentMethodCheckout> createState() => _PaymentMethodCheckoutState();
}

class _PaymentMethodCheckoutState extends State<PaymentMethodCheckout> {
  void _goToManualTransferOptionsScreen() {
    Navigator.of(context).pushNamed(ManualTransferScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: neutral00,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          width: double.infinity,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Metode Pembayaran',
                style: semiBoldBody7,
              ),
              Text(
                'Bank BNI',
                style: mediumBody8,
              ),
            ],
          ),
        ),

        //TRANSFER BANK
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {},
            child: const ListTile(
              title: Text(
                'Transfer Bank',
                style: mediumBody7,
              ),
              subtitle: Text(
                'Bank Permata, Bank BCA, Bank BNI, Bank BRI.',
                style: regularBody8,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: primary40,
              ),
            ),
          ),
        ),

        const Divider(
          height: 1,
          thickness: 0.1,
        ),

        //KARTU KREDIT / DEBIT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {},
            child: const ListTile(
              title: Text(
                'Kartu Kredit/Debit',
                style: mediumBody7,
              ),
              subtitle: Text(
                'Bank Mandiri, Bank BCA, Bank BNI, Bank BRI.',
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

        //E-WALLET
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {},
            child: const ListTile(
              title: Text(
                'E-Wallet',
                style: mediumBody7,
              ),
              subtitle: Text(
                'Dana, OVO, LinkAja, ShopeePay, ',
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

        //GERAI RITEL
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {},
            child: const  ListTile(
              title: Text(
                'Gerai Ritel',
                style: mediumBody7,
              ),
              subtitle: Text(
                'Alfamart, Indomaret',
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
