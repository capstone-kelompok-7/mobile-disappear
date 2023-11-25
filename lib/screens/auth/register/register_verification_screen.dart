import 'package:disappear/screens/auth/register/components/register_verification_failed_dialog.dart';
import 'package:disappear/screens/auth/register/components/register_verification_success_dialog.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/register/register_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class RegisterVerificationScreen extends StatefulWidget {
  static const String routePath = '/verification-register';
  
  const RegisterVerificationScreen({super.key});

  @override
  State<RegisterVerificationScreen> createState() => _RegisterVerificationScreenState();
}

class _RegisterVerificationScreenState extends State<RegisterVerificationScreen> {
  @override
  void initState() {
    final registerViewModel = Provider.of<RegisterVerificationViewModel>(context, listen: false);

    registerViewModel.addListener(_otpListener);
    registerViewModel.addListener(_resendOTPListener);

    super.initState();
  }

  void _otpListener() {
    if (mounted && context.mounted) {
      final registerVerifViewModel = Provider.of<RegisterVerificationViewModel>(context, listen: false);

      if (registerVerifViewModel.isOTPCorrect == true) {
        _displaySuccessMessage(registerVerifViewModel.message!);
        registerVerifViewModel.isOTPCorrect = null;
      }

      if (registerVerifViewModel.isOTPCorrect == false) {
        _displayFailedMessage(registerVerifViewModel.message!);
        registerVerifViewModel.isOTPCorrect = null;
      }
    }
  }

  void _resendOTPListener() {
    if (mounted && context.mounted) {
      final registerVerifViewModel = Provider.of<RegisterVerificationViewModel>(context, listen: false);

      if (registerVerifViewModel.isOTPSent != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(registerVerifViewModel.message!))
        );

        registerVerifViewModel.isOTPSent = null;
      }
    }
  }

  void _displayFailedMessage(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
        RegisterVerificationFailedDialog(message: message)
    );
  }

  void _displaySuccessMessage(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
        RegisterVerificationSuccessDialog(message: message)
    );
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
                    left: 30,
                    right: 30,
                  ),
                  child: Consumer<RegisterVerificationViewModel>(
                    builder: (context, state, _) {
                      return Form(
                        key: state.formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    left: 30,
                    right: 30,
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
                      Consumer<RegisterVerificationViewModel>(
                        builder: (context, state, _) {
                          return TextButton(
                            onPressed: state.resendOTP,
                            child: state.isSendingOTP
                              ? const SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircularProgressIndicator(
                                    color: primary40,
                                    strokeWidth: 3,
                                  ),
                                )
                              : Text(
                                'Kirim ulang',
                                style: regularBody5.copyWith(color: primary40),
                              ),
                          );
                        }
                      ),
                    ],
                  ),
                ),

                /// VERIFIKASI
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                  ),
                  child: Consumer<RegisterVerificationViewModel>(
                    builder: (context, state, _) {
                      return ElevatedButton(
                        onPressed: state.isLoading
                          ? null
                          : state.isOTPEmpty()
                            ? null
                            : state.verifyOTP,
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
