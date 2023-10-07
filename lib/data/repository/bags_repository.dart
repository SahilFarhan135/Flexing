import 'dart:convert';

import 'package:flexing/data/repository/firebase_db_manager.dart';
import 'package:flexing/data/model/category_item.dart';
import 'package:flexing/data/model/bag_item.dart';

class BagsRepository {
  final firebaseDbManager = FirebaseDBManager();
  final String categoryKey;

  BagsRepository(this.categoryKey);

  Future<List<BagItem>> invoke() async {
    var rawData =
        await firebaseDbManager.getAllData("main/bags/$categoryKey");
    List<BagItem> bagItems = [];
    rawData.forEach((key, value) {
      var bagItem=BagItem.fromJson(jsonDecode(jsonEncode(value)));
      bagItems.add(bagItem);
    });
    print(BagItem);
    return bagItems;
  }
}
