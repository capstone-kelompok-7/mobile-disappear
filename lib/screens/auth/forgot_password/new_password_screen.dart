import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/forgot_password/new_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NewPasswordScreen extends StatefulWidget {
  static const String routePath = '/new-password-screen';
  
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
              child: Consumer<NewPasswordViewModel>(
                builder: (context, state, _) {
                  return Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Buat kata sandi baru',
                          style: semiBoldTitle6.copyWith(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Kata sandi baru', style: mediumBody5),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: !state.isLoading,
                              controller: state.passwordController,
                              decoration: InputDecoration(
                                hintText: 'Masukan kata sandi baru anda',
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: GestureDetector(
                                  onTap: state.togglePasswordObscure,
                                  child: Icon(state.isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined)
                                )
                              ),
                              obscureText: state.isPasswordObscured,
                              validator: state.validatePassword
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ulangi kata sandi', style: mediumBody5),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: !state.isLoading,
                              controller: state.passwordConfirmationController,
                              decoration: InputDecoration(
                                hintText: 'Masukan ulang kata sandi anda',
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: GestureDetector(
                                  onTap: state.togglePasswordConfirmationObscure,
                                  child: Icon(state.isPasswordConfirmationObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined)
                                )
                              ),
                              obscureText: state.isPasswordConfirmationObscured,
                              validator: state.validatePasswordConfirmation,
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: state.isLoading ? null : state.resetPassword,
                          child: state.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: whiteColor,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text('Atur ulang kata sandi', style: semiBoldBody3),
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
