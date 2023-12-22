import 'package:disappear/screens/order_list/components/completed_tab.dart';
import 'package:disappear/screens/order_list/components/failed_tab.dart';
import 'package:disappear/screens/order_list/components/inprogress_tab.dart';
import 'package:disappear/screens/order_list/components/sent_tab.dart';
import 'package:disappear/screens/order_list/components/waiting_confirmation_tab.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  static const String routePath = '/order-list-screen';
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Pesanan',
          style: semiBoldBody1.copyWith(
            color: whiteColor,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints.expand(height: 50),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(child: Text('Menunggu Konfirmasi', style: regularBody8)),
                    Tab(child: Text('Proses', style: regularBody8)),
                    Tab(child: Text('Dikirim', style: regularBody8)),
                    Tab(child: Text('Selesai', style: regularBody8)),
                    Tab(child: Text('Gagal', style: regularBody8)),
                  ],
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  WaitingConfirmationTab(title: 'Menunggu Konfirmasi'),
                  InProgressTab(title: 'Proses'),
                  SentTab(title: 'Dikirim'),
                  CompletedTab(title: 'Selesai'),
                  FailedTab(title: 'Gagal'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
