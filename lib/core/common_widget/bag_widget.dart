import 'package:flutter/material.dart';

import '../../data/model/bag_item.dart';

class ProductCard extends StatelessWidget {
  final BagItem bagItem;

  const ProductCard({Key? key, required this.bagItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight =
              constraints.maxWidth * 0.9; // Maintain a 16:9 aspect ratio
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(height: imageHeight, bagItem.imagePath),
              Text(
                bagItem.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
    ;
  }
}
