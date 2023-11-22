import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: secondary00,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      title: const Text(
        'Gilbert, kamu telah melakukan pemesanan dan memeriksa riwayat pesanan kamu untuk detail lengkapnya',
        style: regularBody7,
      ),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      minLeadingWidth: 15,
      leading: SvgPicture.asset('assets/img/NewNotificationIcon.svg', width: 28, height: 28,),
    );
  }
}