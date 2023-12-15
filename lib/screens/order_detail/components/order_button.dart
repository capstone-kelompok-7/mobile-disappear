// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:disappear/screens/product_review/add_review_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:flutter/material.dart';

import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:provider/provider.dart';

class OrderButton extends StatefulWidget {
  final OrderDetailByIdModel orderDetail;
  const OrderButton({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  void _goToAddReviewScreen() {
    final addReviewViewModel = Provider.of<AddProductReviewViewModel>(context, listen: false);
    addReviewViewModel.orderDetail = widget.orderDetail;
    
    Navigator.pushNamed(context, AddReviewScreen.routePath);
  }
  
  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Builder(
        builder: (context) {
          if (widget.orderDetail.orderStatus == 'Menunggu Konfirmasi') {
            return SizedBox();
          } else if (widget.orderDetail.orderStatus == 'Proses') {
            return SizedBox();
          } else if (widget.orderDetail.orderStatus == 'Pengiriman') {
            return ElevatedButton(
              onPressed: () {
                orderViewModel.acceptOrder();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary30,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  minimumSize: const Size(double.infinity, 45)),
              child: const Text(
                'Pesanan Diterima',
                style: semiBoldBody7,
              ),
            );
          } else if (widget.orderDetail.orderStatus == 'Selesai') {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: primary40),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        minimumSize: const Size(0, 40)),
                    child: const Text(
                      'Beli lagi',
                      style: semiBoldBody7,
                    ),
                  ),
                ),
                const SizedBox(width: 30,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _goToAddReviewScreen,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary30,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        minimumSize: const Size(0, 40)),
                    child: const Text(
                      'Nilai',
                      style: semiBoldBody7,
                    ),
                  ),
                ),
              ],
            );
          } else if (widget.orderDetail.orderStatus == 'Gagal') {
            return OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: primary40,
                  ),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  minimumSize: const Size(double.infinity, 45)),
              child: const Text(
                'Pesanan Kembali',
                style: semiBoldBody7,
              ),
            );
          } else {
            return const Text('Status Tidak Diketahui');
          }
        },
      ),
    );
  }
}
