// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:disappear/screens/order_detail/detail_order_screen.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:flutter/material.dart';

import 'package:disappear/models/order_all_user_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:provider/provider.dart';

class FailedCard extends StatefulWidget {
  final OrderAllUserModel order;
  const FailedCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<FailedCard> createState() => _FailedCardState();
}

class _FailedCardState extends State<FailedCard> {
  void _goToDetailOrderScreen() {
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.orderId = widget.order.id;

    Navigator.pushNamed(context, DetailOrderScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _goToDetailOrderScreen,
      child: Container(
        width: 370,
        height: 198,
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
                  color: error10,
                ),
                child: Text(
                  widget.order.orderStatus!,
                  style: regularBody3.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 2),
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
                      child: Image.network(
                        widget.order.orderDetails!.first.product.productPhotos
                            .first.url,
                        width: 68,
                        height: 48,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.order.orderDetails![0].product.name,
                            style: mediumBody2.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 1),
                        Text(
                          '${widget.order.orderDetails![0].totalGramPlastic} Gram',
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
                                'Rp. ${widget.order.orderDetails![0].product.price}',
                                style: boldBody2.copyWith(
                                  fontSize: 13,
                                  color: neutral40,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(
                                'x${widget.order.orderDetails![0].quantity}',
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
            const SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 3),
                Text('Tampilkan produk lagi',
                    style: mediumBody3.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: neutral30)),
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
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Total produk : ',
                                style: semiBoldBody3.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w300)),
                            TextSpan(
                                text:
                                    'Rp ${widget.order.formattedTotalAmountPaid}',
                                style: semiBoldBody3.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w700)),
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
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Penjual sedang memeriksa bukti \npembayaran',
                        style: regularBody4.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: neutral30,
                            height: 1.2)),
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
