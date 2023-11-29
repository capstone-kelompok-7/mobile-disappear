import 'package:disappear/models/category_model.dart';
import 'package:disappear/services/category_service.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    final categoryService = CategoryService();
    return await categoryService.getCategories();
  }
}