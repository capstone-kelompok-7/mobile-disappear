import 'package:flutter/material.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';

class CompletedTab extends StatelessWidget {
  final String title;

  const CompletedTab({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: [
            CompletedCard(onTap: () {}),
            const SizedBox(height: 15),
            CompletedCard(onTap: () {}),
            const SizedBox(height: 15),
            CompletedCard(onTap: () {}),
            const SizedBox(height: 15),
            CompletedCard(onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class CompletedCard extends StatelessWidget {
  final VoidCallback? onTap;
  const CompletedCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 370,
        height: 212,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: success00,
                ),
                child: Text(
                  'Selesai',
                  style: regularBody3.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 68,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Image.asset(
                      'assets/img/ProductToteBag.png',
                      width: 68,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Totebag Kanvas',
                          style: mediumBody2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          '1 Produk | 20 Gram',
                          style: regularBody3.copyWith(
                              fontSize: 12,
                              color: neutral30,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp. 120.000',
                              style: boldBody2.copyWith(
                                fontSize: 13,
                                color: neutral40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(
                                'x1',
                                style: mediumBody3.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tampilkan produk lagi',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '1 Produk',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Total produk : ',
                              style: TextStyle(fontSize: 13),
                            ),
                            TextSpan(
                              text: 'Rp 30.000',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.directions_car,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'Pesanan telah sampai dan diterima oleh yang bersangkutan',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: regularBody4.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Container(
                        width: 500,
                        height: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nilai produk sebelum 05-11-2023',
                            style: regularBody4.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
