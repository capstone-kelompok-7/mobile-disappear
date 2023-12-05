import 'package:disappear/view_models/article/carouselArticle_view_model.dart';
import 'package:disappear/view_models/home/carousel_view_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselArticleComponent extends StatelessWidget {
  final List<String> images;
  final List<String> titles;
  final CarouselArticleViewModel carouselArticleViewModel;

  const CarouselArticleComponent({
    super.key,
    required this.images,
    required this.titles,
    required this.carouselArticleViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel
        CarouselSlider(
          carouselController: carouselArticleViewModel.carouselController,
          options: CarouselOptions(
            height: 195.0,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              carouselArticleViewModel.onPageChanged(index);
            },
          ),
          items: images.asMap().entries.map((entry) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(entry.value),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 5,
                      right: 5,
                      child: Container(
                        height: 81.0,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          titles[entry.key],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),

        // Indicator Carousel
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselArticleViewModel.animateToPage(entry.key),
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
                          : Colors.grey)
                      .withOpacity(
                          carouselArticleViewModel.currentIndex == entry.key
                              ? 0.4
                              : 0.9),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
