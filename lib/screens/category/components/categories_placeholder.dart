import 'package:disappear/screens/category/components/category_item_thumbnail_placeholder.dart';
import 'package:flutter/material.dart';

class CategoriesPlaceholder extends StatelessWidget {
  const CategoriesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return const CategoryItemThumbnailPlaceholder();
      },
    );
  }
}