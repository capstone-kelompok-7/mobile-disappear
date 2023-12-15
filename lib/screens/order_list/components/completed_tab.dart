import 'package:disappear/screens/order_list/components/completed_card.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompletedTab extends StatefulWidget {
  final String title;

  const CompletedTab({Key? key, required this.title}) : super(key: key);

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  void initState() {
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.orderStatus = 'selesai';
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
              return const Center(
                child: Text('No data available'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            }

            /// Success
            else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        CompletedCard(
                          order: snapshot.data![index]!,
                        ),
                      ],
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
