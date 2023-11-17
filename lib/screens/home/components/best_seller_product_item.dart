import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class BestSellerProductItem extends StatelessWidget {
  const BestSellerProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondary00,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Image.network('https://picsum.photos/126/120', width: 126, height: 120),
            const Padding(
              padding: EdgeInsets.only(top: 5, right: 6.5, bottom: 10, left: 6.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Totebag Kanvas', style: mediumBody6),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Icon(Icons.star_border, size: 12,),
                      SizedBox(width: 2,),
                      Icon(Icons.star_border, size: 12,),
                      SizedBox(width: 2,),
                      Icon(Icons.star_border, size: 12,),
                      SizedBox(width: 2,),
                      Icon(Icons.star_border, size: 12,),
                      SizedBox(width: 2,),
                      Icon(Icons.star_border, size: 12,),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text('Rp 20.000-', style: semiBoldBody7),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}