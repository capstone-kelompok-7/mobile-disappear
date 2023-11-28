import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/home/carousel_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideCarouselDotsIndicator extends StatelessWidget {
  const SlideCarouselDotsIndicator({
    super.key,
    required this.count
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
          ClipOval(
            child: Consumer<CarouselViewModel>(
              builder: (context, state, _) {
                return GestureDetector(
                  onTap: () => state.carouselController.jumpToPage(index),
                  child: Container(
                    color: state.index == index ? primary40 : neutral00,
                    width: 10,
                    height: 10,
                  ),
                );
              }
            ),
          ),
        separatorBuilder: (context, index) => const SizedBox(width: 3),
        itemCount: count,
      ),
    );
  }
}