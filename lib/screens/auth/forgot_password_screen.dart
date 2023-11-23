import 'package:disappear/screens/auth/components/forgot_password_success_dialog.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routePath = '/forgot-password-screen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    final forgotPasswordViewModel = Provider.of<ForgotPasswordViewModel>(context, listen: false);

    forgotPasswordViewModel.addListener(_sendEmailListener);

    super.initState();
  }

  void _sendEmailListener() {
    final forgotPasswordViewModel = Provider.of<ForgotPasswordViewModel>(context, listen: false);

    if (forgotPasswordViewModel.isEmailSent == true) {
      _displaySuccessMessage(forgotPasswordViewModel.message!);
      forgotPasswordViewModel.isEmailSent = null;
    }

    if (forgotPasswordViewModel.isEmailSent == false) {
      _displayFailedMessage(forgotPasswordViewModel.message!);
      forgotPasswordViewModel.isEmailSent = null;
    }
  }

  void _displayFailedMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void _displaySuccessMessage(String message) {
    showDialog(
      context: context,
      builder: (context) =>
        ForgotPasswordSuccessDialog(message: message)
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary40,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 72,
                left: 72,
                top: 70,
              ),
              child: SvgPicture.asset('assets/img/DisappearAuthLogo.svg'),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 90),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Consumer<ForgotPasswordViewModel>(
                builder: (context, state, _) {
                  return Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Lupa Kata Sandi',
                          style: semiBoldTitle6,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Email', style: mediumBody5),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: !state.isLoading,
                              controller: state.emailController,
                              decoration: const InputDecoration(
                                hintText: 'Masukan email anda',
                                contentPadding: EdgeInsets.all(10)
                              ),
                              validator: state.validateEmail
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: state.isLoading ? null : state.sendEmail,
                          child: state.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: whiteColor,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text('Lanjut', style: semiBoldBody3),
                        ),
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
