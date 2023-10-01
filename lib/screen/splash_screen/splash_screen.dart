import 'package:flutter/material.dart';

import '../../core/common_widget/slide_up.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideUpWidget(
        child: Image.asset(
      "assets/images/logo_new.png",
      fit: BoxFit.cover,
    ));
  }
}
