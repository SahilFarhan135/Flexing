import 'package:flutter/material.dart';
import 'package:flexing/model/category_item.dart';
import 'package:flexing/model/bag_item.dart';
import 'package:flexing/screen/item_detail_screen.dart';

class CategoryItemsScreen extends StatelessWidget {
  final BagItem category;

  CategoryItemsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CategoryItemsGrid(category: category),),
    );
  }
}

class CategoryItemsGrid extends StatelessWidget {
  final BagItem category;

  CategoryItemsGrid({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        color: Colors.white,
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        margin: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
              /*gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),*/
              ),
          width: MediaQuery.of(context).size.width,
          height: 80.0,
          padding: const EdgeInsets.only(right: 0.0, top: 1.0, bottom: 1.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_sharp)),
                Image.asset(
                  scale: 1,
                  width: 100,
                  height: 50,
                  filterQuality: FilterQuality.high,
                  "assets/images/logo_new.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                /*SizedBox(
                  width: 10,
                ),*/
                // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                )
              ],
            )
          ]),
        ),
      ),
      Expanded(
          child: Hero(
        tag: 'category-${category.name}',
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
              crossAxisCount: 2, // Adjust as needed for responsiveness
            ),
            itemCount: 10,
            // Replace with the actual number of items for this category
            itemBuilder: (ctx, index) {
              // Replace with your item card widget
              return GestureDetector(
                child: ItemCard(categoryItem: category),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) =>
                          ItemDetailsScreen(category:category),
                    ),
                  );

                },
              );
            },
          ),
        ),
      ))
    ]);
  }
}

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
