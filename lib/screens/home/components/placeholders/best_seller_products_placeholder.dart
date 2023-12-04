import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerProductsPlaceholder extends StatelessWidget {
  const BestSellerProductsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: neutral00,
      highlightColor: neutral20,
      child: SizedBox(
        height: 200,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 130,
              height: 200,
            ),
            const SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 130,
              height: 200,
            ),
            const SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 130,
              height: 200,
            ),
            const SizedBox(width: 10,)
          ],
        ),
      )
    );
  }
}