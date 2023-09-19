import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 5 / 2,
        // Set the desired aspect ratio
        onPageChanged: (index, reason) {
          // Handle page change if needed
        },
      ),
      items: images.map((image) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              )),
            );
          },
        );
      }).toList(),
    );
  }
}
