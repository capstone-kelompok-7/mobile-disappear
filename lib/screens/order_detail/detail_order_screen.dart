import 'package:disappear/screens/order_detail/components/address_components.dart';
import 'package:disappear/screens/order_detail/components/order_button.dart';
import 'package:disappear/screens/order_detail/components/order_number_components.dart';
import 'package:disappear/screens/order_detail/components/order_summary_components.dart';
import 'package:disappear/screens/order_detail/components/payment_method_components.dart';
import 'package:disappear/screens/order_detail/components/payment_status.dart';
import 'package:disappear/screens/order_detail/components/products_components.dart';
import 'package:disappear/screens/order_detail/components/status_components.dart';
import 'package:disappear/screens/order_list/components/empty_order.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailOrderScreen extends StatefulWidget {
  static const String routePath = '/detail-order';

  const DetailOrderScreen({super.key});

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  @override
  void initState() {
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.getDetailsOrderById();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: whiteColor,
            size: 32,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Rincian Pesanan',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: Consumer<OrderViewModel>(
        builder: (context, state, _) {
          return FutureBuilder(
            future: state.orderDetailFuture,
            builder: (context, snapshot) {
              final reviewViewModel = Provider.of<AddProductReviewViewModel>(context, listen: false);
              reviewViewModel.orderDetail = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const EmptyOrder();
              } else if (!snapshot.hasData) {
                return const EmptyOrder();
              } else {
                return ListView(
                  children: [
                    OrderStatus(orderDetail: snapshot.data!),
                    AddressComponents(orderDetail: snapshot.data!),
                    Products(orderDetail: snapshot.data!),
                    OrderSummary(orderDetail: snapshot.data!),
                    PaymentMethod(orderDetail: snapshot.data!),
                    OrderNumber(orderDetail: snapshot.data!),
                    PaymentStatus(orderDetail: snapshot.data!),
                    const SizedBox(
                      height: 10,
                    ),
                    OrderButton(orderDetail: snapshot.data!),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
