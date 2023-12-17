// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:disappear/helper.dart';
import 'package:disappear/models/article_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/article/detail_articles_view_model.dart';
import 'package:disappear/view_models/article/bookmark_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailArticleScreen extends StatefulWidget {
  static String routePath = '/detail-article-screen';

  const DetailArticleScreen({Key? key}) : super(key: key);

  @override
  State<DetailArticleScreen> createState() => _DetailArticleScreenState();
}

class _DetailArticleScreenState extends State<DetailArticleScreen> {
  late final Future articleFuture = _getArticle();

  late final Future<List<ArticleModel>> otherArticleFuture = _getOtherArticles();

  Future<ArticleModel?> _getArticle() async {
    final articleViewModel =
        Provider.of<DetailArticlesViewModel>(context, listen: false);

    final article = await articleViewModel.getArticleById();

    return article;
  }

  Future<List<ArticleModel>> _getOtherArticles() async {
    final articleViewModel =
        Provider.of<DetailArticlesViewModel>(context, listen: false);

    final article = await articleViewModel.getOtherArticles();

    return article;
  }
  
  void _goToDetailArticleScreen(int articleId) {
    final articleViewModel = Provider.of<DetailArticlesViewModel>(context, listen: false);
    articleViewModel.articleId = articleId;

    Navigator.pushNamed(context, DetailArticleScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: articleFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
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
                  'Artikel',
                  style: semiBoldBody1.copyWith(color: whiteColor),
                ),
                centerTitle: true,
              ),
              body: const Center(child: Text('Artikel tidak ditemukan')));
        }

        if (snapshot.hasData) {
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
                'Artikel',
                style: semiBoldBody1.copyWith(color: whiteColor),
              ),
              centerTitle: true,
              actions: [
                Consumer<BookmarkViewModel>(
                  builder: (context, viewModel, _) {
                    return IconButton(
                      onPressed: () => viewModel.toggleBookmark(snapshot.data!.id),
                      icon: Icon(
                        viewModel.isBookmarked(snapshot.data!.id)
                            ? Icons.bookmark
                            : Icons.bookmark_outline,
                        size: 18,
                        color: whiteColor,
                      ),
                    );
                  }
                ),
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Judul
                      Text(snapshot.data!.title, style: semiBoldBody3),
                  
                      // Informasi Tanggal/View/Bookmark
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.author,
                                  style: regularBody8.copyWith(
                                    color: primary40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  formattedDate(snapshot.data!.date, format: 'd-MM-yyyy'),
                                  style: regularBody8.copyWith(
                                    color: primary40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  formatToTimeago(snapshot.data!.date),
                                  style: regularBody8.copyWith(
                                    color: primary40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                snapshot.data!.views.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Consumer<BookmarkViewModel>(
                                builder: (context, viewModel, _) {
                                  return IconButton(
                                    onPressed: () => viewModel.toggleBookmark(snapshot.data!.id),
                                    icon: Icon(
                                      viewModel.isBookmarked(snapshot.data!.id)
                                          ? Icons.bookmark
                                          : Icons.bookmark_outline,
                                      size: 18,
                                    ),
                                  );
                                }
                              ),
                            ],
                          )
                        ],
                      ),
                      
                      // Gambar Artikel
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          snapshot.data!.photo,
                          width: 400,
                          height: 202,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Html(data: snapshot.data!.content,),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                
                //Artikel Lainnya
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Artikel Lainnya',
                    style: semiBoldBody6.copyWith(color: primary40),
                  ),
                ),
                FutureBuilder(
                  future: otherArticleFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return SizedBox(
                        height: 175,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          shrinkWrap: true,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(width: 20,),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => _goToDetailArticleScreen(snapshot.data![index].id),
                              child: SizedBox(
                                width: 250,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.network(
                                          snapshot.data![index].photo,
                                          height: 175,
                                          width: 250,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 61.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(6.0),
                                            bottomRight: Radius.circular(6.0),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data![index].title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  }
                ),
              ],
            )
          );
        }

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
              'Artikel',
              style: semiBoldBody1.copyWith(color: whiteColor),
            ),
            centerTitle: true,
          ),
          body: const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: primary40,
                strokeWidth: 3,
              ),
            ),
          ),
        );
      },
    );
  }
}
