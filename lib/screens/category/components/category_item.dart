import 'package:disappear/screens/search_product/search_product_screen.dart';
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
          Image.asset('assets/img/CategoryExample.png', width: 90, height: 90,),
          const SizedBox(height: 2,),
          const Text(
            'Kategori',
            style: TextStyle(fontSize: 12, height: 2),
          )
        ],
      ),
    );
  }
}