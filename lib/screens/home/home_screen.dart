import 'package:disappear/screens/home/components/best_seller_products.dart';
import 'package:disappear/screens/home/components/categories.dart';
import 'package:disappear/screens/home/components/slide_banner_dots_indicator.dart';
import 'package:disappear/screens/home/components/latest_articles.dart';
import 'package:disappear/screens/home/components/latest_challenges.dart';
import 'package:disappear/screens/home/components/slide_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routePath = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextFormField(),
        ),
        const SizedBox(height: 14,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SlideBanner(),
        ),
        const SizedBox(height: 14,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SlideBannerDotsIndicator()
        ),
        const SizedBox(height: 19,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Categories(),
        ),
        const SizedBox(height: 34,),
        const BestSellerProducts(),
        const SizedBox(height: 34,),
        const LatestChallenges(),
        const SizedBox(height: 34,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: LatestArticles(),
        ),
      ],
    );
  }
}