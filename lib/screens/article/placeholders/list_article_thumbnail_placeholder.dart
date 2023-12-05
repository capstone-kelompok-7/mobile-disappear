import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListArticleThumbnailPlaceholder extends StatelessWidget {
  const ListArticleThumbnailPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        enabled: true,
        baseColor: neutral00,
        highlightColor: neutral20,
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ));
  }
}
