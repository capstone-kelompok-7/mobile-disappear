import 'package:carousel_slider/carousel_slider.dart';
import 'package:disappear/screens/home/components/placeholders/carousel_placeholder.dart';
import 'package:disappear/screens/home/components/carousel_dots_indicator.dart';
import 'package:disappear/view_models/home/carousel_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  Widget _buildView(state, AsyncSnapshot snapshot) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CarouselSlider(
        carouselController: state.carouselController,
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 3),
          onPageChanged: (index, _) => state.index = index,
        ),
        items: snapshot.data!
          .map<Widget>((carouselModel) {
            return Image.network(
              carouselModel.photo,
              loadingBuilder: (context, Widget child, loadingProgress) {
                if (loadingProgress != null) {
                  return const CarouselPlaceholder();
                }

                return child;
              }
            );
          })
          .toList(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselViewModel>(
      builder: (context, state, _) {
        return FutureBuilder(
          future: state.getCarousel(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SizedBox.shrink();
            }

            if (snapshot.hasData) {
              return Column(
                children: [
                  _buildView(state, snapshot),
                  const SizedBox(height: 10,),
                  CarouselDotsIndicator(count: snapshot.data!.length,)
                ],
              );
            }

            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const CarouselPlaceholder()
            );
          }
        );
      }
    );
  }
}