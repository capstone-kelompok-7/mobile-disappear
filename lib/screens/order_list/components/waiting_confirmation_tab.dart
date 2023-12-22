import 'package:disappear/screens/order_list/components/empty_order.dart';
import 'package:disappear/screens/order_list/components/wating_confirmation_card.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingConfirmationTab extends StatefulWidget {
  final String title;

  const WaitingConfirmationTab({Key? key, required this.title})
      : super(key: key);

  @override
  State<WaitingConfirmationTab> createState() => _WaitingConfirmationTabState();
}

class _WaitingConfirmationTabState extends State<WaitingConfirmationTab> {
  @override
  void initState() {
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.orderStatus = 'menunggu konfirmasi';
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
                    child: WaitingConfirmationTabCard(
                      order: snapshot.data![index]!,
                    )
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
