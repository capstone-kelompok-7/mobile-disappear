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
              Text(
                'Pesanan akan dijadwalkan paling lambat 03-11-2023',
                style: regularBody8,
              )
            ],
          ),
          SvgPicture.asset('assets/img/OrderSendingIcon.svg')
        ],
      ),
    );
  }
}
