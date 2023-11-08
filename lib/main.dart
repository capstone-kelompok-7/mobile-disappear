import 'package:disappear/screens/home_screen.dart';
import 'package:disappear/screens/splash_screen.dart';
import 'package:disappear/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel(),),
      ],
      child: App(),
    )
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routePath,
      routes: {
        SplashScreen.routePath:(context) => const SplashScreen(),
        HomeScreen.routePath:(context) => const HomeScreen(),
      },
    );
  }
}