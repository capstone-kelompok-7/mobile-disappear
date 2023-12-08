import 'package:carousel_slider/carousel_slider.dart';
import 'package:disappear/models/carousel_model.dart';
import 'package:disappear/screens/home/components/placeholders/carousel_placeholder.dart';
import 'package:disappear/screens/home/components/carousel_dots_indicator.dart';
import 'package:disappear/view_models/home/carousel_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatelessWidget {
  final List<CarouselModel> carousels;

  const Carousel({super.key, required this.carousels});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Consumer<CarouselViewModel>(
              builder: (context, state, _) {
                return CarouselSlider(
                  carouselController: state.carouselController,
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, _) => state.index = index,
                  ),
                  items: carousels
                    .map<Widget>((carouselModel) {
                      if (carouselModel.photo != '') {
                        return Image.network(
                          carouselModel.photo,
                          loadingBuilder: (context, Widget child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const CarouselPlaceholder();
                            }
                
                            return child;
                          }
                        );
                      }
                
                      return Image.asset('assets/img/BannerExample.png');
                    })
                    .toList(),
                );
              }
            )
          ),
          const SizedBox(height: 10,),
          CarouselDotsIndicator(count: carousels.length,)
        ],
      ),
    );
  }
}