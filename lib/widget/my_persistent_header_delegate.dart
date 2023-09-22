import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Return the widget you want to display as a persistent header
    return Card(
      color: Colors.white,
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      margin: const EdgeInsets.all(0.0),
      child: Container(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.black12,
              Color(0xFF434343),
              Color(0xFF000000),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        padding: const EdgeInsets.only(
           right: 0.0, top: 1.0, bottom: 1.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                scale: 1.0,
                filterQuality: FilterQuality.high,"assets/images/flexing_logo.png", height: 200.0, width: 200,fit: BoxFit.cover,),
            ],
          ),
        ]),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // You can implement this method to determine if the header should rebuild.
    return false;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;
}
