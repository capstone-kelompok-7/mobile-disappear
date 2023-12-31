import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChallengePlaceholder extends StatelessWidget {
  const ChallengePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: neutral00,
      highlightColor: neutral20,
      child: Column(
        children: [
          Container(height: 171, color: primary00),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
