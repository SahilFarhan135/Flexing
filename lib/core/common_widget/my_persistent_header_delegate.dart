import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Return the widget you want to display as a persistent header
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      margin: const EdgeInsets.all(0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65.0,
        padding: const EdgeInsets.only(right: 0.0, top: 1.0, bottom: 1.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.005,
              ),
              Image.asset(
                scale: 1.0,
                width: 40,
                height: 40,
                filterQuality: FilterQuality.high,
                "assets/images/flex.png",
                fit: BoxFit.cover,
              ),
              Text(
                "FLEXiNG",
                style: GoogleFonts.zcoolKuaiLe(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.search)),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              )
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
  double get maxExtent => 65;

  @override
  double get minExtent => 65;
}
