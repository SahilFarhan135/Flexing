import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flexing/screen/details_screen/widget/image_selection_widget.dart';

import '../../data/model/bag_item.dart';
import 'package:flexing/core/common_widget/AppBar.dart';
import 'package:flexing/core/common_widget/about_widget.dart';

class DetailsScreen extends StatefulWidget {
  final BagItem bagItem;

  const DetailsScreen({required this.bagItem});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectedImageIndex = 0;

  static const appBarHeight = 80;

  @override
  Widget build(BuildContext context) {
    widget.bagItem.imageUrls.clear();
    widget.bagItem.imageUrls.add("assets/images/clan1.png");
    widget.bagItem.imageUrls.add("assets/images/clan2.png");
    widget.bagItem.imageUrls.add("assets/images/clan3.png");
    widget.bagItem.imageUrls.add("assets/images/clan4.png");
    widget.bagItem.imageUrls.add("assets/images/clan5.png");

    return Scaffold(
        appBar: CommonAppBar(showBackButton: true),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Header
                  constraints.maxWidth < 600
                      ? mobileDesign(context)
                      : webDesign(context),

                  ///Product Details
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Product Details',
                        style: TextStyle(fontSize: 20.0),
                      )),
                  ProductDetailsScreen()
                ],
              ));
            },
          ),
        ));
  }

  Widget mainItemImages(double width, double height) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          width: width * 0.20,
          height: height,
          child: ItemImageList(
            scrollDirection: Axis.vertical,
            imageUrls: widget.bagItem.imageUrls,
            selectedImageIndex: selectedImageIndex,
            mWidth: width * 0.20,
            mHeight: height * 0.25,
            onImageTapped: (index) {
              setState(() {
                selectedImageIndex = index;
              });
            },
          ), // <-- Removed extra semicolon here
        ),
        Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset(
              widget.bagItem.imageUrls[selectedImageIndex],
              fit: BoxFit.contain,
              width: width * 0.70,
              height: height,
            )),
      ],
    );
  }

  Widget webDesign(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Item Images
        mainItemImages(
          size.width * 0.5,
          size.height - appBarHeight,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),

              ///Item name
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Stylish Leather Bag', // Replace with your item name
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15.0),

              /// Item Price
              Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    '\$99.99', // Replace with your item price
                    style: TextStyle(fontSize: 28.0, color: Colors.green),
                  )),
              SizedBox(height: 15.0),

              /// Item Description
              Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'A fashionable and spacious leather bag suitable for any occasion. '
                    'It features multiple compartments and a durable design.',
                    style: TextStyle(fontSize: 20.0),
                  )),
              SizedBox(height: 15.00),

              ///Colors
              Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Colors',
                    style: TextStyle(fontSize: 24.0),
                  )),
              SizedBox(height: 15.00),
              Container(
                margin: const EdgeInsets.all(15),
                width: size.width,
                height: size.height * 0.20,
                child: ItemImageList(
                  scrollDirection: Axis.horizontal,
                  imageUrls: widget.bagItem.imageUrls,
                  selectedImageIndex: selectedImageIndex,
                  mWidth: size.width * 0.10,
                  mHeight: size.height * 0.10,
                  onImageTapped: (index) {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 15.00),
            ],
          ),
        ),
      ],
    );
  }

  Widget mobileDesign(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          mainItemImages(size.width, size.height * 0.5),

          SizedBox(
            height: 40,
          ),

          ///Item Name
          Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Text(
              'Stylish Leather Bag', // Replace with your item name
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15.0),

          /// Item Price
          Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Text(
                '\$99.99', // Replace with your item price
                style: TextStyle(fontSize: 28.0, color: Colors.green),
              )),
          SizedBox(height: 15.0),

          /// Item Description
          Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Text(
                'A fashionable and spacious leather bag suitable for any occasion. '
                'It features multiple compartments and a durable design.',
                style: TextStyle(fontSize: 16.0),
              )),
          SizedBox(height: 15.0),

          ///Colors
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Colors',
                style: TextStyle(fontSize: 20.0),
              )),
          SizedBox(height: 15.0),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            height: size.height * 0.15,
            child: ItemImageList(
              scrollDirection: Axis.horizontal,
              imageUrls: widget.bagItem.imageUrls,
              selectedImageIndex: selectedImageIndex,
              mWidth: size.width * 0.25,
              mHeight: size.height * 0.15,
              onImageTapped: (index) {
                setState(() {
                  selectedImageIndex = index;
                });
              },
            ),
          ),

          SizedBox(height: 20.00),

          ///Product Details
          Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: Text(
                'Product Details',
                style: TextStyle(fontSize: 20.0),
              )),
          ProductDetailsScreen()
        ],
      ),
    );
  }
}

class ProductDetail {
  final String key;
  final String value;

  ProductDetail({required this.key, required this.value});
}

class ProductDetailsScreen extends StatelessWidget {
  final List<ProductDetail> details = [
    ProductDetail(key: 'Type', value: 'Backpack'),
    ProductDetail(key: 'Ideal for', value: 'Unisex'),
    ProductDetail(key: 'Color', value: 'Black'),
    ProductDetail(key: 'Laptop Sleeve', value: 'Yes'),
    ProductDetail(key: 'Rain Cover', value: 'No'),
    ProductDetail(key: 'Material', value: 'Leather'),
    ProductDetail(key: 'Waterproof', value: 'Yes'),
    ProductDetail(key: 'Number of Compartments', value: '5'),
    ProductDetail(key: 'Domestic Warranty', value: '1 Year'),
    ProductDetail(key: 'Capacity', value: '37L'),
    ProductDetail(key: 'Size', value: 'M Size'),
    ProductDetail(key: 'Dimension', value: 'Small 4.5 ft'),
  ];

  @override
  Widget build(BuildContext context) {
    var isWeb = MediaQuery.of(context).size.width > 600;
    return Container(
        padding: EdgeInsets.all(isWeb ? 10 : 2),
        margin: EdgeInsets.all(isWeb ? 25 : 5),
        decoration: BoxDecoration(
            border: isWeb ? Border.all() : null,
            borderRadius: BorderRadius.circular(isWeb ? 10 : 0)),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: details.length,
          itemBuilder: (context, index) {
            return Container(
                margin: isWeb
                    ? EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                    : EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: Text(
                              details[index].key + " : ",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: Text(
                              details[index].value,
                              style: TextStyle(fontSize: 20.0),
                            )))
                  ],
                ));
          },
        ));
  }
}
