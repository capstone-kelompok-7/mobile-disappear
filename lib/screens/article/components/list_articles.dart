import 'package:disappear/screens/article/article_screen.dart';
import 'package:disappear/screens/article/components/list_articles_item.dart';
import 'package:disappear/screens/article/placeholders/list_article_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/article/Detail_articles_view_model.dart';
import 'package:disappear/view_models/home/latest_articles_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListArticles extends StatefulWidget {
  const ListArticles({super.key});

  @override
  State<ListArticles> createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  void _goToArticlesScreen() {
    Navigator.pushNamed(context, ArticleScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Consumer<LatestArticlesViewModel>(
          builder: (context, state, _) {
            return FutureBuilder(
              future: state.getLatestArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Artikel tidak tersedia');
                }

                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ListArticleItem(article: snapshot.data![index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: snapshot.data!.length,
                  );
                }
                return const ListArticlePlaceholder();
              },
            );
          },
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
            child: Text('Memuat artikel lainnya',
                style: semiBoldBody3.copyWith(
                    color: primary40, fontFamily: 'Poppins')))
      ],
    );
  }
}
