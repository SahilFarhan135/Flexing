import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/bag_item.dart';

class ProductCard extends StatelessWidget {
  final BagItem bagItem;

  const ProductCard({Key? key, required this.bagItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final cardWidth = constraints.maxWidth; // Calculate card width
        final imageHeight = cardWidth * 0.8; // Maintain aspect ratio
        final nameFontSize = cardWidth * 0.08;
        final descriptionFontSize = cardWidth * 0.06;
        final priceFontSize = cardWidth * 0.08;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          elevation: 4.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // Ensure children expand horizontally
            children: [
              //Product Image
              Container(
                height: imageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bagItem.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10.0),
                  //Product Name
                  Text(
                    bagItem.name,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: nameFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  //Product Description
                  Text(
                    bagItem.description,
                    maxLines: 2, // Adjust as needed
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
