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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          height: 48,
          width: double.infinity,
          child: const Text(
            'Detail Pembayaran',
            style: semiBoldBody7,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total Produk',
                    style: semiBoldBody8,
                  ),
                  Text(
                    'Rp. 120.000',
                    style: regularBody8,
                  )
                ],
              ),
              SizedBox(height: 15),
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
                    'Total Pembayaran',
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
        const Divider(height: 1, thickness: 0.1,),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  height: double.infinity,
                  color: neutral00,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: mediumBody8,
                      ),
                      SizedBox(height: 8),
                      Text('Rp. 142.000', style: semiBoldBody7,)
                    ],
                  )
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary30,
                    shape: const BeveledRectangleBorder()
                  ),
                  child: Text('Buat Pesanan', style: semiBoldBody6.copyWith(color: whiteColor)
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
