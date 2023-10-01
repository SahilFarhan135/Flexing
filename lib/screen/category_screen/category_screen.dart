import 'package:flexing/data/model/bag_item.dart';
import 'package:flutter/material.dart';
import 'package:flexing/screen/item_detail_screen.dart';
import 'package:flexing/screen/category_screen/widget/item_card.dart';
import 'package:flexing/data/local/data.dart';
import 'package:flexing/core/extension/build_context_extension.dart';
import 'package:flexing/screen/details_screen/detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final BagItem bagItem;

  CategoryScreen({required this.bagItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
            child: Hero(
          tag: 'CategoryScreen-${bagItem.name}',
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.easeInOut,
              ),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:
                    MediaQuery.of(context).size.width > 1100 ? 0.9 : 0.85,
                crossAxisCount: context.getResponsiveColumnCount(),
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              itemCount: bagItems.length,
              itemBuilder: (ctx, index) {
                // Replace with your item card widget
                return GestureDetector(
                  child: ItemCard(bagItem: bagItems[index]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            DetailsScreen(bagItem: bagItems[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        )),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final BagItem bagItem;

  ItemCard({required this.bagItem});

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
                      bagItem.imagePath), // Add your item image here
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  bagItem.name,
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
