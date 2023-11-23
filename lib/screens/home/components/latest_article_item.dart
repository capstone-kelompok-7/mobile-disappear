import 'package:disappear/screens/detail_article_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class LatestArticleItem extends StatefulWidget {
  const LatestArticleItem({super.key});

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
                  child: Image.network('https://picsum.photos/110/125')
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('24 Oktober 2023', style: regularBody8.copyWith(color: neutral40)),
                      const SizedBox(height: 10,),
                      const Text('Berapa Banyak Sampah Plastik yang Ada di Lautan?', style: semiBoldBody6),
                      const SizedBox(height: 15,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('1 minggu yang lalu', style: mediumBody8),
                              SizedBox(width: 10,),
                              Icon(Icons.visibility, size: 18,),
                              SizedBox(width: 5,),
                              Text('1045', style: regularBody8),
                            ],
                          ),
                          Icon(Icons.bookmark_outline, size: 18,),
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