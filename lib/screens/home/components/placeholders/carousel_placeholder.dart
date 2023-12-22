import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselPlaceholder extends StatelessWidget {
  const CarouselPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: neutral00,
        highlightColor: neutral20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          width: double.infinity,
          height: 200,
        )
      ),
    );
  }
}