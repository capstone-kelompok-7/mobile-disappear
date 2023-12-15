import 'package:disappear/screens/order_list/components/EmptyOrder.dart';
import 'package:disappear/screens/order_list/components/inprogress_card.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/order/order_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class InProgressTab extends StatefulWidget {
  final String title;

  const InProgressTab({Key? key, required this.title}) : super(key: key);

  @override
  State<InProgressTab> createState() => _InProgressTabState();
}

class _InProgressTabState extends State<InProgressTab> {
  @override
  void initState() {
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.orderStatus = 'proses';
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
                    child: InProgressCard(
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
