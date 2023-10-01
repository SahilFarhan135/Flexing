import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/bag_item.dart';

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
        return Container(
            color: Colors.grey[200],
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // Ensure children expand horizontally
              children: [
                SizedBox(
                  height: 10.0,
                ),
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
                SizedBox(
                  height: 10.0,
                ),
                Center(
                    child: Text(
                  bagItem.name,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: nameFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ));
      },
    );
  }
}
