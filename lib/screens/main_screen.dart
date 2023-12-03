import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static const String routePath = '/main';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainViewModel>(
        builder: (context, state, _) => state.currentScreen,
      ),
      bottomNavigationBar: Consumer<MainViewModel>(
        builder: (context, state, _) {
          return BottomNavigationBar(
            currentIndex: state.selectedScreenIndex,
            onTap: (value) => state.selectedScreenIndex = value,
            showUnselectedLabels: true,
            backgroundColor: secondary00,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/img/HomeIcon.svg',
                  colorFilter: ColorFilter.mode(
                    state.selectedScreenIndex == 0 ? Colors.green : Colors.grey,
                    BlendMode.srcIn
                  ),
                  width: 20,
                  height: 20,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/img/ChallengeIcon.svg',
                  colorFilter: ColorFilter.mode(
                    state.selectedScreenIndex == 1 ? Colors.green : Colors.grey,
                    BlendMode.srcIn
                  ),
                  width: 20,
                  height: 20,
                ),
                label: 'Tantangan',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/img/OrderIcon.svg',
                  colorFilter: ColorFilter.mode(
                    state.selectedScreenIndex == 2 ? Colors.green : Colors.grey,
                    BlendMode.srcIn
                  ),
                  width: 20,
                  height: 20,
                ),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/img/ProfileIcon.svg',
                  colorFilter: ColorFilter.mode(
                    state.selectedScreenIndex == 3 ? Colors.green : Colors.grey,
                    BlendMode.srcIn
                  ),
                  width: 20,
                  height: 20,
                ),
                label: 'Profil',
              ),
            ]
          );
        }
      ),
    );
  }
}