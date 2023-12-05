// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:disappear/screens/article/components/list_articles.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ArticleScreen extends StatefulWidget {
  static const String routePath = '/article-screen';
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => buildScreen(context);

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  List<String> sortOptions = ["Urutan Berdasarkan", "Option 2", "Option 3"];
  String selectedSortOption = "Urutan Berdasarkan";

  void onSortOptionChanged(String newValue) {
    setState(() {
      selectedSortOption = newValue;
    });
  }

  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
          ),
        ),
        title: const Text(
          "Artikel",
          style: semiBoldBody1,
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
            children: [
              Container(
                child: Builder(
                  builder: (context) {
                    List<String> images = [
                      "https://pbs.twimg.com/media/F-USECJX0AAfKD9?format=jpg&name=medium",
                      "https://pbs.twimg.com/media/F9uidkEbgAAWIvt?format=jpg&name=large",
                      "https://ecomaniac.org/wp-content/uploads/2022/11/The-Green-Environment.jpg",
                      "https://pbs.twimg.com/media/F5A9JP8WcAATr6B?format=jpg&name=900x900",
                      "https://pbs.twimg.com/media/F0bo5RyWwAETV8s?format=jpg&name=large",
                    ];

                    List<String> titles = [
                      'Berapa Banyak Sampah Plastik yang Ada di Lautan?',
                      'Judul Teks Gambar 2',
                      'Judul Teks Gambar 3',
                      'Judul Teks Gambar 4',
                      'Judul Teks Gambar 5',
                    ];

                    return Column(
                      children: [
                        // Carousel
                        CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            height: 195.0,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              currentIndex = index;
                              setState(() {});
                            },
                          ),
                          items: images.asMap().entries.map((entry) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(6.0),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            entry.value,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 5,
                                      right: 5,
                                      child: Container(
                                        height: 81.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(6.0),
                                            bottomRight: Radius.circular(6.0),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          titles[entry.key],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }).toList(),
                        ),
                        // Indicator Carousel
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () =>
                                  carouselController.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? primary40
                                          : primary40)
                                      .withOpacity(currentIndex == entry.key
                                          ? 0.4
                                          : 0.9),
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        // Dropdown
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButton<String>(
                                value: selectedSortOption,
                                onChanged: (String? newValue) {
                                  onSortOptionChanged(newValue!);
                                },
                                items: sortOptions.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                underline: Container(),
                              ),
                              const Column(
                                children: [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  ListArticles(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
