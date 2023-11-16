import 'package:disappear/screens/article_screen.dart';
import 'package:disappear/screens/home/components/latest_article_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class LatestArticles extends StatefulWidget {
  const LatestArticles({super.key});

  @override
  State<LatestArticles> createState() => _LatestArticlesState();
}

class _LatestArticlesState extends State<LatestArticles> {
  void _goToArticlesScreen() {
    Navigator.pushNamed(context, ArticleScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Artikel',
          style: semiBoldBody5.copyWith(color: primary40),
        ),
        const SizedBox(height: 15,),
        const LatestArticleItem(),
        const SizedBox(height: 10,),
        const LatestArticleItem(),
        const SizedBox(height: 10,),
        const LatestArticleItem(),
        const SizedBox(height: 21,),
        ElevatedButton(
          onPressed: _goToArticlesScreen,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: whiteColor,
            foregroundColor: primary40,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              side: BorderSide(width: 2, color: primary40)
            ),
          ),
          child: Text(
            'Lihat Semua Artikel',
            style: semiBoldBody3.copyWith(color: primary40, fontFamily: 'Poppins')
          )
        )
      ],
    );
  }
}