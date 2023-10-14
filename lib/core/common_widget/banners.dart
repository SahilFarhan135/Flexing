import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexing/core/utils/PlatformUtils.dart';
import 'package:flutter/material.dart';

import '../../data/local/data.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    var aspectRatio = MediaQuery.of(context).size.width >= 1200 ? 7 / 3 : 4 / 3;
    print(aspectRatio);
    return CarouselSlider(
      options: CarouselOptions(
        height: isAndroid(context) ? 500 : null,
        autoPlay: true,
        disableCenter: true,
        enlargeCenterPage: true,
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
