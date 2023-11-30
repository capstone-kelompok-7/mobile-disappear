import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransportInformation extends StatefulWidget {
  const TransportInformation({super.key});

  @override
  State<TransportInformation> createState() => _TransportInformationState();
}

class _TransportInformationState extends State<TransportInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: neutral00,
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25),
          height: 48,
          width: double.infinity,
          child: const Text(
            'Jasa Pengiriman',
            style: semiBoldBody7,
          ),
        ),
        
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/choose-transport-screen');
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 38),
            child: Row(
              children: [
                SvgPicture.asset('assets/img/CheckoutCoupon.svg'),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'JNE EXPRESS',
                  style: semiBoldBody8,
                ),
                const SizedBox(
                  width: 155,
                ),
                const Text(
                  '45.000',
                  style: semiBoldBody8,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(37, 116, 90, 1),
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
