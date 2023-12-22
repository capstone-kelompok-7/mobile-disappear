import 'package:dio/dio.dart';
import 'package:disappear/main.dart';
import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/screens/components/flushbar.dart';
import 'package:disappear/screens/product_review/components/add_review_failed_dialog.dart';
import 'package:disappear/screens/product_review/components/add_review_success_dialog.dart';
import 'package:disappear/services/review_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddProductReviewViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OrderDetailByIdModel? orderDetail;

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

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> submitReview() async {
    if (formKey.currentState!.validate()) {

      isLoading = true;

      final service = ReviewService();

      try {
        List<Future> addReviewFutures = orderDetail!.orderDetails
          .map((order) {
            return service.addReview(
              productId: order.productId,
              rating: stars,
              description: descriptionController.text
            );
          })
          .toList();
        
        final addReviewResponses = await Future.wait(addReviewFutures);

        for (final addReviewResponse in addReviewResponses) {
          for (final file in _files) {
            await service.addReviewPhoto(reviewId: addReviewResponse['data']['id'], filePath: file.path!);
          }
        }

        _showSuccessMessage();
      } on DioException catch (e) {
        if ([400, 403].contains(e.response?.statusCode)) {
          showFailedFlushbar(message: e.response!.data['message']);
        } else {
          _showFailedMessage();
        }

        debugPrint(e.toString());
      } finally {
        isLoading = false;
      }
    }
  }

  String? validateDescription(String? value) {
    if (value == null || value == '') {
      return 'Harap masukkan deskripsi';
    }

    return null;
  }

  void _showSuccessMessage() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => const AddReviewSuccessDialog()
    );
  }

  void _showFailedMessage() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => const AddReviewFailedDialog()
    );
  }
}