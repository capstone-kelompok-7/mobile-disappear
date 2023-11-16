import 'package:disappear/screens/home/components/category_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Kategori',
              style: semiBoldBody5.copyWith(color: primary40),
            ),
            Text(
              'Lihat semua',
              style: semiBoldBody8.copyWith(color: neutral30),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        const Row(
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