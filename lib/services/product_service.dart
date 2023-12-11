import 'package:dio/dio.dart';
import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/models/product/product_review_model.dart';
import 'package:disappear/services/api.dart';

class ProductService {
  Future<List<Product>> getBestSellerProducts() async {
    final dio = createDio();

    final Response response = await dio.get('/products?page=1&pageSize=5');

    if (response.data['data'] != null) {
      return response.data['data']
        .map((data) => Product.fromMap(response.data['data']))
        .toList();
    }

    return [];
  }

  Future<List<Product>> getProducts({
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
        .map<Product>((data) => Product.fromMap(data))
        .toList();
    }

    return [];
  }

  Future<Product?> getProductById(int id) async {
    final dio = createDio();

    final Response response = await dio.get('/products/$id');
    final data = response.data['data'];

    if (data != null) {
      return Product.fromMap(data);
    }

    return null;
  }

  Future<List<Product>> getOtherProducts() async {
    final dio = createDio();

    final Response response = await dio.get('/products/other-products');

    if (response.data['data'] != null) {
      return response.data['data']
        .map<Product>((data) => Product.fromMap(data))
        .toList();
    }

    return [];
  }

  Future<ProductReview?> getProductReviews({ required productId, int page = 1}) async {
    final dio = createDio();

    final Response response = await dio.get('/reviews/detail/$productId?page=$page');
    final data = response.data['data'];

    if (data != null) {
      return ProductReview.fromMap(data);
    }

    return null;
  }

  Future<void> addProductToCart(int productId, int quantity) async {
    final dio = createDio();

    await dio.post('/carts', data: {
      'product_id': productId,
      'quantity': quantity
    });
  }
}