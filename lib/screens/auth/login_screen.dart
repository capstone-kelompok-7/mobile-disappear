import 'package:disappear/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:disappear/screens/auth/register/register_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routePath = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _goToRegisterScreen() {
    Navigator.pushNamed(context, RegisterScreen.routePath);
  }

  void _goToForgotPasswordScreen() {
    Navigator.pushNamed(context, ForgotPasswordScreen.routePath);
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
              margin: const EdgeInsets.only(top: 90),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Consumer<LoginViewModel>(
                builder: (context, state, _) {
                  return Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Masuk Akun',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Kata sandi', style: mediumBody5),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: !state.isLoading,
                              controller: state.passwordController,
                              decoration: InputDecoration(
                                hintText: 'Masukan kata sandi',
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: GestureDetector(
                                  onTap: state.togglePasswordObscure,
                                  child: Icon(state.isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined)
                                )
                              ),
                              obscureText: state.isPasswordObscured,
                              validator: state.validatePassword,
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _goToForgotPasswordScreen,
                            child: Text(
                              'Lupa Kata Sandi?',
                              style: mediumBody7.copyWith(color: primary40, fontFamily: 'Inter')
                            )
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: state.isLoading ? null : state.login,
                          child: state.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: whiteColor,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text('Masuk', style: semiBoldBody3),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Belum memiliki akun? ', style: regularBody6),
                            InkWell(
                              onTap: _goToRegisterScreen,
                              child: Text('Daftar', style: regularBody6.copyWith(color: primary40)),
                            ),
                          ],
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
