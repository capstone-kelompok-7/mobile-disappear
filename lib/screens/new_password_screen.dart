import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatelessWidget {
  static const String routePath = '/new-password-screen';
  const NewPasswordScreen({super.key});

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
                      /// BUAT KATA SANDI BARU
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 47,
                          left: 47,
                          top: 40,
                          bottom: 60,
                        ),
                        child: Text(
                          'Buat Kata Sandi Baru',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                      ),

                      /// KATA SANDI
                      Container(
                        height: 80,
                        width: 295,
                        margin: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kata Sandi',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Masukkan kata sandi baru',
                                hintStyle: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                suffixIcon:
                                    const Icon(Icons.remove_red_eye_outlined),
                                suffixIconColor: Colors.black,
                                filled: true,
                                fillColor: const Color(0xffF5F5F5),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// KONFIRMASI KATA SANDI
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
                              'Konfirmasi Kata Sandi',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Masukkan konfirmasi kata sandi baru',
                                hintStyle: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                suffixIcon:
                                    const Icon(Icons.remove_red_eye_outlined),
                                suffixIconColor: Colors.black,
                                filled: true,
                                fillColor: const Color(0xffF5F5F5),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// LANJUT
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
                            'Atur ulang kata sandi',
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
