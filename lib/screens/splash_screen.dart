import 'package:disappear/screens/login_screen.dart';
import 'package:disappear/screens/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routePath = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: 392,
                  height: 490,
                  color: const Color(0xFFD9D9D9),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 184,
                height: 24,
                color: const Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 388,
                  height: 16,
                  color: const Color(0xFFD9D9D9),
                  margin: const EdgeInsets.only(top: 16),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 388,
                  height: 16,
                  color: const Color(0xFFD9D9D9),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 344.89,
                  height: 16,
                  color: const Color(0xFFD9D9D9),
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 40),
                backgroundColor: const Color(0xFFACACAC),
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Masuk',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 40),
                backgroundColor: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Daftar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
