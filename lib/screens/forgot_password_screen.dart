import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routePath = '/forgot-password-screen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff404040),
        body: ListView(
          children: [
            /// Title
            Padding(
              padding: const EdgeInsets.only(
                right: 72,
                left: 72,
                top: 92,
              ),
              child: Text(
                'Disappear',
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),

            /// Bottom Sheet
            Container(
              margin: const EdgeInsets.only(
                top: 150,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: SizedBox(
                width: 390,
                height: 573,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 47,
                          left: 47,
                          top: 40,
                          bottom: 65,
                        ),
                        child: Text(
                          'Lupa Kata Sandi',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                      ),

                      /// Email
                      Container(
                        height: 80,
                        width: 295,
                        margin: const EdgeInsets.only(
                          bottom: 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Masukkan email anda',
                                hintStyle: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: const Color(0xffF5F5F5),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Lanjut
                      Container(
                        height: 44,
                        width: 295,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff404040),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lanjut',
                            style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
