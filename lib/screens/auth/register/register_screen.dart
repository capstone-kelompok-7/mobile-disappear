import 'package:disappear/screens/auth/register/components/register_failed_dialog.dart';
import 'package:disappear/screens/auth/register/components/register_success_dialog.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/register/register_verification_view_model.dart';
import 'package:disappear/view_models/auth/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routePath = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    final registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);

    registerViewModel.addListener(_emailSentListener);

    super.initState();
  }

  void _emailSentListener() {
    if (mounted && context.mounted) {
      final registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);
      final registerVerifViewModel = Provider.of<RegisterVerificationViewModel>(context, listen: false);

      if (registerViewModel.isEmailSent == true) {
        _displaySuccessMessage(registerViewModel.message!);

        registerViewModel.isEmailSent = null;
        registerVerifViewModel.email = registerViewModel.emailController.text;
      }

      if (registerViewModel.isEmailSent == false) {
        _displayFailedMessage(registerViewModel.message!);
        registerViewModel.isEmailSent = null;
      }
    }
  }

  void _displayFailedMessage(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
        RegisterFailedDialog(message: message)
    );
  }

  void _displaySuccessMessage(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
        RegisterSuccessDialog(message: message)
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
              child: Consumer<RegisterViewModel>(
                builder: (context, state, _) {
                  return Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Daftar Akun',
                          style: semiBoldTitle6.copyWith(fontSize: 22),
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
                                contentPadding: EdgeInsets.all(10),
                              ),
                              validator: state.validateEmail
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Kata sandi', style: mediumBody5),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: !state.isLoading,
                              controller: state.passwordController,
                              decoration: InputDecoration(
                                hintText: 'Masukan kata sandi anda',
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: GestureDetector(
                                  onTap: state.togglePasswordObscure,
                                  child: Icon(state.isPasswordObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined)
                                )
                              ),
                              obscureText: state.isPasswordObscured,
                              validator: state.validatePassword,
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
                            : const Text('Daftar', style: semiBoldBody3),
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
