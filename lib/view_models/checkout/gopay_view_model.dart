import 'dart:io';

import 'package:disappear/models/checkout/created_order_gopay_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GopayViewModel extends ChangeNotifier {
  CreatedGopayOrder? createdOrder;

  void pay() async{
    final url = createdOrder!.actions
      .where((element) => element.name == 'deeplink-redirect')
      .first
      .url;

    if (Platform.isIOS) {
      await launchUrl(Uri.parse(url));
    } else {
      await launchUrl(Uri.parse(url));
    }
  }
}