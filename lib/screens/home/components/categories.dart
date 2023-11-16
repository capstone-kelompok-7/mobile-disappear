import 'package:disappear/screens/category/categories_screen.dart';
import 'package:disappear/screens/home/components/category_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  void _goToCategoriesScreen() {
    Navigator.pushNamed(context, CategoriesScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Kategori',
              style: TextStyle(fontSize: 16),
            ),
            GestureDetector(
              onTap: _goToCategoriesScreen,
              child: const Text(
                'Lihat semua',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryItem(),
            CategoryItem(),
            CategoryItem(),
            CategoryItem(),
            CategoryItem(),
          ],
        ),
      ],
    );
  }
}