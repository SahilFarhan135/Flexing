import 'dart:collection';
import 'dart:convert';

import 'package:flexing/data/repository/firebase_db_manager.dart';

class ImagesRepository {
  final firebaseDbManager = FirebaseDBManager();
  final String categoryKey;

  ImagesRepository(this.categoryKey);

  Future<HashMap<String, List<String>>> invoke() async {
    var rawData =
        await firebaseDbManager.getAllData("main/bag_images/$categoryKey");
    HashMap<String, List<String>> imageUrls = HashMap<String, List<String>>();
    rawData.forEach((key, value) {
      List<String> listOfImages = List.from(jsonDecode(jsonEncode(value)));
      imageUrls[key] = listOfImages;
    });
    print(imageUrls);
    return imageUrls;
  }
}
