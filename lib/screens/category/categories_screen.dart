import 'package:disappear/screens/category/components/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routePath = '/categories';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 54, horizontal: 29),
        itemCount: 24,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisExtent: 140,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
      ),
    );
  }
}