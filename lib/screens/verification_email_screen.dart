import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationEmailScreen extends StatelessWidget {
  static const String routePath = '/verification-email';
  const VerificationEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff404040),
        body: ListView(
          children: [
            /// TITLE
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

            /// BOTTOM SHEET
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
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 40,
                          right: 135,
                          left: 135,
                        ),
                        child: Icon(
                          Icons.forward_to_inbox_rounded,
                          size: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 71,
                          left: 71,
                        ),
                        child: Text(
                          'Masukkan Kode Verifikasi',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      /// MASSUKKAN KODE VERIFIKASI
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: Text(
                          'Kode verifikasi berhasil dikirimkan melalui Email\nkamu yang terdaftar pada akun',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      /// VERIFICATION CODE BOX
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 35,
                        ),
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
                                  '*',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '*',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '*',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '*',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '*',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 39,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  '*',
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

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '03.00',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 180,
                            ),
                            Text(
                              'Kirim ulang',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// VERIFIKASI
                      Container(
                        height: 44,
                        width: 295,
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff404040),
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
