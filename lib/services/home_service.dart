import 'package:dio/dio.dart';
import 'package:disappear/models/home/carousel_category_product_model.dart';
import 'package:disappear/models/home/challenge_article.dart';
import 'package:disappear/services/api.dart';

class HomeService {
  Future<CarouselCategoryProduct> getCarouselsCategoriesAndProducts() async {
    final dio = createDio();

    final Response response = await dio.get('/homepage/content');
    
    return CarouselCategoryProduct.fromMap(response.data['data']);
  }

  Future<ChallengeArticle> getChallengesAndArticles() async {
    final dio = createDio();

    final Response response = await dio.get('/homepage/blog-posts');
    
    return ChallengeArticle.fromMap(response.data['data']);
  }
}