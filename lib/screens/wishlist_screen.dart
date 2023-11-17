import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListScreen extends StatefulWidget {
  static const String routePath = '/wishlist';
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Keranjang',
        ),
      ),
    );
  }
}
