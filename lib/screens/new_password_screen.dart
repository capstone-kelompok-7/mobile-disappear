import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  static const String routePath = '/new-password-screen';
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary40,
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
              style: boldTitle3.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
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
              height: 520,
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
                        style: semiBoldTitle6.copyWith(
                          fontSize: 26,
                        ),
                      ),
                    ),

                    /// KATA SANDI
                    Container(
                      height: 100,
                      width: 295,
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kata Sandi Baru',
                            style: mediumBody5.copyWith(),
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Masukkan kata sandi baru',
                              hintStyle: regularBody7.copyWith(),
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
                      height: 100,
                      width: 295,
                      margin: const EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ulang Kata Sandi',
                            style: mediumBody5.copyWith(),
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Masukkan konfirmasi kata sandi baru',
                              hintStyle: regularBody7.copyWith(),
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
                        color: primary40,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Atur ulang kata sandi',
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
