import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexing/utils/PlatformUtils.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    var aspectRatio =
        MediaQuery.of(context).size.width >= 1200 ? 5 / 2 : 9 / 16;
    print(aspectRatio);
    return CarouselSlider(
      options: CarouselOptions(
        height: isAndroid(context) ? 500 : null,
        autoPlay: true,
        disableCenter: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: aspectRatio,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          // Handle page change if needed
        },
      ),
      items: images.map((image) {
        return Container(
            decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ));
      }).toList(),
    );
  }
}
