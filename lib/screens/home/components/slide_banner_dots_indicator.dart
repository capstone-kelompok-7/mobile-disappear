import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class SlideBannerDotsIndicator extends StatelessWidget {
  const SlideBannerDotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            color: primary40,
            width: 10,
            height: 10,
          ),
        ),
        const SizedBox(width: 1,),
        ClipOval(
          child: Container(
            color: primary40,
            width: 10,
            height: 10,
          ),
        ),
        const SizedBox(width: 1,),
        ClipOval(
          child: Container(
            color: primary40,
            width: 10,
            height: 10,
          ),
        ),
        const SizedBox(width: 1,),
        ClipOval(
          child: Container(
            color: primary40,
            width: 10,
            height: 10,
          ),
        ),
        const SizedBox(width: 1,),
        ClipOval(
          child: Container(
            color: primary40,
            width: 10,
            height: 10,
          ),
        ),
      ],
    );
  }
}