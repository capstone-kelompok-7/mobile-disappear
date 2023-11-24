import 'package:disappear/screens/home/components/best_seller_products.dart';
import 'package:disappear/screens/home/components/categories.dart';
import 'package:disappear/screens/home/components/slide_banner_dots_indicator.dart';
import 'package:disappear/screens/home/components/latest_articles.dart';
import 'package:disappear/screens/home/components/latest_challenges.dart';
import 'package:disappear/screens/home/components/slide_banner.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  static const String routePath = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Image.asset('assets/img/DisappearLogo.png', height: 30, width: 100,),
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset('assets/img/NotificationIcon.svg'),
          ),
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset('assets/img/CartIcon.svg')
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              style: regularBody6.copyWith(decoration: TextDecoration.none, decorationThickness: 0),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                fillColor: primary00,
                hintText: 'Pencarian',
                hintStyle: regularBody6.copyWith(color: primary40),
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: primary40,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.transparent)
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.transparent)
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.transparent)
                )
              ),
            ),
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
      ),
    );
  }
}