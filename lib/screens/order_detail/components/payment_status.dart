// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';

class PaymentStatus extends StatefulWidget {
  final OrderDetailByIdModel orderDetail;
  const PaymentStatus({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Status Pembayaran',
            style: mediumBody7,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.orderDetail.paymentStatus,
            style: mediumBody8.copyWith(color: neutral20),
          ),
        ],
      ),
    );
  }
}
