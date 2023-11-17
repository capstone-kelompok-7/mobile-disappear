import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideBanner extends StatelessWidget {
  const SlideBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 3)
        ),
        items: [1,2,3,4,5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset('assets/img/BannerExample.png');
            },
          );
        }).toList(),
      ),
    );
  }
}