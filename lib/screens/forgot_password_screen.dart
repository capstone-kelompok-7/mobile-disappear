import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routePath = '/forgot-password-screen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: ListView(
          children: [
            /// Title
            Padding(
              padding: EdgeInsets.only(
                right: 72,
                left: 72,
                top: 92,
              ),
              child: Text(
                'Disappear',
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 48,
                ),
              ),
            ),

            /// Bottom Sheet
            Container(
              margin: EdgeInsets.only(
                top: 150,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Container(
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
                        margin: EdgeInsets.only(
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
                                hintText: 'Masukkan email anda',
                                hintStyle: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
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
                          color: Colors.grey,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lanjut',
                            style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
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
