import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ProductReviewItem extends StatefulWidget {
  const ProductReviewItem({super.key});

  @override
  State<ProductReviewItem> createState() => _ProductReviewItemState();
}

class _ProductReviewItemState extends State<ProductReviewItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://picsum.photos/30',
                    width: 30,
                    height: 30,
                  )
                ),
                const SizedBox(width: 8,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User 1'),
                    SizedBox(width: 5,),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 16, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 16, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 16, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 16, color: blackColor),
                        SizedBox(width: 4,),
                        Text('5.0')
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Text('Satu hari yang lalu', style: regularBody8,)
          ],
        ),
        const SizedBox(height: 12,),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network('https://picsum.photos/120/80'),
            ),
            const SizedBox(width: 8,),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network('https://picsum.photos/120/80'),
            ),
          ],
        ),
        const SizedBox(height: 12,),
        const Text(
          'Totebag kanvas ini jadi favorit sehari-hari saya. Kuat, awet, dan stylish! Bisa dipake buat belanja atau jalan-jalan. Plus, love the eco-friendly vibe! 💚🌿',
          style: TextStyle(fontSize: 12, height: 1.5),
        ),
      ],
    );
  }
}