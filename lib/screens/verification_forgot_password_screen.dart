import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationForgotPasswordScreen extends StatelessWidget {
  static const String routePath = '/verification-forgot-password';
  const VerificationForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _code1 = TextEditingController();
    TextEditingController _code2 = TextEditingController();
    TextEditingController _code3 = TextEditingController();
    TextEditingController _code4 = TextEditingController();
    TextEditingController _code5 = TextEditingController();
    TextEditingController _code6 = TextEditingController();
    return Scaffold(
      backgroundColor: primary40,
      body: ListView(
        children: [
          /// TITLE
          Padding(
            padding: const EdgeInsets.only(
              right: 72,
              left: 72,
              top: 54,
            ),
            child: Text(
              'Disappear',
              style: boldTitle3.copyWith(
                color: whiteColor,
                fontSize: 46,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          /// BOTTOM SHEET
          Container(
            margin: const EdgeInsets.only(
              top: 107,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: SizedBox(
              width: 390,
              height: 520,
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
                        style: semiBoldBody3.copyWith(
                          color: blackColor,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    /// MASUKKAN KODE VERIFIKASI
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                      ),
                      child: Text(
                        'Kode verifikasi berhasil dikirimkan melalui Email\nkamu yang terdaftar pada akun',
                        style: regularBody7.copyWith(
                          color: blackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    /// VERIFICATION CODE BOX
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35,
                      ),
                      child: Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// FIRST CODE
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: mediumBody3.copyWith(
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _code1,
                              ),
                            ),
                            const SizedBox(width: 10),

                            /// SECOND CODE
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: mediumBody3.copyWith(
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _code2,
                              ),
                            ),
                            const SizedBox(width: 10),

                            /// THIRD CODE
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: mediumBody3.copyWith(
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _code3,
                              ),
                            ),
                            const SizedBox(width: 10),

                            /// FOURTH CODE
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: mediumBody3.copyWith(
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _code4,
                              ),
                            ),
                            const SizedBox(width: 10),

                            /// FIFTH CODE
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: mediumBody3.copyWith(
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _code5,
                              ),
                            ),
                            const SizedBox(width: 10),

                            /// SIXTH CODE
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: mediumBody3.copyWith(
                                  color: blackColor,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _code6,
                              ),
                            ),
                          ],
                        ),
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
                            style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 180,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Kirim ulang',
                              style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// VERIFIKASI
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(primary40),
                          minimumSize: MaterialStatePropertyAll(
                            Size(295, 44),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Verifikasi',
                          style: semiBoldBody4.copyWith(
                            color: whiteColor,
                          ),
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
    );
  }
}