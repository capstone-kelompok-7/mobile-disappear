import 'package:disappear/models/home/challenge_article.dart';
import 'package:disappear/screens/article/article_screen.dart';
import 'package:disappear/screens/home/components/latest_article_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/article/bookmark_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestArticles extends StatefulWidget {
  final List<Article> articles;

  const LatestArticles({super.key, required this.articles});

  @override
  State<LatestArticles> createState() => _LatestArticlesState();
}

class _LatestArticlesState extends State<LatestArticles> {
  @override
  void initState() {
    final bookmarkViewModel = Provider.of<BookmarkViewModel>(context, listen: false);
    bookmarkViewModel.getBookmarkedArticleIds();

    super.initState();
  }

  void _goToArticlesScreen() {
    Navigator.pushNamed(context, ArticleScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Artikel',
            style: semiBoldBody5.copyWith(color: primary40),
          ),
          const SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => LatestArticleItem(article: widget.articles[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: widget.articles.length,
          ),
          const SizedBox(
            height: 21,
          ),
          ElevatedButton(
              onPressed: _goToArticlesScreen,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: whiteColor,
                foregroundColor: primary40,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(width: 2, color: primary40)),
              ),
              child: Text('Lihat Semua Artikel',
                  style: semiBoldBody3.copyWith(
                      color: primary40, fontFamily: 'Poppins')))
        ],
      ),
    );
  }
}
