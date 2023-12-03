import 'package:dio/dio.dart';
import 'package:disappear/models/carousel_model.dart';
import 'package:disappear/services/api.dart';

class CarouselService {
  Future<List<CarouselModel>> getCarousel() async {
    final dio = createDio();

    Response response = await dio.get('/carousel');

    return response.data['data']
      .where((data) => data['photo'] != '')
      .map<CarouselModel>((data) => CarouselModel(id: data['id'], name: data['name'], photo: data['photo']))
      .toList();
  }
}