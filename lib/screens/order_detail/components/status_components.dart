// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';

class OrderStatus extends StatefulWidget {
  final OrderDetailByIdModel orderDetail;
  const OrderStatus({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: secondary00,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.orderDetail.orderStatus,
                style: semiBoldBody5,
              ),
              Builder(
                builder: (context) {
                  if (widget.orderDetail.orderStatus == 'Menunggu Konfirmasi') {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        'Penjual sedang memeriksa bukti pembayaran apakah valid atau tidak. Setelah itu penjual baru mengkonfirmasi pembayaran.',
                        style: regularBody8,
                        textAlign: TextAlign.justify,
                      ),
                    );
                  } else if (widget.orderDetail.orderStatus == 'Proses') {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Produk sedang dikemas oleh penjual. Penjual harus mengirimkan sebelum ${widget.orderDetail.statusOrderDate.add(
                          const Duration(days: 2),
                        )} atau pesanan akan dibatalkan otomatis dalam 2 hari setelah lewat dari tanggal yang ditentukan',
                        style: regularBody8,
                        textAlign: TextAlign.justify,
                      ),
                    );
                  } else if (widget.orderDetail.orderStatus == 'Pengiriman') {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: const BoxDecoration(),
                      child: Text(
                        'Pesanan akan dijadwalkan paling lambat ${widget.orderDetail.formattedDate}',
                        style: regularBody8,
                        textAlign: TextAlign.justify,
                      ),
                    );
                  } else if (widget.orderDetail.orderStatus == 'Selesai') {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Nilai pesanan sebelum  ${widget.orderDetail.formattedDate} dan dapatkan ${widget.orderDetail.grandTotalExp} EXP!!!',
                        style: regularBody8,
                        textAlign: TextAlign.justify,
                      ),
                    );
                  } else if (widget.orderDetail.orderStatus == 'Gagal') {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        'Pesanan gagal dikarenakan pembayaran sudah melewati batas pembayaran.',
                        style: regularBody8,
                        textAlign: TextAlign.justify,
                      ),
                    );
                  } else {
                    return const Text('Status Tidak Diketahui');
                  }
                },
              ),
            ],
          ),
          Builder(
            builder: (context) {
              if (widget.orderDetail.orderStatus == 'Menunggu Konfirmasi') {
                return SvgPicture.asset('assets/img/SpinnerGap.svg');
              } else if (widget.orderDetail.orderStatus == 'Proses') {
                return SvgPicture.asset('assets/img/ClockCountdown.svg');
              } else if (widget.orderDetail.orderStatus == 'Pengiriman') {
                return SvgPicture.asset('assets/img/Package.svg');
              } else if (widget.orderDetail.orderStatus == 'Selesai') {
                return SvgPicture.asset('assets/img/CheckCircle.svg');
              } else if (widget.orderDetail.orderStatus == 'Gagal') {
                return SvgPicture.asset('assets/img/XCircle.svg');
              } else {
                return const Text('Status Tidak Diketahui');
              }
            },
          ),
        ],
      ),
    );
  }
}
