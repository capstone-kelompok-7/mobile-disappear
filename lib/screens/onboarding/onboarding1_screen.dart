import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding1Screen extends StatelessWidget {
  static const String routePath = '/onboarding-1';

  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 100),
        child: Column(
          children: [
            SvgPicture.asset('assets/img/Onboarding1.svg', width: 300, height: 300,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    color: primary40,
                    width: 10,
                    height: 10,
                  ),
                ),
                const SizedBox(width: 8,),
                ClipOval(
                  child: Container(
                    color: neutral00,
                    width: 10,
                    height: 10,
                  ),
                ),
                const SizedBox(width: 8,),
                ClipOval(
                  child: Container(
                    color: neutral00,
                    width: 10,
                    height: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45,),
            Text('Selamat Datang', style: boldBody1.copyWith(color: primary40),),
            const SizedBox(height: 15,),
            Text(
              'Terima kasih telah memilih kami. Semoga kamu menemukan hal-hal yang menginspirasi di sini !!!',
              style: regularBody6.copyWith(color: neutral40),
              textAlign: TextAlign.center
            ),
            const SizedBox(height: 111,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Skip', style: regularBody6,)
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28.5),
                    minimumSize: const Size(0, 41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Next', style: mediumBody6,)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}