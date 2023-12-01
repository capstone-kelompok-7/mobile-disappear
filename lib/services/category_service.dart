import 'package:dio/dio.dart';
import 'package:disappear/models/category_model.dart';
import 'package:disappear/services/api.dart';

class CategoryService {
  Future<List<CategoryModel>> getHomeCategories() async {
    final dio = createDio();

    Response response = await dio.get('/categories?page=1&pageSize=5');

    return response.data['data']
      .map<CategoryModel>((data) => CategoryModel(id: data['id'], name: data['name'], photo: data['photo']))
      .toList();
  }

  Future<List<CategoryModel>> getCategories() async {
    final dio = createDio();

    Response response = await dio.get('/categories');

    return response.data['data']
      .map<CategoryModel>((data) => CategoryModel(id: data['id'], name: data['name'], photo: data['photo']))
      .toList();
  }
}