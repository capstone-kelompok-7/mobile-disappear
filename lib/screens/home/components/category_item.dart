import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/img/CategoryExample.png', width: 60, height: 60,),
        const SizedBox(height: 2,),
        Text(
          'Kategori',
          style: mediumBody8.copyWith(color: neutral40)
        )
      ],
    );
  }
}