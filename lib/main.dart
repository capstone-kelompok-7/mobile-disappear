import 'package:disappear/screens/article_screen.dart';
import 'package:disappear/screens/detail_challenge_screen.dart';
import 'package:disappear/screens/home_screen.dart';
import 'package:disappear/screens/forgot_password_screen.dart';
import 'package:disappear/screens/login_screen.dart';
import 'package:disappear/screens/new_password_screen.dart';
import 'package:disappear/screens/register_screen.dart';
import 'package:disappear/screens/splash_screen.dart';
import 'package:disappear/screens/success_email_verification.dart';
import 'package:disappear/screens/success_new_pasword_screen.dart';
import 'package:disappear/screens/verification_email_screen.dart';
import 'package:disappear/screens/verification_forgot_password_screen.dart';
import 'package:disappear/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
      ),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routePath,
      routes: {
        SplashScreen.routePath: (context) => const SplashScreen(),
        HomeScreen.routePath: (context) => const HomeScreen(),
        ForgotPasswordScreen.routePath: (context) =>
            const ForgotPasswordScreen(),
        VerificationForgotPasswordScreen.routePath: (context) =>
            const VerificationForgotPasswordScreen(),
        VerificationEmailScreen.routePath: (context) =>
            const VerificationEmailScreen(),
        DetailChallengeScreen.routePath: (context) =>
            const DetailChallengeScreen(),
        NewPasswordScreen.routePath: (context) => const NewPasswordScreen(),
        SuccessNewPasswordScreen.routePath: (context) =>
            const SuccessNewPasswordScreen(),
        SuccessEmailVerificationScreen.routePath: (context) =>
            const SuccessEmailVerificationScreen(),
        LoginScreen.routePath: (context) => LoginScreen(),
        RegisterScreen.routePath: (context) => RegisterScreen(),
        ArticleScreen.routePath: (context) => const ArticleScreen(),
      },
    );
  }
}
