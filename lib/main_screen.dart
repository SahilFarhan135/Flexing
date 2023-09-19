import 'package:flexing/widget/bag_widget.dart';
import 'package:flexing/widget/banners.dart';
import 'package:flexing/widget/category_widget.dart';
import 'package:flexing/widget/my_persistent_header_delegate.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'model/bag_item.dart';

class BagStoreHomePage extends StatelessWidget {
  BagStoreHomePage({Key? key}) : super(key: key);

  int getResponsiveColumnCount(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200
          ? 6
          : MediaQuery.of(context).size.width >= 600
              ? 4
              : 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
              pinned: true, delegate: MyPersistentHeaderDelegate()),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const SliverSafeArea(sliver: SliverToBoxAdapter(child: Banners())),
          const SliverToBoxAdapter(
              child: SizedBox(
                  height: 30,
                  child: Divider(
                    thickness: 0.3,
                    color: Colors.black12,
                  ))),
          _trendingItem(context),
          _trendingItemsGrid(context),
          _categoriesSliver(),
          _instagramSliver(),
          SliverToBoxAdapter(
              child: Container(
            color: Colors.pinkAccent.withOpacity(0.2),
            height: 400,
          )),
        ],
      ),
    );
  }

  SliverToBoxAdapter _categoriesSliver() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            '--------- Categories --------',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
                  // Adjust the number of columns based on screen width
                  childAspectRatio: constraints.maxWidth > 600 ? 1.5 : 2.2,
                  // Adjust aspect ratio based on screen width
                  mainAxisSpacing: 10,
                ),
                itemCount: bagCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryWidget(
                    description: bagCategories[index].description,
                    title: bagCategories[index].name,
                    imagePath: bagCategories[index].imagePath,
                    onTap: () {},
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _instagramSliver() {
    return SliverToBoxAdapter(
        child: Column(children: [
      const SizedBox(
        height: 20,
      ),
      const Center(
        child: Text(
          'Follow Us on Instagram @flexing',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(
          height: 40,
          child: Divider(
            color: Colors.black,
          )),
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  shape: BoxShape.rectangle,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/bag2.png"),
                    fit: BoxFit.cover,
                  ),
                ));
          })
    ]));
  }

  SliverToBoxAdapter _trendingItem(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "--- Trending ---",
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _trendingItemsGrid(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getResponsiveColumnCount(context),
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // Replace with your grid item widgets
          return ProductCard(
            bagItem: bagItems[index],
          );
        },
        childCount: bagItems.length, // Number of grid items
      ),
    );
  }
}
