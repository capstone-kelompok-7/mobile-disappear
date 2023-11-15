import 'package:disappear/screens/search_product/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:disappear/screens/search_product/components/search_field.dart';

class SearchProductScreen extends StatelessWidget {
  static const String routePath = '/search-product';

  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const SearchField(),
      ),
      body: const ProductsScreen(),
    );
  }
}