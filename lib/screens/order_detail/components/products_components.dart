// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';

class Products extends StatefulWidget {
  final OrderDetailByIdModel orderDetail;
  const Products({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
          bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
        )),
        child: ListView.separated(
          itemCount: widget.orderDetail.orderDetails.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        widget.orderDetail.orderDetails[index].product
                            .productPhotos.first.url,
                        width: 68,
                        height: 48),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.orderDetail.orderDetails[index].product.name,
                          style: mediumBody7,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '1 produk | ${widget.orderDetail.orderDetails[index].totalGramPlastic} gram',
                          style: regularBody8,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Rp. ${widget.orderDetail.orderDetails[index].product.price}',
                          style: boldBody7,
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  'x${widget.orderDetail.orderDetails[index].quantity}',
                  style: semiBoldBody8.copyWith(color: neutral20),
                )
              ],
            );
          },
        ));
  }
}
