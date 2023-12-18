import 'package:disappear/helper.dart';
import 'package:disappear/models/article_model.dart';
import 'package:disappear/screens/article/detail_article_screen.dart';
import 'package:disappear/screens/article/placeholders/list_article_thumbnail_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/article/detail_articles_view_model.dart';
import 'package:disappear/view_models/article/bookmark_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListArticleItem extends StatefulWidget {
  final ArticleModel article;

  const ListArticleItem({super.key, required this.article});

  @override
  State<ListArticleItem> createState() => _ListArticleItemState();
}

class _ListArticleItemState extends State<ListArticleItem> {
  void _goToDetailArticleScreen() {
    final articleViewModel =
        Provider.of<DetailArticlesViewModel>(context, listen: false);
    articleViewModel.articleId = widget.article.id;

    Navigator.pushNamed(context, DetailArticleScreen.routePath);
  }

  void _toggleBookmark() async {
    final bookmarkViewModel = Provider.of<BookmarkViewModel>(context, listen: false);
    bookmarkViewModel.toggleBookmark(widget.article.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: _goToDetailArticleScreen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    widget.article.photo,
                    height: 120,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const ListArticleThumbnailPlaceholder();
                      }
                      return child;
                    },
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.article.formattedDate,
                        style: mediumBody8.copyWith(color: primary40)),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: _goToDetailArticleScreen,
                      child: Text(
                        widget.article.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: semiBoldBody6
                      )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              formatToTimeago(widget.article.date),
                              style: regularBody8.copyWith(
                                color: primary40,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.visibility,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.article.views.toString(),
                              style: regularBody8.copyWith(
                                color: primary40,
                              ),
                            ),
                          ],
                        ),
                        Consumer<BookmarkViewModel>(
                          builder: (context, viewModel, _) {
                            return GestureDetector(
                              onTap: _toggleBookmark,
                              child: Icon(
                                viewModel.isBookmarked(widget.article.id)
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                size: 18,
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
