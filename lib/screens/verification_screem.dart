import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatelessWidget {
  static const String routePath = '/verification-screen';
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff404040),
        body: ListView(
          children: [
            /// TITLE
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
                  color: Colors.white,
                ),
              ),
            ),

            /// BOTTOM SHEET
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
                          bottom: 60,
                        ),
                        child: Text(
                          'Verifikasi',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                      ),

                      /// MASSUKKAN KODE VERIFIKASI
                      Padding(
                        padding: EdgeInsets.only(
                          right: 98.5,
                          left: 98.5,
                          bottom: 30,
                        ),
                        child: Text(
                          'Masukkan kode verifikasi',
                          style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),

                      /// VERIFICATION CODE BOX
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// KIRIM KEMBALI
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 60,
                        ),
                        child: Text(
                          'Kirim Kembali',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      /// VERIFIKASI
                      Container(
                        height: 44,
                        width: 295,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff404040),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Verifikasi',
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
