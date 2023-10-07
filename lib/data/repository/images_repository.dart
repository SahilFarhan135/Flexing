import 'dart:convert';

import 'package:flexing/data/repository/firebase_db_manager.dart';
import 'package:flexing/data/model/category_item.dart';
import 'package:flexing/data/model/bag_item.dart';
import 'package:flexing/data/model/bag_image_item.dart';

class ImagesRepository {
  final firebaseDbManager = FirebaseDBManager();
  final String categoryKey;

  ImagesRepository(this.categoryKey);

  Future<List<String>> invoke() async {
    var rawData = await firebaseDbManager
        .getAllData("main/bag_images/$categoryKey");
    List<String> imageUrls = [];
    rawData.forEach((key, value) {
      imageUrls.add((jsonDecode(jsonEncode(value))));
    });
    print(imageUrls);
    return imageUrls;
  }
}
