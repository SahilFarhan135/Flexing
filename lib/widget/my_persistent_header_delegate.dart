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
        decoration: const BoxDecoration(
            /*gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),*/
            ),
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        padding: const EdgeInsets.only(right: 0.0, top: 1.0, bottom: 1.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.01,),
              Image.asset(
                scale: 1.0,
                filterQuality: FilterQuality.high,
                "assets/images/logo_new.png",
                fit: BoxFit.cover,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              SizedBox(width: 10,),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              SizedBox(width: MediaQuery.of(context).size.width*0.03,)
            ],
          )
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
  double get maxExtent => 80;

  @override
  double get minExtent => 80;
}
