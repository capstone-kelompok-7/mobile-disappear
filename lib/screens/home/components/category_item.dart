import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/img/CategoryExample.png', width: 60, height: 60,),
        const SizedBox(height: 2,),
        const Text(
          'Kategori',
          style: TextStyle(fontSize: 12, height: 2),
        )
      ],
    );
  }
}