import 'package:flexing/utils/PlatformUtils.dart';
import 'package:flexing/utils/dialog_utils.dart';
import 'package:flexing/utils/UrlUtils.dart';
import 'package:flexing/widget/bag_widget.dart';
import 'package:flexing/widget/banners.dart';
import 'package:flexing/widget/category_widget.dart';
import 'package:flexing/widget/my_persistent_header_delegate.dart';
import 'package:flexing/screen/category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';
import 'widget/about_widget.dart';
import 'model/bag_item.dart';

class BagStoreHomePage extends StatelessWidget {
  BagStoreHomePage({Key? key}) : super(key: key);

  int getResponsiveColumnCount(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200
          ? 5
          : MediaQuery.of(context).size.width >= 600
              ? 4
              : 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white,
            //Color(0xff91eae4),
          ]),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                pinned: true, delegate: MyPersistentHeaderDelegate()),
            SliverToBoxAdapter(child: Banners()),
            const SliverToBoxAdapter(
                child: SizedBox(
                    height: 30,
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.black12,
                    ))),
            _trendingItem(context),
            _trendingItemsGrid(context),
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 30.0, bottom: 30.0, left: 20.0, right: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("View More"),
                      style: TextButton.styleFrom(
                        textStyle: GoogleFonts.mulish(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        backgroundColor: Colors.black,
                        onSurface: Colors.grey,
                      ),
                    )),
              ),
            ),
            _categoriesSliver(),
            _instagramSliver(),
            SliverToBoxAdapter(
              child: AboutPage(),
            ),
          ],
        ),
      ),
    ));
  }

  SliverToBoxAdapter _categoriesSliver() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            ' Categories ',
            style: GoogleFonts.mulish(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              color: Colors.black,
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
                  childAspectRatio: constraints.maxWidth > 600 ? 1.5 : 1,
                  mainAxisSpacing: 0,
                ),
                itemCount: bagCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              CategoryItemsScreen(category: bagItems[index]),
                        ),
                      );
                    },
                    child: Hero(
                        tag: 'category-${bagCategories[index].type}',
                        child: CategoryWidget(
                          categoryItem: bagCategories[index],
                          onTap: () {},
                        )),
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
        height: 50,
      ),
      Center(
        child: TextButton(
          onPressed: () {
            launchInstagram();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Follow Us on ',
                style: GoogleFonts.mulish(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/images/insta.png",
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '@FlexingBags',
                style: GoogleFonts.mulish(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                launchInstagram();
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(bagItems[index].imagePath),
                      fit: BoxFit.contain,
                    ),
                  )),
            );
          })
    ]));
  }

  SliverToBoxAdapter _trendingItem(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Trending",
            style: GoogleFonts.mulish(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  _trendingItemsGrid(BuildContext context) {
    return SliverToBoxAdapter(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: MediaQuery.of(context).size.width < 600
                ? bagItems.length - 4
                : bagItems.length,
            // Number of grid items
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:
                  MediaQuery.of(context).size.width > 1100 ? 0.9 : 0.85,
              crossAxisCount: getResponsiveColumnCount(context),
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                bagItem: bagItems[index],
              );
            },
          )),
    ]));
  }

  SliverToBoxAdapter _aboutUsSliver(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/flexing_logo.png"),
                    fit: BoxFit.cover),
              )),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'About',
                  style: GoogleFonts.mulish(
                    fontSize: 40,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Us',
                  style: GoogleFonts.mulish(
                    color: Colors.black,
                    fontSize: 40,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Experience the epitome of elegance and functionality with our deluxe FLEXING BAGS. These stunning signature pieces are meticulously crafted, promising durability that aligns with high-end fashion. Showcasing an array of styles that effortlessly matches any outfit or mood, each bag is an embodiment of sheer luxury.',
                style: GoogleFonts.mulish(
                  fontSize: isAndroid(context) ? 14 : 22,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    ));
  }
}
