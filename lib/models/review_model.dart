class ProductReviewModel {
  int id;
  String name;
  int currentRatingFive;
  int currentRatingFour;
  int currentRatingThree;
  int currentRatingTwo;
  int currentRatingOne;
  num rating;
  int totalReview;
  List <ProductReviewItemModel> reviews = [];

  ProductReviewModel({
    required this.id,
    required this.name,
    required this.currentRatingFive,
    required this.currentRatingFour,
    required this.currentRatingThree,
    required this.currentRatingTwo,
    required this.currentRatingOne,
    required this.rating,
    required this.totalReview,
  });

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
}

class ProductReviewItemModel {
  int id;
  int userId;
  String name;
  String photoProfile;
  num rating;
  String description;
  String date;

  List <PhotoReviewModel> photos = [];

  ProductReviewItemModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.photoProfile,
    required this.rating,
    required this.description,
    required this.date,
  });

  void addPhotoFromMap(Map photo) {
    photos.add(PhotoReviewModel(id: photo['id'], photo: photo['photo']));
  }

  void addPhotosFromListOfMap(List < Map < dynamic, dynamic >> categories) {
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