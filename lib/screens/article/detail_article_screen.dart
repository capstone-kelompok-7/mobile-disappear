// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:disappear/models/article_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/article/Detail_articles_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailArticleScreen extends StatefulWidget {
  static String routePath = '/detail-article-screen';

  DetailArticleScreen({Key? key}) : super(key: key);

  @override
  State<DetailArticleScreen> createState() => _DetailArticleScreenState();
}

class _DetailArticleScreenState extends State<DetailArticleScreen> {
  late final Future articleFuture = _getArticle();

  Future<ArticleModel?> _getArticle() async {
    final articleViewModel =
        Provider.of<DetailArticlesViewModel>(context, listen: false);

    final article = await articleViewModel.getArticleById();

    return article;
  }

  final List<String> imageUrls = [
    "https://pbs.twimg.com/media/F5A9JP8WcAATr6B?format=jpg&name=900x900",
    "https://pbs.twimg.com/media/F0bo5RyWwAETV8s?format=jpg&name=large",
    "https://pbs.twimg.com/media/F5A9JP8WcAATr6B?format=jpg&name=900x900",
  ];

  final List<String> titles = [
    '80 Persen Sampah di Laut adalah Sampah dari Daratan',
    'Penting 5 Manfaat Menjaga Kebersihan',
    "Title 3",
  ];

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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        //Judul
                        Text(snapshot.data!.title, style: semiBoldBody3),

                        const SizedBox(
                          height: 4.0,
                        ),

                        // Informasi Tanggal/View/Bookmark
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              snapshot.data!.date,
                              style: regularBody8.copyWith(
                                color: primary40,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '1 minggu yang lalu',
                              style: regularBody8.copyWith(
                                color: primary40,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
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
                            const Icon(
                              Icons.bookmark_border_outlined,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
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
                        Text(snapshot.data!.content),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    //Artikel Lainnya
                    const Text(
                      "Artikel Lainnya",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 175,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 250,
                            margin: const EdgeInsets.all(10.0),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      imageUrls[index],
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
                                      titles[index],
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              'Detail Produk',
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
