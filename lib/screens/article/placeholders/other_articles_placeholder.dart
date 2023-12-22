import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OtherArticlesPlaceholder extends StatelessWidget {
  const OtherArticlesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: neutral00,
      highlightColor: neutral20,
      child: SizedBox(
        height: 175,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Container(
              width: 250,
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10,),
          ],
        ),
      )
    );
  }
}