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
  int currentRatingFive = 0;
  int currentRatingFour = 0;
  int currentRatingThree = 0;
  int currentRatingTwo = 0;
  int currentRatingOne = 0;

  List<CategoryModel> categories = [];

  List<ProductImageModel> images = [];

  List<ProductReviewModel> reviews = [];

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
    this.currentRatingFive = 0,
    this.currentRatingFour = 0,
    this.currentRatingThree = 0,
    this.currentRatingTwo = 0,
    this.currentRatingOne = 0,
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
    final productReview = ProductReviewModel(
      id: review['id'] as int,
      userId: review['user_id'] as int,
      name: review['name'] as String,
      description: review['description'] as String,
      photoProfile: review['photo_profile'] as String,
      rating: review['rating'] as num,
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