import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        return Card(
          color: Colors.grey.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
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
                    image: AssetImage(bagItem.imagePath),
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
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
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
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
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
