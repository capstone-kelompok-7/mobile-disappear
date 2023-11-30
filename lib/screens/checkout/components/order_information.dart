import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//INFORMASI PESANAN KOMPONEN CHECKOUT SCREEN//

class OrderInformation extends StatefulWidget {
  const OrderInformation({super.key});

  @override
  State<OrderInformation> createState() => _OrderInformationState();
}

class _OrderInformationState extends State<OrderInformation> {
  TextEditingController notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            color: neutral00,
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25),
            height: 48,
            width: double.infinity,
            child: const Text(
              'Informasi Pesanan',
              style: semiBoldBody7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 39),
            child: Row(
              children: [
                SizedBox(
                  width: 67,
                  height: 77,
                  child: Image.asset(
                    'assets/img/totebeg_kanvas.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Totebag Kanvas',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: mediumBody6,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '1 Produk | 20 Gram',
                      style: regularBody8,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Rp. 20.000',
                          style: mediumBody6,
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Text(
                          'x 6',
                          style: mediumBody6,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 16.5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: notesController,
              decoration: const InputDecoration(
                fillColor: Colors.transparent,
                hintText: 'Tambah Catatan',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(12),
              ),
              maxLines: null,
            ),
          ),
          const Divider(
            height: 1,
            thickness: 2,
          ),
          
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/use-coupon-screen');
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 39, right: 19, bottom: 15, top: 15),
              child: Row(
                children: [
                  SvgPicture.asset('assets/img/CheckoutCoupon.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Kupon Toko',
                    style: mediumBody7,
                  ),
                  const SizedBox(
                    width: 198,
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
          const Divider(
            thickness: 1,
            height: 1,
          ),
        ],
      ),
    );
  }
}
