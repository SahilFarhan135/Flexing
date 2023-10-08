import 'dart:convert';

import 'package:flexing/data/model/category_item.dart';
import 'package:flexing/data/repository/firebase_db_manager.dart';

class CategoryRepository {
  final firebaseDbManager = FirebaseDBManager();

  Future<List<CategoryItem>> invoke() async {
    var rawData = await firebaseDbManager.getAllData("main/categories");

    List<CategoryItem> categoryItems = [];

    rawData.forEach((key, value) {
      categoryItems.add(CategoryItem.fromJson(jsonDecode(jsonEncode(value))));
    });

    print(categoryItems);
    // Convert raw data to a list of CategoryItem objects
    return categoryItems;
  }
}
