import 'package:dio/dio.dart';
import 'package:disappear/models/product_model.dart';
import 'package:disappear/services/api.dart';

class ProductService {
  Future<List<ProductModel>> getBestSellerProducts() async {
    final dio = createDio();

    final Response response = await dio.get('/products?page=1&pageSize=5');

    return response.data['data']
      .map<ProductModel>((data) {
        final product = ProductModel(
          id: data['id'] as int,
          name: data['name'] as String,
          rating: data['rating'] as num,
          price: data['price'] as int
        );

        if (data['image_url'] != null) {
          product.addImagesFromListOfMap((data['image_url'] as List<dynamic>).cast<Map<dynamic, dynamic>>());
        }

        return product;
      })
      .toList();
  }

  Future<List<ProductModel>> getProducts({
    required String keyword,
    required int page,
    int pageSize = 4,
    bool withPromo = false,
    int filterType = 0,
  }) async {
    final dio = createDio();
    
    String filter = '';

    if (filterType == 1) {
      filter = 'abjad';
    } else if (filterType == 2) {
      filter = 'terbaru';
    } else if (filterType == 3) {
      filter = 'termurah';
    } else if (filterType == 4) {
      filter = 'termahal';
    }

    final Response response = await dio.get('/products?search=$keyword&page=$page&pageSize=$pageSize&filter=$filter');

    return response.data['data']
      .map<ProductModel>((data) {
        final product = ProductModel(
          id: data['id'] as int,
          name: data['name'] as String,
          rating: data['rating'] as num,
          price: data['price'] as int
        );

        if (data['image_url'] != null) {
          product.addImagesFromListOfMap((data['image_url'] as List<dynamic>).cast<Map<dynamic, dynamic>>());
        }

        return product;
      })
      .toList();
  }
}