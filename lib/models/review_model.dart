class ProductReviewModel {
  int id;
  int userId;
  String name;
  String photoProfile;
  num rating;
  String description;

  List<PhotoReviewModel> photos = [];

  ProductReviewModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.photoProfile,
    required this.rating,
    required this.description,
  });

  void addPhotoFromMap(Map photo) {
    photos.add(PhotoReviewModel(id: photo['id'], photo: photo['photo']));
  }

  void addPhotosFromListOfMap(List<Map<dynamic, dynamic>> categories) {
    for (Map category in categories) {
      addPhotoFromMap(category);
    }
  }
}

class PhotoReviewModel {
  int id;
  String photo;

  PhotoReviewModel({
    required this.id,
    required this.photo,
  });
}