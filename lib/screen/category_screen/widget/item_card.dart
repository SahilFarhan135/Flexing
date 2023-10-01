import 'package:flexing/data/model/bag_item.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final BagItem categoryItem;

  ItemCard({required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight =
              constraints.maxWidth * 9 / 16; // Maintain a 16:9 aspect ratio
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: imageHeight,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  // Maintain a 16:9 aspect ratio for the item image
                  child: Image.asset(
                      categoryItem.imagePath), // Add your item image here
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  categoryItem.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
