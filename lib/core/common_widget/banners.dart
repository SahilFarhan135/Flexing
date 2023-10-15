import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexing/core/utils/PlatformUtils.dart';
import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  final List<String> bannerImages;
  final bool showMargin;

  const Banners(
      {super.key, required this.bannerImages, this.showMargin = false});

  @override
  Widget build(BuildContext context) {
    var aspectRatio = MediaQuery.of(context).size.width >= 1200 ? 7 / 3 : 4 / 3;
    print(aspectRatio);
    return CarouselSlider(
      options: CarouselOptions(
        height: isAndroid(context) ? 500 : null,
        autoPlay: false,
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
      items: bannerImages.map((image) {
        return Container(
            margin: showMargin
                ? const EdgeInsets.all(20.0)
                : const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ));
      }).toList(),
    );
  }
}
