import 'package:disappear/models/category_model.dart';
import 'package:disappear/screens/category/components/category_item_thumbnail_placeholder.dart';
import 'package:disappear/screens/search_product/search_product_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Builder(
              builder: (context) {
                if (widget.category.photo != '') {
                  return Image.network(
                    widget.category.photo,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const CategoryItemThumbnailPlaceholder();
                      }
                  
                      return child;
                    },
                  );
                }

                return Image.asset(
                  'assets/img/CategoryExample.png',
                  width: 90,
                  height: 90,
                );
              }
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            widget.category.name,
            style: const TextStyle(fontSize: 12, height: 2),
          )
        ],
      ),
    );
  }
}