import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesPlaceholder extends StatelessWidget {
  const CategoriesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: neutral00,
      highlightColor: neutral20,
      child: SizedBox(
        height: 70,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: 70,
              height: 70,
              color: Colors.white,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 5
        ),
      )
    );
  }
}