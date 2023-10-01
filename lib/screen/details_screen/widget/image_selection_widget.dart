import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemImageList extends StatelessWidget {
  final List<String> imageUrls;
  final int selectedImageIndex;
  final Function(int) onImageTapped;
  final double mWidth;
  final Axis scrollDirection;
  final double mHeight;

  ItemImageList(
      {required this.imageUrls,
      required this.selectedImageIndex,
      required this.mWidth,
      required this.mHeight,
      required this.scrollDirection,
      required this.onImageTapped});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageUrls.length,
      scrollDirection: scrollDirection,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            onImageTapped(index);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: index == selectedImageIndex
                    ? Colors.blue
                    : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              imageUrls[index],
              height: mHeight,
              width: mWidth,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
