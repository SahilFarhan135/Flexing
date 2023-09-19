import 'package:flexing/widget/rotating.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white, // Background color
      primaryColor: Colors.white, // Text color
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
      iconTheme: const IconThemeData(
        color: Colors.white, // Icon color
      ),
    ),
    home: FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 1500)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BagStoreHomePage();
        } else {
          return Scaffold(
            backgroundColor: Colors.white54,
            body: AnimatedTopWidget(
              child: Image.asset(
                "assets/images/flexing_logo.png",
                fit: BoxFit.cover,
              )
            ),
            );
        }
      },
    )));
