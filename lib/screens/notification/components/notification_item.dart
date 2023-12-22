// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:disappear/models/notification_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          'assets/img/NewNotificationIcon.svg',
          width: 28,
          height: 28,
        ),
        tileColor: secondary00,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        title: Text(
          notification.body,
          style: regularBody7,
        ),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minLeadingWidth: 15,
      ),
    );
  }
}
