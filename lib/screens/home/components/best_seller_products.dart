import 'package:disappear/screens/home/components/best_seller_product_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class BestSellerProducts extends StatelessWidget {
  const BestSellerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Produk terlaris',
            style: semiBoldBody5.copyWith(color: primary40),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(width: 12,),
              BestSellerProductItem(),
              BestSellerProductItem(),
              BestSellerProductItem(),
              BestSellerProductItem(),
              BestSellerProductItem(),
              SizedBox(width: 12,)
            ],
          ),
        ),
      ],
    );
  }
}