import 'package:dio/dio.dart';
import 'package:disappear/models/article_model.dart';
import 'package:disappear/models/carousel_model.dart';
import 'package:disappear/models/category_model.dart';
import 'package:disappear/models/home_challenge_model.dart';
import 'package:disappear/models/product_model.dart';
import 'package:disappear/services/api.dart';

class HomeService {
  Future<Map<dynamic, List>> getCarouselsCategoriesAndProducts() async {
    final dio = createDio();

    final Response response = await dio.get('/homepage/content');
    final data = response.data['data'];

    if (data != null) {
      return {
        'carousel': (data['carousel'] as List)
          .map((carousel) {
            return CarouselModel(id: carousel['id'], name: carousel['name'], photo: carousel['photo']);
          })
          .toList(),
        
        'category': (data['category'] as List)
          .map((category) {
            return CategoryModel(id: category['id'], name: category['name'], photo: category['photo']);
          })
          .toList(),
        
        'product': (data['product'] as List)
          .map((product) {
            return ProductModel(
              id: 1,
              name: product['name'] as String,
              price: product['price'] as int,
              rating: product['rating'] as num
            );
          })
          .toList(),
      };
    }

    return {};
  }

  Future<Map<dynamic, List>> getChallengesAndArticles() async {
    final dio = createDio();

    final Response response = await dio.get('/homepage/blog-posts');
    final data = response.data['data'];

    if (data != null) {
      return {
        'challenge': (data['challenge'] as List)
          .map((challenge) {
            return HomeChallengeModel(id: challenge['id'], title: challenge['title'], photo: challenge['photo'], exp: challenge['exp']);
          })
          .toList(),
        
        'article': (data['articles'] as List)
          .map((article) {
            return ArticleModel(
              id: article['id'],
              title: article['title'],
              photo: article['photo'],
              views: article['views'],
              author: article['authors'],
              date: article['created_at'],
            );
          })
          .toList(),
      };
    }

    return {};
  }
}