import 'package:disappear/models/category_model.dart';
import 'package:disappear/screens/category/categories_screen.dart';
import 'package:disappear/screens/home/components/category_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final List<CategoryModel> categories;

  const Categories({super.key, required this.categories});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  void _goToCategoriesScreen() {
    Navigator.pushNamed(context, CategoriesScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Kategori',
                style: semiBoldBody5.copyWith(color: primary40),
              ),
              GestureDetector(
                onTap: _goToCategoriesScreen,
                child: Text(
                  'Lihat semua',
                  style: semiBoldBody8.copyWith(color: neutral30),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          SizedBox(
            height: 80,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CategoryItem(category: widget.categories[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: widget.categories.length,
            ),
          )
        ],
      ),
    );
  }
}