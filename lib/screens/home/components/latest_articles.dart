import 'package:disappear/screens/home/components/latest_article_item.dart';
import 'package:flutter/material.dart';

class LatestArticles extends StatelessWidget {
  const LatestArticles({super.key});

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
          onPressed: () {},
          child: const Text('Lihat semua artikel')
        )
      ],
    );
  }
}