import 'package:disappear/screens/auth/login_screen.dart';
import 'package:disappear/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  builder: (context) => LoginScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 40),
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: const Color(0xFF404040),
                // Tambahkan properti lain yang diinginkan di sini
              ),
              child: Text(
                'Masuk',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 40),
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(
                      width: 1, color: Colors.black), // Tambahkan garis pinggir
                ),
                backgroundColor: const Color(0xFFFFFFFF),
                // Tambahkan properti lain yang diinginkan di sini
              ),
              child: Text(
                'Daftar',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
