import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChallengesPlaceholder extends StatelessWidget {
  const ChallengesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tantangan',
                style: semiBoldBody5.copyWith(color: primary40),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Shimmer.fromColors(
            enabled: true,
            baseColor: neutral00,
            highlightColor: neutral20,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 120,
                  height: 80,
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 120,
                  height: 80,
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}