import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/forgot_password_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class VerificationForgotPasswordScreen extends StatelessWidget {
  static const String routePath = '/verification-forgot-password';
  const VerificationForgotPasswordScreen({super.key});

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
              top: 70,
            ),
            child: SvgPicture.asset('assets/img/DisappearAuthLogo.svg'),
          ),

          /// BOTTOM SHEET
          Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 107),
            padding: const EdgeInsets.symmetric(horizontal: 60),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                SvgPicture.asset('assets/img/SendEmailVerificationIcon.svg'),
                Text(
                  'Masukkan Kode Verifikasi',
                  style: semiBoldBody3.copyWith(
                    color: blackColor,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),

                /// MASUKKAN KODE VERIFIKASI
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: Text(
                    'Kode verifikasi berhasil dikirimkan melalui Email kamu yang terdaftar pada akun',
                    style: regularBody7.copyWith(color: blackColor),
                    textAlign: TextAlign.center,
                  ),
                ),

                /// VERIFICATION CODE BOX
                Padding(
                  padding: const EdgeInsets.only(
                    top: 35,
                  ),
                  child: Consumer<ForgotPasswordVerificationViewModel>(
                    builder: (context, state, _) {
                      return Form(
                        key: state.formKey,
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
                                controller: state.code1,
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
                                controller: state.code2,
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
                                controller: state.code3,
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
                                controller: state.code4,
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
                                controller: state.code5,
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
                                controller: state.code6,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('03.00', style: regularBody5),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Kirim ulang',
                          style: regularBody5.copyWith(color: primary40),
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
        ],
      ),
    );
  }
}
