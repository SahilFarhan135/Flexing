import 'package:firebase_core/firebase_core.dart';
import 'package:flexing/firebase_options.dart';
import 'package:flexing/widget/rotating.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flexing/widget/slide_up.dart';


import 'main_screen.dart';


Future main() async{
WidgetsFlutterBinding.ensureInitialized();
if(kIsWeb){
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
FirebaseDatabase.instance.reference().child("users").push().set({
  "name": "John Smith",
  "age": 30
});
runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 1500)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return BagStoreHomePage();
            } else {
              return SlideUpWidget(
                    child: Image.asset(
                      "assets/images/logo_new.png",
                      fit: BoxFit.cover,
                    ));
              }
            },

        ));
  }


}
