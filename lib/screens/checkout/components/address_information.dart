import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//INFORMASI PENGIRIMAN KOMPONEN CHECKOUT SCREEN//f

class AddressInfomation extends StatefulWidget {
  const AddressInfomation({super.key});

  @override
  State<AddressInfomation> createState() => _AddressInfomationState();
}

class _AddressInfomationState extends State<AddressInfomation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: neutral00,
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25),
          height: 48,
          width: double.infinity,
          child:const Text(
            'Informasi Pengiriman',
            style: semiBoldBody7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/img/CheckoutPinpoint.svg', width: 17, height: 17,),
                      const SizedBox(width: 10),
                      const Text('Alamat Pengiriman', style: mediumBody8,),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //NAMA ALAMAT
                      Padding(
                        padding: EdgeInsets.only(left: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dimas Bayuwangis',
                              style: mediumBody8,
                            ),
                            SizedBox(height: 5),
                            Text(
                              '0848-7965-7909 | Jln. Merpati Blok B no.12 ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: mediumBody8,
                            ),
                            Text(
                              'MERPATI, KOTA KAYANGAN, KAYANGAN. \nID 45362',
                              style: mediumBody8,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: primary40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
