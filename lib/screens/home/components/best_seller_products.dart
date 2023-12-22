import 'package:disappear/models/home/best_seller_product_model.dart';
import 'package:disappear/screens/home/components/best_seller_product_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class BestSellerProducts extends StatefulWidget {
  final List<BestSellerProduct> products;

  const BestSellerProducts({super.key, required this.products});

  @override
  State<BestSellerProducts> createState() => _BestSellerProductsState();
}

class _BestSellerProductsState extends State<BestSellerProducts> {
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
        const SizedBox(height: 10,),
        SizedBox(
          height: 210,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = BestSellerProductItem(product: widget.products[index]);

              if (index == 0) {
                return Row(
                  children: [
                    const SizedBox(width: 10,),
                    product
                  ]
                );
              }

              if (index == widget.products.length - 1) {
                return Row(
                  children: [
                    product,
                    const SizedBox(width: 10,),
                  ]
                );
              }

              return product;
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: widget.products.length,
          ),
        )
      ],
    );
  }
}