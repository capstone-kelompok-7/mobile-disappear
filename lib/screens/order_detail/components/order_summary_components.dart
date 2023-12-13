// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';

class OrderSummary extends StatefulWidget {
  final OrderDetailByIdModel orderDetail;
  const OrderSummary({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
        bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
      )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pesanan',
                style: mediumBody7,
              ),
              Row(
                children: [
                  Text(
                    'Rp ${widget.orderDetail.totalAmountPaid}',
                    style: mediumBody7,
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                  ),
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
            )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal Produk',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
                    Text(
                      'Rp ${widget.orderDetail.orderDetails.first.product.price}',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal Pengiriman',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
                    Text(
                      'Rp ${widget.orderDetail.shipmentFee}',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Diskon',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
                    Text(
                      'Rp ${widget.orderDetail.grandTotalDiscount}',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Layanan',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
                    Text(
                      'Rp ${widget.orderDetail.adminFees}',
                      style: mediumBody8.copyWith(color: neutral20),
                    ),
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
