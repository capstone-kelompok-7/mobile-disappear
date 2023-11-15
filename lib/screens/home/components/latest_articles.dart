import 'package:disappear/screens/article_screen.dart';
import 'package:disappear/screens/home/components/latest_article_item.dart';
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
        const Text(
          'Artikel',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16,),
        const LatestArticleItem(),
        const SizedBox(height: 10,),
        const LatestArticleItem(),
        const SizedBox(height: 10,),
        const LatestArticleItem(),
        const SizedBox(height: 21,),
        ElevatedButton(
          onPressed: _goToArticlesScreen,
          child: const Text('Lihat semua artikel')
        )
      ],
    );
  }
}