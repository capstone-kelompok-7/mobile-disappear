import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img/EmptyOrder.svg'),
          const SizedBox(height: 20,),
          const Text('Oops.. Belum ada pesanan, nih!!', style: mediumBody3, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}