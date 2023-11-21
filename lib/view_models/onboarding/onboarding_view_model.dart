import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  final List<Map<String, String>> data = [{
    'picture': 'assets/img/Onboarding1.svg',
    'title': 'Selamat Datang',
    'description': 'Terima kasih telah memilih kami. Semoga kamu menemukan hal-hal yang menginspirasi di sini !!!'
  }, {
    'picture': 'assets/img/Onboarding2.svg',
    'title': 'Membawa Perubahan',
    'description': 'Mari kita ciptakan lingkungan yang aman dan nyaman untuk semuanya, memimpin perjalanan menuju dunia yang lebih hijau dan berkelanjutan.'
  }, {
    'picture': 'assets/img/Onboarding3.svg',
    'title': 'Menjual Produk Ramah Lingkungan',
    'description': 'Dengan beralih ke produk ramah lingkungan, sama saja dengan membantu menyelamatkan dunia.'
  }];

  int _selectedScreenIndex = 0;

  int get selectedScreenIndex => _selectedScreenIndex;

  set selectedScreenIndex(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }

  void skip() {
    selectedScreenIndex = data.length - 1;
  }

  void next() {
    selectedScreenIndex++;
  }
}