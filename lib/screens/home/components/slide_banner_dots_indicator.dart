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
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
      ],
    );
  }
}