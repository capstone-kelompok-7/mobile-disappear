import 'package:disappear/models/article_model.dart';
import 'package:disappear/screens/detail_article_screen.dart';
import 'package:disappear/screens/home/components/placeholders/latest_article_thumbnail_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class LatestArticleItem extends StatefulWidget {
  final ArticleModel article;

  const LatestArticleItem({super.key, required this.article});

  @override
  State<LatestArticleItem> createState() => _LatestArticleItemState();
}

class _LatestArticleItemState extends State<LatestArticleItem> {
  void _goToDetailArticleScreen() {
    Navigator.pushNamed(context, DetailArticleScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToDetailArticleScreen,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    widget.article.photo,
                    height: 120,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const LatestArticleThumbnailPlaceholder();
                      }

                      return child;
                    },
                  )
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.article.formattedDate, style: regularBody8.copyWith(color: neutral40)),
                      const SizedBox(height: 10,),
                      Text(widget.article.title, style: semiBoldBody6),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text('1 minggu yang lalu', style: mediumBody8),
                              const SizedBox(width: 10,),
                              const Icon(Icons.visibility, size: 18,),
                              const SizedBox(width: 5,),
                              Text(widget.article.views.toString(), style: regularBody8),
                            ],
                          ),
                          const Icon(Icons.bookmark_outline, size: 18,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}