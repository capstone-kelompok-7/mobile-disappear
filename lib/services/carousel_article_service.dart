import 'package:dio/dio.dart';
import 'package:disappear/models/carousel_article_model.dart';
import 'package:disappear/services/api.dart';

class CarouselArticleService {
  Future<List<CarouselArticleModel>> getCarouselArticle() async {
    final dio = createDio();

    Response response = await dio.get('/articles/latest-article');

    return response.data['data']
        .where((data) => data['photo'] != '')
        .map<CarouselArticleModel>(
            (data) => CarouselArticleModel.fromJson(data))
        .toList();
  }
}
