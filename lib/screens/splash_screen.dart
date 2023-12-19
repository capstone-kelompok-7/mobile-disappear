import 'package:disappear/screens/auth/login_screen.dart';
import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/screens/onboarding/onboarding_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routePath = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserStatus();
    super.initState();
  }

  Future<void> checkUserStatus() async {
    bool firstRun = await IsFirstRun.isFirstRun();

    if (firstRun) {
      _goToOnboardingScreen();
    } else {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getBool('is-logged-in') ?? false) {
        _goToMainScreen();
      } else {
        _goToLoginScreen();
      }
    }
  }

  void _goToOnboardingScreen() {
    Navigator.pushNamedAndRemoveUntil(context, OnboardingScreen.routePath, (route) => false);
  }

  void _goToMainScreen() {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    homeViewModel.getCarouselsCategoriesAndProducts();
    homeViewModel.getChallengesAndArticles();
    
    Navigator.pushNamedAndRemoveUntil(context, MainScreen.routePath, (route) => false);
  }

  void _goToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routePath, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              color: primary40,
              strokeWidth: 3,
            ),
          )
        )
      ),
    );
  }
}
