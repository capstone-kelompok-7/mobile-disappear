import 'package:disappear/screens/notification/components/empty_notification_screen.dart';
import 'package:disappear/screens/notification/components/notification_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/notification/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  static const String routePath = '/notification';

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left,
              size: 32, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Notifikasi',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: Consumer<NotificationViewModel>(
        builder: (context, state, _) {
          return FutureBuilder(
            future: state.getNotification(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const EmptyNotificationScreen();
              } else if (!snapshot.hasData) {
                return const EmptyNotificationScreen();
              } else {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => NotificationItem(
                    notification: snapshot.data![index],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
