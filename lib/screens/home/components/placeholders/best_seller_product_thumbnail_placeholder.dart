import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerProductThumbnailPlaceholder extends StatelessWidget {
  const BestSellerProductThumbnailPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: neutral00,
      highlightColor: neutral20,
      child: Container(
        width: 130,
        height: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: whiteColor
        ),
      )
    );
  }
}