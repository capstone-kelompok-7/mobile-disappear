// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SaveArticleScreen extends StatefulWidget {
  static const String routePath = '/save-article-screen';
  const SaveArticleScreen({Key? key}) : super(key: key);

  @override
  State<SaveArticleScreen> createState() => _SaveArticleScreenState();
}

class _SaveArticleScreenState extends State<SaveArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Artikel", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Disimpan",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // List Artikel
              SizedBox(
                height: 10.0,
              ),
              articleCard(),
              SizedBox(
                height: 10.0,
              ),
              articleCard(),
              SizedBox(
                height: 10.0,
              ),
              articleCard(),

              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class articleCard extends StatelessWidget {
  const articleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  "https://ecomaniac.org/wp-content/uploads/2022/11/The-Green-Environment.jpg",
                  width: 110,
                  height: 125,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '24 Oktober 2023',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Berapa Banyak Sampah Plastik yang Ada di Lautan?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1 minggu yang lalu',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        size: 18,
                      ),
                      Text(
                        '1045',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Icon(
                        Icons.bookmark,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
