import 'package:dio/dio.dart';
import 'package:disappear/models/product_model.dart';
import 'package:disappear/services/api.dart';

class ProductService {
  Future<List<ProductModel>> getBestSellerProducts() async {
    final dio = createDio();

    final Response response = await dio.get('/products?page=1&pageSize=5');

    if (response.data['data'] != null) {
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

    return [];
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

    if (response.data['data'] != null) {
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

    return [];
  }

  Future<ProductModel> getProductById(int id) async {
    final dio = createDio();

    final Response response = await dio.get('/products/$id');
    final data = response.data['data'];
    
    final product = ProductModel(
      id: data['id'] as int,
      name: data['name'] as String,
      description: data['description'] as String,
      gramPlastic: data['gram_plastic'] as int,
      stock: data['stock'] as int,
      discount: data['discount'] as int,
      exp: data['exp'] as int,
      totalReview: data['total_review'] as int,
      rating: data['rating'] as num,
      price: data['price'] as int,
      totalSold: data['total_sold'] as int,
      currentRatingOne: data['current_rating_one'] as int,
      currentRatingTwo: data['current_rating_two'] as int,
      currentRatingThree: data['current_rating_three'] as int,
      currentRatingFour: data['current_rating_four'] as int,
      currentRatingFive: data['current_rating_five'] as int,
    );

    if (data['image_url'] != null) {
      product.addImagesFromListOfMap((data['image_url'] as List<dynamic>).cast<Map<dynamic, dynamic>>());
    }

    if (data['reviews'] != null) {
      product.addReviewsFromListOfMap((data['reviews'] as List<dynamic>).cast<Map<dynamic, dynamic>>());
    }

    return product;
  }

  Future<List<ProductModel>> getOtherProducts() async {
    final dio = createDio();

    final Response response = await dio.get('/products?page=1');

    if (response.data['data'] != null) {
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

    return [];
  }

  Future<void> addProductToCart(int productId, int quantity) async {
    final dio = createDio();

    await dio.post('/carts', data: {
      'product_id': productId,
      'quantity': quantity
    });
  }
}