import 'package:disappear/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [],
      child: App(),
    )
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routePath,
      routes: {
        SplashScreen.routePath:(context) => const SplashScreen()
      },
    );
  }
}