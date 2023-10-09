import 'dart:collection';

import 'package:flexing/core/common_widget/AppBar.dart';
import 'package:flexing/core/common_widget/async_widget.dart';
import 'package:flexing/data/repository/images_repository.dart';
import 'package:flexing/screen/details_screen/widget/image_selection_widget.dart';
import 'package:flutter/material.dart';

import '../../data/model/bag_item.dart';
import '../../screen/details_screen/widget/multi_images_widget.dart';

class DetailsScreen extends StatefulWidget {
  final BagItem bagItem;

  const DetailsScreen({super.key, required this.bagItem});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _selectedColorCodes = "";
  int _selectedColorCodeIndex = 0;
  static const appBarHeight = 80;
  final HashMap<String, List<String>> bagsColors =
      HashMap<String, List<String>>();

  @override
  initState() {
    super.initState();
    ImagesRepository(widget.bagItem.categoryCode).invoke().then((value) {
      bagsColors.clear();
      bagsColors.addAll(value);
      if (_selectedColorCodes.isEmpty) {
        _selectedColorCodes = bagsColors.keys.first;
      } else {
        _selectedColorCodes =
            bagsColors.keys.elementAt(_selectedColorCodeIndex);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var isWeb = MediaQuery.of(context).size.width > 600;
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(showBackButton: true),
        body: isWeb ? webDesign(context) : mobileDesign(context),
      ),
    );
  }

  Widget mainItemImages(double width, double height) {
    return AsyncWidget<HashMap<String, List<String>>>(
        fetchData: ImagesRepository(widget.bagItem.categoryCode).invoke,
        loadingWidget: const SizedBox(
            width: 100,
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            )),
        errorWidget: (String error) {
          return Center(
            child: Text(error),
          );
        },
        successData: (HashMap<String, List<String>> colorCodesImages) {
          bagsColors.clear();
          bagsColors.addAll(colorCodesImages);
          if (_selectedColorCodes.isEmpty) {
            _selectedColorCodes = bagsColors.keys.first;
          } else {
            _selectedColorCodes =
                bagsColors.keys.elementAt(_selectedColorCodeIndex);
          }
          return MultiImagesWidget(
            images: bagsColors[_selectedColorCodes] ?? [],
          );
        });
  }

  Widget webDesign(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> colorCodes =
        bagsColors.values.map((list) => list.first).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///Item Images
        mainItemImages(
          size.width * 0.5,
          size.height - appBarHeight,
        ),

        SizedBox(
            width: size.width * 0.5,
            height: size.height - appBarHeight,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 40),

                ///Item name
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Stylish Leather Bag', // Replace with your item name
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15.0),

                /// Item Price
                const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      '\$99.99', // Replace with your item price
                      style: TextStyle(fontSize: 28.0, color: Colors.green),
                    )),
                const SizedBox(height: 15.0),

                /// Item Description
                const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'A fashionable and spacious leather bag suitable for any occasion. '
                      'It features multiple compartments and a durable design.',
                      style: TextStyle(fontSize: 20.0),
                    )),
                const SizedBox(height: 15.00),

                ///Colors
                const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'Colors',
                      style: TextStyle(fontSize: 24.0),
                    )),
                const SizedBox(height: 15.00),
                Container(
                  margin: const EdgeInsets.all(15),
                  width: size.width,
                  height: size.height * 0.20,
                  child: ItemImageList(
                    scrollDirection: Axis.horizontal,
                    imageUrls: colorCodes,
                    selectedImageIndex: _selectedColorCodeIndex,
                    mWidth: size.width * 0.10,
                    mHeight: size.height * 0.10,
                    onImageTapped: (index) {
                      setState(() {
                        _selectedColorCodeIndex = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15.00),

                ///Product Details
                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: Text(
                      'Product Details',
                      style: TextStyle(fontSize: 20.0),
                    )),
                ProductDetailsScreen()
              ],
            )),
      ],
    );
  }

  Widget mobileDesign(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> colorCodes =
        bagsColors.values.map((list) => list.first).toList();

    return ListView(
      shrinkWrap: true,
      children: [
        mainItemImages(size.width, size.height * 0.5),

        const SizedBox(
          height: 40,
        ),

        ///Item Name
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Text(
            'Stylish Leather Bag', // Replace with your item name
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15.0),

        /// Item Price
        const Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Text(
              '\$99.99', // Replace with your item price
              style: TextStyle(fontSize: 28.0, color: Colors.green),
            )),
        const SizedBox(height: 15.0),

        /// Item Description
        const Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Text(
              'A fashionable and spacious leather bag suitable for any occasion. '
              'It features multiple compartments and a durable design.',
              style: TextStyle(fontSize: 16.0),
            )),
        const SizedBox(height: 15.0),

        ///Colors
        const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Colors',
              style: TextStyle(fontSize: 20.0),
            )),
        const SizedBox(height: 15.0),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: size.height * 0.15,
          child: ItemImageList(
            scrollDirection: Axis.horizontal,
            imageUrls: colorCodes,
            selectedImageIndex: _selectedColorCodeIndex,
            mWidth: size.width * 0.25,
            mHeight: size.height * 0.15,
            onImageTapped: (index) {
              setState(() {
                _selectedColorCodeIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: 20.00),

        ///Product Details
        const Padding(
            padding: EdgeInsets.only(left: 20, right: 15),
            child: Text(
              'Product Details',
              style: TextStyle(fontSize: 20.0),
            )),
        ProductDetailsScreen()
      ],
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

  ProductDetailsScreen({super.key});

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
          physics: const NeverScrollableScrollPhysics(),
          itemCount: details.length,
          itemBuilder: (context, index) {
            return Container(
                margin: isWeb
                    ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                    : const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: Text(
                              details[index].key + " : ",
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: Text(
                              details[index].value,
                              style: const TextStyle(fontSize: 20.0),
                            )))
                  ],
                ));
          },
        ));
  }
}
