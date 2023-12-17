// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:disappear/helper.dart';
import 'package:disappear/models/article/bookmarked_article_model.dart';
import 'package:disappear/screens/article/detail_article_screen.dart';
import 'package:disappear/screens/article/placeholders/list_article_placeholder.dart';
import 'package:disappear/screens/article/placeholders/list_article_thumbnail_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/article/Detail_articles_view_model.dart';
import 'package:disappear/view_models/article/bookmark_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveArticleScreen extends StatefulWidget {
  static const String routePath = '/save-article-screen';

  const SaveArticleScreen({Key? key}) : super(key: key);

  @override
  State<SaveArticleScreen> createState() => _SaveArticleScreenState();
}

class _SaveArticleScreenState extends State<SaveArticleScreen> {
  late Future<List<BookmarkedArticle>> _bookmarkedArticlesFuture;

  @override
  void initState() {
    final articleViewModel = Provider.of<BookmarkViewModel>(context, listen: false);
    _bookmarkedArticlesFuture = articleViewModel.getBookmarkedArticles();

    super.initState();
  }

  void _goToDetailArticleScreen(int articleId) {
    final articleViewModel = Provider.of<DetailArticlesViewModel>(context, listen: false);
    articleViewModel.articleId = articleId;

    Navigator.pushNamed(context, DetailArticleScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 32,
            color: whiteColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Simpan Artikel',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _bookmarkedArticlesFuture,
          builder: (context,snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () => _goToDetailArticleScreen(snapshot.data![index].articleId),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  snapshot.data![index].article.photo,
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
                                  Text(formattedDate(snapshot.data![index].article.date),
                                      style: mediumBody8.copyWith(color: primary40)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () => _goToDetailArticleScreen(snapshot.data![index].articleId),
                                    child: Text(snapshot.data![index].article.title, style: semiBoldBody6)
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
                                            formatToTimeago(snapshot.data![index].article.date),
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
                                            snapshot.data![index].article.views.toString(),
                                            style: regularBody8.copyWith(
                                              color: primary40,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Consumer<BookmarkViewModel>(
                                        builder: (context, viewModel, _) {
                                          return GestureDetector(
                                            onTap: () => viewModel.toggleBookmark(snapshot.data![index].articleId),
                                            child: Icon(
                                              viewModel.isBookmarked(snapshot.data![index].articleId)
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
                },
              );
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Tidak ada artikel tersimpan'));
            }

            return const Padding(
              padding: EdgeInsets.all(10),
              child: ListArticlePlaceholder(),
            );
          }
        ),
      ),
    );
  }
}
