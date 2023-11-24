import 'package:disappear/screens/auth/login_screen.dart';
import 'package:disappear/screens/register_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/onboarding/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routePath = '/main-onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void _goToRegisterScreen() {
    Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.routePath, (route) => false);
  }

  void _goToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routePath, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<OnboardingViewModel>(
              builder: (context, state, _) {
                return SvgPicture.asset(
                  state.data[state.selectedScreenIndex]['picture']!,
                  width: 200,
                  height: 200
                );
              }
            ),
            const SizedBox(height: 10,),
            Consumer<OnboardingViewModel>(
              builder: (context, state, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        color: state.selectedScreenIndex == 0 ? primary40 : neutral00,
                        width: 10,
                        height: 10,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    ClipOval(
                      child: Container(
                        color: state.selectedScreenIndex == 1 ? primary40 : neutral00,
                        width: 10,
                        height: 10,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    ClipOval(
                      child: Container(
                        color: state.selectedScreenIndex == 2 ? primary40 : neutral00,
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ],
                );
              }
            ),
            const SizedBox(height: 45,),
            Consumer<OnboardingViewModel>(
              builder: (context, state, _) {
                return Text(
                  state.data[state.selectedScreenIndex]['title']!,
                  style: boldBody1.copyWith(color: primary40),
                  textAlign: TextAlign.center
                );
              }
            ),
            const SizedBox(height: 15,),
            Consumer<OnboardingViewModel>(
              builder: (context, state, _) {
                return Text(
                  state.data[state.selectedScreenIndex]['description']!,
                  style: regularBody6.copyWith(color: neutral40),
                  textAlign: TextAlign.center
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer<OnboardingViewModel>(
        builder: (context, state, _) {
          if (state.selectedScreenIndex < 2) {
            return Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: state.skip,
                    child: const Text('Skip', style: regularBody6,)
                  ),
                  ElevatedButton(
                    onPressed: state.next,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28.5),
                      minimumSize: const Size(0, 41),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Next', style: mediumBody6,)
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _goToLoginScreen,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28.5),
                    elevation: 0,
                    minimumSize: const Size(0, 41),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: primary40),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: whiteColor,
                    foregroundColor: primary40,
                  ),
                  child: const Text('Masuk', style: mediumBody6,)
                ),
                ElevatedButton(
                  onPressed: _goToRegisterScreen,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28.5),
                    minimumSize: const Size(0, 41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Daftar', style: mediumBody6,)
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}