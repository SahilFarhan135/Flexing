import 'package:flexing/data/repository/firebase_db_manager.dart';

class AboutRepository {
  final firebaseDbManager = FirebaseDBManager();

  invoke() async {
    var aboutData= await firebaseDbManager.getSingleData("main");
    print(aboutData);
  }
}