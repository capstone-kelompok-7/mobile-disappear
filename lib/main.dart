import 'package:disappear/screens/detail_tantangan_screen.dart';
import 'package:disappear/screens/forgot_password_screen.dart';
import 'package:disappear/screens/splash_screen.dart';
import 'package:disappear/screens/verification_screem.dart';
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
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DetailTantanganScreen.routePath,
      routes: {
        SplashScreen.routePath: (context) => const SplashScreen(),
        ForgotPasswordScreen.routePath: (context) =>
            const ForgotPasswordScreen(),
        VerificationScreen.routePath: (context) => const VerificationScreen(),
        DetailTantanganScreen.routePath : (context) => const DetailTantanganScreen(),
      },
    );
  }
}
