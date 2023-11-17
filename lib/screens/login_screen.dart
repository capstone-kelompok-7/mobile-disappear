import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/screens/register_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routePath = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);

    loginViewModel.addListener(_loginMessageListener);
    loginViewModel.addListener(_loginSuccessListener);

    super.initState();
  }

  void _goToRegisterScreen() {
    Navigator.pushReplacementNamed(context, RegisterScreen.routePath);
  }

  void _loginMessageListener() {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    if (loginViewModel.message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loginViewModel.message!))
      );

      loginViewModel.message = null;
    }
  }

  void _loginSuccessListener() {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    if (loginViewModel.isLoginSuccess) {
      _goToHomeScreen();
      loginViewModel.isLoginSuccess = false;
    }
  }

  void _goToHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(context, MainScreen.routePath, (route) => false);
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
                              controller: state.passwordController,
                              decoration: InputDecoration(
                                hintText: 'Masukan kata sandi',
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
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
                        const SizedBox(height: 10),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const Divider(thickness: 2),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                              color: whiteColor,
                              child: Text(
                                'or',
                                style: regularBody7.copyWith(fontFamily: 'Inter'),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/img/GoogleLogo.png',
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/img/FacebookLogo.png',
                              ),
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
