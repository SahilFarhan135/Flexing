import 'package:firebase_core/firebase_core.dart';
import 'package:flexing/core/firebase_options.dart';
import 'package:flexing/data/repository/about_repository.dart';
import 'package:flexing/data/repository/category_repository.dart';
import 'package:flexing/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen/splash_screen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  AboutRepository().invoke();
  CategoryRepository().invoke();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 1500)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const HomeScreen();
            } else {
              return SplashScreen();
            }
          },
        ));
  }
}
