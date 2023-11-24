import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddProductReviewViewModel extends ChangeNotifier {
  int _stars = 0;

  int get stars => _stars;

  set stars(int stars) {
    _stars = stars;
    notifyListeners();
  }

  List<PlatformFile> _files = [];

  List<PlatformFile> get files => _files;

  set files(List<PlatformFile> files) {
    _files = files;
    notifyListeners();
  }

  void removeFile(int index) {
    _files.removeAt(index);
    notifyListeners();
  }

  final descriptionController = TextEditingController();

  Future<void> submitReview() async {

  }
}