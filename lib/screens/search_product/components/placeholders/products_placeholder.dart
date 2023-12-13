import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsPlaceholder extends StatelessWidget {
  final int count;

  const ProductsPlaceholder({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: neutral00,
      highlightColor: neutral20,
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 130,
            height: 200,
          );
        },
      )
    );
  }
}