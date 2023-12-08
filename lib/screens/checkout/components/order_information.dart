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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            itemBuilder: (context, index) => const OrderItem(),
            separatorBuilder: (context, index) => const SizedBox(height: 20,),
            itemCount: 3,
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/use-coupon-screen');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: const BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(width: 1, color: neutral00))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/img/CheckoutCoupon.svg'),
                      const SizedBox(width: 10),
                      const Text(
                        'Kupon Toko',
                        style: mediumBody7,
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: primary40,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(
                'assets/img/totebeg_kanvas.png',
                fit: BoxFit.cover,
                width: 68,
                height: 78,
              ),
            ),
            const SizedBox(width: 10,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Totebag Kanvas',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: mediumBody6,
                ),
                SizedBox(height: 6),
                Text('20 Gram', style: regularBody8),
                SizedBox(height: 5),
                Text('Rp. 20.000', style: mediumBody6)
              ],
            ),
          ],
        ),
        const Text('x 6', style: mediumBody6)
      ],
    );
  }
}