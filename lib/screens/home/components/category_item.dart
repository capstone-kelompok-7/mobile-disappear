import 'package:disappear/screens/search_product/search_product_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  void _goToSearchScreen() {
    Navigator.pushNamed(context, SearchProductScreen.routePath);
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToSearchScreen,
      child: Column(
        children: [
          Image.asset('assets/img/CategoryExample.png', width: 60, height: 60,),
          const SizedBox(height: 2,),
          Text(
            'Kategori',
            style: mediumBody8.copyWith(color: neutral40)
          )
        ],
      ),
    );
  }
}