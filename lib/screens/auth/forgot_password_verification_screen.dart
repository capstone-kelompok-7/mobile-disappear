import 'package:disappear/screens/auth/components/forgot_password_verification_failed_dialog.dart';
import 'package:disappear/screens/auth/components/forgot_password_verification_success_dialog.dart';
import 'package:disappear/screens/auth/forgot_password_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/forgot_password_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class ForgotPasswordVerificationScreen extends StatefulWidget {
  static const String routePath = '/verification-forgot-password';
  
  const ForgotPasswordVerificationScreen({super.key});

  @override
  State<ForgotPasswordVerificationScreen> createState() => _ForgotPasswordVerificationScreenState();
}

class _ForgotPasswordVerificationScreenState extends State<ForgotPasswordVerificationScreen> {
  @override
  void initState() {
    final forgotPasswordViewModel = Provider.of<ForgotPasswordVerificationViewModel>(context, listen: false);

    forgotPasswordViewModel.addListener(_sendEmailListener);

    super.initState();
  }

  void _sendEmailListener() {
    if (mounted && context.mounted) {
      final forgotPasswordVerifViewModel = Provider.of<ForgotPasswordVerificationViewModel>(context, listen: false);

      if (forgotPasswordVerifViewModel.isOTPCorrect == true) {
        _displaySuccessMessage(forgotPasswordVerifViewModel.message!);
        forgotPasswordVerifViewModel.isOTPCorrect = null;
      }

      if (forgotPasswordVerifViewModel.isOTPCorrect == false) {
        _displayFailedMessage(forgotPasswordVerifViewModel.message!);
        forgotPasswordVerifViewModel.isOTPCorrect = null;
      }
    }
  }

  void _displayFailedMessage(String message) {
    final forgotPasswordViewModel = Provider.of<ForgotPasswordVerificationViewModel>(context, listen: false);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
        ForgotPasswordVerificationFailedDialog(
          message: message,
          email: forgotPasswordViewModel.email!,
        )
    );
  }

  void _displaySuccessMessage(String message) {
    final forgotPasswordViewModel = Provider.of<ForgotPasswordVerificationViewModel>(context, listen: false);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
        ForgotPasswordVerificationSuccessDialog(
          message: message,
          email: forgotPasswordViewModel.email!,
        )
    );
  }

  void _backToForgotPasswordScreen() {
    Navigator.pushReplacementNamed(context, ForgotPasswordScreen.routePath);
  }

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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/img/SendEmailVerificationIcon.png',
                    width: 120,
                    height: 120,
                  )
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Masukkan Kode Verifikasi',
                    style: semiBoldBody3.copyWith(
                      color: blackColor,
                      fontSize: 18,
                    ),
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
                                enabled: !state.isLoading,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0)
                                ),
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
                                enabled: !state.isLoading,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0)
                                ),
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
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
                                enabled: !state.isLoading,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0)
                                ),
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
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
                                enabled: !state.isLoading,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0)
                                ),
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
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
                                enabled: !state.isLoading,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0)
                                ),
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
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
                                enabled: !state.isLoading,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0)
                                ),
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
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
                      TimerCountdown(
                        format: CountDownTimerFormat.minutesSeconds,
                        timeTextStyle: regularBody5,
                        spacerWidth: 2,
                        enableDescriptions: false,
                        endTime: DateTime.now().add(
                          const Duration(minutes: 3, seconds: 0),
                        ),
                      ),
                      TextButton(
                        onPressed: _backToForgotPasswordScreen,
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
                  child: Consumer<ForgotPasswordVerificationViewModel>(
                    builder: (context, state, _) {
                      return ElevatedButton(
                        onPressed: state.isLoading ? null : state.verifyOTP,
                        child: state.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: whiteColor,
                                strokeWidth: 3,
                              ),
                            )
                          : const Text('Verifikasi', style: semiBoldBody3),
                      );
                    }
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
