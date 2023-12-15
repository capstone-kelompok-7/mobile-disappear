import 'package:dio/dio.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class ReviewService {
  Future<dynamic> addReview({ required int productId, required int rating, required String description }) async {
    try {
      final dio = createDio();
      
      Response response = await dio.post(
        '/reviews',
        data: {
          'product_id': productId,
          'rating': rating,
          'description': description
        }
      );
      
      return response.data;
    } on DioException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> addReviewPhoto({ required int reviewId, required String filePath }) async {
    try {
      final dio = createDio();

      FormData formData = FormData.fromMap({
        'review_id': reviewId,
        'photo': await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
      });
      
      Response response = await dio.post(
        '/reviews/photos',
        data: formData
      );
      
      return response.data;
    } on DioException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}