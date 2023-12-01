import 'package:disappear/models/category_model.dart';
import 'package:disappear/models/product_image_model.dart';
import 'package:intl/intl.dart';

class ProductModel {
  int id;
  String name;
  String? description;
  int? gramPlastic;
  int? stock;
  int? discount;
  int? exp;
  int rating;
  int price;
  int? totalReview;

  List<CategoryModel> categories = [];

  List<ProductImageModel> images = [];

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
    this.totalReview
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

  void addImagesFromListOfMap(List<Map> images) {
    for (Map image in images) {
      addImageFromMap(image);
    }
  }

  void addCategoryFromMap(Map category) {
    categories.add(CategoryModel(id: category['id'], name: category['name'], photo: category['photo']));
  }

  void addCategoriesFromListOfMap(List<Map> categories) {
    for (Map category in categories) {
      addCategoryFromMap(category);
    }
  }

  String get formattedPrice {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(price);
  }
}