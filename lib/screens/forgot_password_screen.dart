import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routePath = '/forgot-password-screen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary40,
      body: ListView(
        children: [
          /// Title
          Padding(
            padding: const EdgeInsets.only(
              right: 72,
              left: 72,
              top: 54,
            ),
            child: Text(
              'Disappear',
              style: boldTitle3.copyWith(
                color: Colors.white,
                fontSize: 46,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          /// Bottom Sheet
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
                        right: 47,
                        left: 47,
                        top: 40,
                        bottom: 65,
                      ),
                      child: Text(
                        'Lupa Kata Sandi',
                        style: semiBoldTitle6,
                      ),
                    ),

                    /// Email
                    Container(
                      height: 100,
                      width: 295,
                      margin: const EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: mediumBody5,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Masukkan email anda',
                              hintStyle: regularBody5,
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Lanjut
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primary40),
                        minimumSize: MaterialStatePropertyAll(
                          Size(295, 44),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Lanjut',
                        style: semiBoldBody4.copyWith(
                          color: whiteColor,
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
