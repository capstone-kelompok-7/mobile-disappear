import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class DetailPaymentTotal extends StatelessWidget {
  const DetailPaymentTotal({super.key});

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
            'Detail Pembayaran',
            style: semiBoldBody7,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: semiBoldBody8,
                  ),
                  Text(
                    'Rp. 120.000',
                    style: regularBody8,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Pengiriman ( Kelas Ekonomi )',
                    style: regularBody8,
                  ),
                  Text(
                    'Rp. 45.000',
                    style: regularBody8,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Biaya Admin',
                    style: regularBody8,
                  ),
                  Text(
                    'Rp. 2.000',
                    style: regularBody8,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Voucher',
                    style: regularBody8,
                  ),
                  Text(
                    'Rp. 20.000',
                    style: regularBody8,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Diskon Produk',
                    style: regularBody8,
                  ),
                  Text(
                    'Rp. 5.000',
                    style: regularBody8,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total',
                    style: semiBoldBody8,
                  ),
                  Text(
                    'Rp. 142.000',
                    style: regularBody8,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Dibayar Oleh Pelanggan',
                style: regularBody8,
              ),
              Text(
                'Rp. 142.000',
                style: regularBody8,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 62,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 220,
                height: double.infinity,
                color: neutral00,
                child: const Padding(
                  padding:  EdgeInsets.only(left: 100, top: 7),
                  child: Column(
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: mediumBody8,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Rp. 142.000')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: primary30,
                    height: double.infinity,
                    child: const Center(
                      child: Text('Buat Pesanan'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
