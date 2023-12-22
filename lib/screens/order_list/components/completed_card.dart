// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:disappear/helper.dart';
import 'package:disappear/screens/order_detail/detail_order_screen.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:flutter/material.dart';

import 'package:disappear/models/order_all_user_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:provider/provider.dart';

class CompletedCard extends StatefulWidget {
  final OrderAllUserModel order;
  const CompletedCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<CompletedCard> createState() => _CompletedCardState();
}

class _CompletedCardState extends State<CompletedCard> {
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
                  widget.order.orderStatus!,
                  style: regularBody8,
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
                                formattedPrice(widget.order.orderDetails![0].product.price),
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
                const Divider(thickness: 0.5, color: neutral00,),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.order.orderDetails!.length} produk', style: regularBody8,),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            const TextSpan(text: 'Total Pesanan : ', style: regularBody8),
                            TextSpan(
                              text: formattedPrice(widget.order.totalAmountPaid!),
                              style: regularBody8.copyWith(fontWeight: FontWeight.w700)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                const Divider(thickness: 0.5, color: neutral00,),
                const SizedBox(height: 5),
                Visibility(
                  visible: widget.order.extraInfo != null && widget.order.extraInfo != '',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.order.extraInfo!,
                          style: regularBody4.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: neutral30,
                              height: 1.2)),
                    ),
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
