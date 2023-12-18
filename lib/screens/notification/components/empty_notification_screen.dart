import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyNotificationScreen extends StatefulWidget {
  const EmptyNotificationScreen({super.key});

  @override
  State<EmptyNotificationScreen> createState() => _EmptyNotificationScreenState();
}

class _EmptyNotificationScreenState extends State<EmptyNotificationScreen> {
  void _goToHomeScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 110),
      child: Column(
        children: [
          Center(child: SvgPicture.asset('assets/img/NotificationIllustration.svg')),
          const SizedBox(height: 28,),
          const Text('Belum ada notifkasi, nih!', style: mediumBody1, textAlign: TextAlign.center,),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _goToHomeScreen,
            child: const Text('Kembali ke Beranda', style: semiBoldBody5,)
          ),
        ],
      ),
    );
  }
}