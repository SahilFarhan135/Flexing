import 'package:flexing/widget/rotating.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
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
            )),
          );
        }
      },
    )));
