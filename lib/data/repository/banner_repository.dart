import 'dart:convert';

import 'package:flexing/data/repository/firebase_db_manager.dart';

class BannerRepository {
  final firebaseDbManager = FirebaseDBManager();
  final bool isWeb;

  BannerRepository({required this.isWeb});

  Future<List<String>> invoke() async {
    var categoryKey = isWeb ? "web" : "mobile";
    var rawData =
        await firebaseDbManager.getAllData("main/banners/$categoryKey");
    List<String> bannerUrls = [];
    rawData.forEach((key, value) {
      var bannerItem = jsonDecode(jsonEncode(value));
      bannerUrls.add(bannerItem);
    });
    print(bannerUrls);
    return bannerUrls;
  }
}
