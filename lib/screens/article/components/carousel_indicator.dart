import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselIndicator extends StatelessWidget {
  final int currentIndex;
  final CarouselController carouselController;
  final List<String> images;

  const CarouselIndicator({
    Key? key,
    required this.currentIndex,
    required this.carouselController,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => carouselController.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : Colors.white)
                  .withOpacity(currentIndex == entry.key ? 0.4 : 0.9),
            ),
          ),
        );
      }).toList(),
    );
  }
}
