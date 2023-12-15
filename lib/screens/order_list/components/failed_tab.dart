// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:disappear/screens/order_list/components/EmptyOrder.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:flutter/material.dart';

import 'package:disappear/screens/order_list/components/failed_card.dart';
import 'package:provider/provider.dart';

class FailedTab extends StatefulWidget {
  final String title;

  const FailedTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<FailedTab> createState() => _FailedTabState();
}

class _FailedTabState extends State<FailedTab> {
  @override
  void initState() {
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.orderStatus = 'gagal';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderViewModel>(
      builder: (context, state, _) {
        return FutureBuilder(
          future: state.getAllOrderUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const EmptyOrder();
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const EmptyOrder();
            }

            /// Success
            else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: FailedCard(
                      order: snapshot.data![index]!,
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
