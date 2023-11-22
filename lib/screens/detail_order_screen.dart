import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailOrderScreen extends StatelessWidget {
  static const String routePath = '/detail-order';

  const DetailOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Rincian Pesanan', style: semiBoldBody1,),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const OrderStatus(),
          const Address(),
          const Products(),
          const OrderSummary(),
          const PaymentMethod(),
          const OrderNumber(),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                minimumSize: const Size(double.infinity, 45)
              ),
              child: const Text('Pesanan Diterima', style: semiBoldBody7,)
            ),
          )
        ],
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: secondary00,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pesanan Sedang Dikirim', style: semiBoldBody5,),
              Text('Pesanan akan dijadwalkan paling lambat 03-11-2023', style: regularBody8,)
            ],
          ),
          SvgPicture.asset('assets/img/OrderSendingIcon.svg')
        ],
      ),
    );
  }
}

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Color(0xffAFAFAF)),
          bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
        )
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.location_on_outlined, size: 17,),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alamat Pengiriman', style: mediumBody7,),
              SizedBox(height: 3,),
              Text('Dimas Banyuwangi', style: regularBody8,),
              Text('(+62) 848-7965-7909', style: regularBody8,),
              Text('Jl. Merak X BLK F8 No. 29', style: regularBody8,),
              Text('KAB. BANDUNG, JAWA BARAT, 40111', style: regularBody8,),
            ],
          )
        ],
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
          bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
        )
      ),
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 20,),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network('https://picsum.photos/68/48', width: 68, height: 48),
                  const SizedBox(width: 15,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Totebag Kanvas', style: mediumBody7,),
                      SizedBox(height: 3,),
                      Text('1 produk | 20 gram', style: regularBody8,),
                      SizedBox(height: 5,),
                      Text('Rp. 120.000', style: boldBody7,),
                    ],
                  )
                ],
              ),
              Text('x1', style: semiBoldBody8.copyWith(color: neutral20),)
            ],
          );
        },
      )
    );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
          bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
        )
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Pesanan', style: mediumBody7,),
              Row(
                children: [
                  Text('Rp 30.000', style: mediumBody7,),
                  Icon(Icons.keyboard_arrow_up,),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
              )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal Produk', style: mediumBody8.copyWith(color: neutral20),),
                    Text('Rp 20.000', style: mediumBody8.copyWith(color: neutral20),),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Diskon', style: mediumBody8.copyWith(color: neutral20),),
                    Text('Rp 0', style: mediumBody8.copyWith(color: neutral20),),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biaya Layanan', style: mediumBody8.copyWith(color: neutral20),),
                    Text('Rp 1.000', style: mediumBody8.copyWith(color: neutral20),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
          bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Metode Pembayaran', style: mediumBody7,),
          const SizedBox(height: 5,),
          Text('DANA', style: mediumBody8.copyWith(color: neutral20),),
        ],
      ),
    );
  }
}

class OrderNumber extends StatelessWidget {
  const OrderNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
          bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('No. Pesanan', style: mediumBody7,),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Waktu Pemesanan', style: mediumBody8.copyWith(color: neutral20),),
              Text('30-10-2023 12:30', style: mediumBody8.copyWith(color: neutral20),),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Waktu Pembayaran', style: mediumBody8.copyWith(color: neutral20),),
              Text('30-10-2023 12:30', style: mediumBody8.copyWith(color: neutral20),),
            ],
          ),
        ],
      ),
    );
  }
}