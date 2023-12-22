import 'dart:io';

import 'package:disappear/models/checkout/created_order_model.dart';
import 'package:flutter/material.dart';
import 'package:telegram/telegram.dart';
import 'package:url_launcher/url_launcher.dart';

class ManualTransferViewModel extends ChangeNotifier {
  CreatedOrder? createdOrder;

  void payTelegram() async {
    const username = "novilfahlevy";
    final orderId = createdOrder?.idOrder;
    final message = "Halo kak saya mau melakukan pembayaran dengan kode berikut $orderId";
    
    Telegram.send(username: username, message: message);
  }

  void payWhatsapp() async {
    const contact = '+6289609233200';
    final orderId = createdOrder?.idOrder;
    final message = "Halo kak saya mau melakukan pembayaran untuk pesanan dengan kode berikut: $orderId\n\nSudah saya transfer ke rekening:\nBNI 123-456-789\nBRI 987-654-321\nBCA 234-567-890\n[silakan transfer ke salah satu rekening dan lampirkan bukti transfernya]";
    final androidUrl = "whatsapp://send?phone=$contact&text=$message";
    final iosUrl = "https://wa.me/$contact?text=${Uri.encodeComponent(message)}";
    
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  }
}