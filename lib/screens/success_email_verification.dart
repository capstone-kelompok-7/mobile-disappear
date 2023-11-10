import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessEmailVerificationScreen extends StatelessWidget {
  static const String routePath = '/success-email-verification';
  const SuccessEmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 260,
              ),
              const SizedBox(
                height: 48,
              ),
              Text('Verifikasi email mu sudah berhasil.',
                  style: GoogleFonts.inter().copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Masuk',
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center),
                  Text(', yuk!',
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
