import 'package:flutter/material.dart';
import '../api/category_api.dart';
import '../models/category.dart';

class CategoryGridProvider extends ValueNotifier<List<Category>> {
  CategoryGridProvider() : super([]);

  CategoriesApi api = CategoriesApi();

  Future<void> loadItems() async {
    List<Category> categories = await api.getList();
    value = categories;

    notifyListeners();
  }

  Future<void> reload() async {
    value.clear();
    notifyListeners();
    await loadItems();
  }
}
