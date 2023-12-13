import 'package:disappear/models/category_model.dart';
import 'package:disappear/models/product_image_model.dart';
import 'package:disappear/models/review_model.dart';
import 'package:intl/intl.dart';

class ProductModel {
  int id;
  String name;
  String? description;
  int? gramPlastic;
  int? stock;
  int? discount;
  int? exp;
  num rating;
  int price;
  int? totalReview;
  int? totalSold;

  List<CategoryModel> categories = [];

  List<ProductImageModel> images = [];

  List<ProductReviewItemModel> reviews = [];

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    this.gramPlastic,
    this.stock,
    this.discount,
    this.exp,
    required this.rating,
    required this.price,
    this.totalReview,
    this.totalSold,
  });

  ProductImageModel? get thumbnail {
    if (images.isEmpty) {
      return null;
    }

    return images.first;
  }

  void addImageFromMap(Map image) {
    images.add(ProductImageModel(id: image['id'], imageUrl: image['image_url']));
  }

  void addImagesFromListOfMap(List<Map<dynamic, dynamic>> images) {
    for (Map image in images) {
      addImageFromMap(image);
    }
  }

  void addCategoryFromMap(Map category) {
    categories.add(CategoryModel(id: category['id'], name: category['name'], photo: category['photo']));
  }

  void addCategoriesFromListOfMap(List<Map<dynamic, dynamic>> categories) {
    for (Map category in categories) {
      addCategoryFromMap(category);
    }
  }

  void addReviewFromMap(Map review) {
    final productReview = ProductReviewItemModel(
      id: review['id'] as int,
      userId: review['user_id'] as int,
      name: review['name'] as String,
      description: review['description'] as String,
      photoProfile: review['photo_profile'] as String,
      rating: review['rating'] as num,
      date: review['date'] as String
    );

    if (review['photo'] != null) {
      productReview.addPhotosFromListOfMap((review['photo'] as List<dynamic>).cast<Map<dynamic, dynamic>>());
    }

    reviews.add(productReview);
  }

  void addReviewsFromListOfMap(List<Map<dynamic, dynamic>> categories) {
    for (Map category in categories) {
      addReviewFromMap(category);
    }
  }

  String get formattedPrice {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(price);
  }
}