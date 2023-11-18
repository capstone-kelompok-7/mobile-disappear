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
              top: 92,
            ),
            child: Text(
              'Disappear',
              style: boldTitle3.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
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
              height: 520,
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
                        style: semiBoldTitle6.copyWith(),
                      ),
                    ),

                    /// Email
                    Container(
                      height: 100,
                      width: 295,
                      margin: const EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: mediumBody5.copyWith(),
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Masukkan email anda',
                              hintStyle: regularBody5.copyWith(),
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
                        color: primary40,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lanjut',
                          style: semiBoldBody4.copyWith(
                            color: Colors.white,
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
