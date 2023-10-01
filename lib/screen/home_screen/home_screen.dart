import 'package:flexing/core/utils/PlatformUtils.dart';
import 'package:flexing/core/utils/dialog_utils.dart';
import 'package:flexing/core/utils/UrlUtils.dart';
import 'package:flexing/core/common_widget/bag_widget.dart';
import 'package:flexing/core/common_widget/banners.dart';
import 'package:flexing/core/common_widget/category_widget.dart';
import 'package:flexing/core/common_widget/my_persistent_header_delegate.dart';
import 'package:flexing/screen/category_screen/category_screen.dart';
import 'package:flexing/screen/details_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/common_widget/about_widget.dart';
import '../../data/local/data.dart';
import 'package:flexing/core/extension/build_context_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            ///Header
            SliverPersistentHeader(
                pinned: true, delegate: MyPersistentHeaderDelegate()),

            ///Banners
            const SliverToBoxAdapter(child: Banners()),

            ///space
            const SliverToBoxAdapter(
                child: SizedBox(
                    height: 30,
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.black12,
                    ))),

            ///trending details
            _trendingItem(context),

            ///trending items
            _trendingItemsGrid(context),

            ///trending item view more
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 30.0, bottom: 30.0, left: 20.0, right: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("View More"),
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

            ///categories
            _categoriesSliver(),

            ///instagram
            _instagramSliver(),

            ///about page
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
                          builder: (ctx) => CategoryScreen(
                              categoryItem: bagCategories[index]),
                        ),
                      );
                    },
                    child: Hero(
                        tag: 'CategoryScreen-${bagCategories[index].type}',
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
              crossAxisCount: context.getResponsiveColumnCount(),
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Hero(
                    tag: 'DetailsScreen:${bagItems[index].name}',
                    child: ProductCard(
                      bagItem: bagItems[index],
                    )),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => DetailsScreen(
                      bagItem: bagItems[index],
                    ),
                  ));
                },
              );
            },
          )),
    ]));
  }
}
