import 'package:disappear/models/product_image_model.dart';
import 'package:intl/intl.dart';

class ProductModel {
  int id;
  String name;
  int rating;
  int price;
  List<ProductImageModel> images = [];

  ProductModel({ required this.id, required this.name, required this.rating, required this.price });

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

  String get formattedPrice {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(price);
  }
}