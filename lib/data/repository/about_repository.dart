import 'dart:convert';
import 'dart:developer';

import 'package:flexing/data/model/about_detail.dart';
import 'package:flexing/data/repository/firebase_db_manager.dart';

class AboutRepository {
  final firebaseDbManager = FirebaseDBManager();

  Future<AboutDetail> invoke() async {
    var raw = await firebaseDbManager.getSingleData("main/about");
    AboutDetail aboutDetail = AboutDetail.fromJson(jsonDecode(jsonEncode(raw)));
    log("AboutDetail details: $aboutDetail");
    return aboutDetail;
  }
}
