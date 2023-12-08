import 'package:dio/dio.dart';
import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/api.dart';

class ArticleService {
  Future<List<ArticleModel>> getLatestArticles() async {
    final dio = createDio();

    final Response response =
        await dio.get('/articles?page=1&search=&date_filter_type=');

    return response.data['data'].map<ArticleModel>((data) {
      return ArticleModel(
          id: data['id'] as int,
          title: data['title'] as String,
          photo: data['photo'] as String,
          content: data['content'] as String,
          author: data['author'] as String,
          date: data['date'] as String,
          views: data['views'] as int);
    }).toList();
  }

  Future<ArticleModel> getArticleById(int id) async {
    final dio = createDio();

    final Response response = await dio.get('/articles/$id');
    final data = response.data['data'];

    final article = ArticleModel(
        id: data['id'] as int,
        title: data['title'] as String,
        photo: data['photo'] as String,
        content: data['content'] as String,
        author: data['author'] as String,
        date: data['date'] as String,
        views: data['views'] as int);

    return article;
  }
}
