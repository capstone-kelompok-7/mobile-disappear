import 'package:dio/dio.dart';
import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/api.dart';

final dummyData = [
  {
    "id": 1,
    "title": "Berapa Banyak Sampah Plastik yang Ada di Lautan",
    "photo": "https://res.cloudinary.com/dufa4bel6/image/upload/v1700058577/disappear/jqm5xihv6wu9qnyc7fcj.png",
    "author": "DISAPPEAR",
    "date": "2023-11-15T14:36:28Z",
    "views": 0
  },
  {
    "id": 3,
    "title": "Berapa Banyak Sampah \nPlastik yang Ada di Daratan?",
    "photo": "https://res.cloudinary.com/dufa4bel6/image/upload/v1700059410/disappear/ceyqccctbrmz5omukpzc.png",
    "author": "DISAPPEAR",
    "date": "2023-11-15T14:43:31Z",
    "views": 0
  }
];

class ArticleService {
  Future<List<ArticleModel>> getLatestArticles() async {
    final dio = createDio();

    // final Response response = await dio.get('/articles?page=1&pageSize=3');
    final response = await Future.delayed(const Duration(seconds: 1), () => dummyData);

    // return response.data['data']
    return response
      .map<ArticleModel>((data) {
        return ArticleModel(
          id: data['id'] as int,
          title: data['title'] as String,
          photo: data['photo'] as String,
          author: data['author'] as String,
          date: data['date'] as String,
          views: data['views'] as int
        );
      })
      .toList();
  }
}