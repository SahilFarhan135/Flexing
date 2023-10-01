import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flexing/screen/details_screen/widget/image_selection_widget.dart';

import '../../data/model/bag_item.dart';

class DetailsScreen extends StatefulWidget {
  final BagItem bagItem;

  const DetailsScreen({required this.bagItem});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.bagItem.imageUrls.isEmpty) {
      widget.bagItem.imageUrls.add("assets/images/newbag1.jpeg");
      widget.bagItem.imageUrls.add("assets/images/newbag2.jpeg");
      widget.bagItem.imageUrls.add("assets/images/newbag3.jpeg");
      widget.bagItem.imageUrls.add("assets/images/newbag4.jpeg");
    }
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Mobile design
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Header
              constraints.maxWidth < 600 ? list(isWeb: false) : webDesign()
            ],
          );
        },
      ),
    ));
  }

  Widget heroWidgetWeb(double width, double height) {
    return Hero(
      tag: 'DetailsScreen:${widget.bagItem.name}',
      child: Expanded(
        child: Stack(
          children: [
            Image.asset(
              widget.bagItem.imageUrls[selectedImageIndex],
              fit: BoxFit.contain,
              width: width,
              height: height,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                width: width * 0.15,
                height: height,
                child: ItemImageList(
                  scrollDirection: Axis.vertical,
                  imageUrls: widget.bagItem.imageUrls,
                  selectedImageIndex: selectedImageIndex,
                  mWidth: width * 0.25,
                  mHeight: height * 0.25,
                  onImageTapped: (index) {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                ), // <-- Removed extra semicolon here
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget webDesign() {
    return Row(
      children: [
        heroWidgetWeb(
          MediaQuery.of(context).size.width * 0.5,
          MediaQuery.of(context).size.height - 80,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Expanded(
          child: list(isWeb: true),
        ),
      ],
    );
  }

  Widget list({bool isWeb = false}) {
    return ListView(
      shrinkWrap: true,
      children: [
        isWeb
            ? SizedBox.shrink()
            : Hero(
                tag: 'category-${widget.bagItem.name}',
                child: Image.asset(
                  widget.bagItem.imageUrls[selectedImageIndex],
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                )),

        isWeb
            ? SizedBox.shrink()
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ItemImageList(
                  imageUrls: widget.bagItem.imageUrls,
                  selectedImageIndex: selectedImageIndex,
                  mWidth: MediaQuery.of(context).size.width * 0.25,
                  mHeight: MediaQuery.of(context).size.height,
                  scrollDirection: Axis.horizontal,
                  onImageTapped: (index) {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                  // <-- Removed extra semicolon here
                )),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Stylish Leather Bag', // Replace with your item name
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8.0),
        // Item Price
        Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '\$99.99', // Replace with your item price
              style: TextStyle(fontSize: 18.0, color: Colors.green),
            )),
        SizedBox(height: 16.0),

        // Item Description
        Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'A fashionable and spacious leather bag suitable for any occasion. '
              'It features multiple compartments and a durable design.',
              style: TextStyle(fontSize: 16.0),
            )),
        SizedBox(height: 16.0),
        // Add to Cart Butto
      ],
    );
  }
}
