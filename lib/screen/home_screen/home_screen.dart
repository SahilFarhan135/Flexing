import 'package:flexing/core/common_widget/async_widget.dart';
import 'package:flexing/core/common_widget/banners.dart';
import 'package:flexing/core/common_widget/best_seller_widget.dart';
import 'package:flexing/core/common_widget/my_persistent_header_delegate.dart';
import 'package:flexing/core/common_widget/offers.dart';
import 'package:flexing/core/utils/UrlUtils.dart';
import 'package:flexing/data/model/about_detail.dart';
import 'package:flexing/data/model/category_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/common_widget/about_widget.dart';
import '../../data/local/data.dart';
import '../../data/repository/about_repository.dart';
import '../../data/repository/banner_repository.dart';
import '../../data/repository/category_repository.dart';
import '../../screen/category_screen/category_screen.dart';

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
          ]),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            ///Header
            SliverPersistentHeader(
                pinned: true, delegate: MyPersistentHeaderDelegate()),

            _categoryOrOfferSliver(context),

            ///Banners
            _bannerSliver(context),

            ///space
            const SliverToBoxAdapter(
                child: SizedBox(
                    height: 30,
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.black12,
                    ))),

            ///trending details
            _trendingSliver(),

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

            /*///categories
            _categoriesSliver(),*/

            ///best seller
            _bestSellerSliver(),

            ///banner2
            _bannerSliver(context, showMargin: true),

            ///about us
            _aboutSliver(),
          ],
        ),
      ),
    ));
  }

  SliverToBoxAdapter _bannerSliver(BuildContext context,
      {bool showMargin = false}) {
    var isWeb = MediaQuery.of(context).size.width > 1000;
    return SliverToBoxAdapter(
        child: AsyncWidget<List<String>>(
            fetchData: BannerRepository(isWeb: isWeb).invoke,
            loadingWidget: const SizedBox(
                child: Center(
              child: CircularProgressIndicator(),
            )),
            errorWidget: (String error) {
              return Center(
                child: Text(error),
              );
            },
            successData: (List<String> data) {
              if (data.isEmpty) {
                return const Center(
                  child: Text('No data found'),
                );
              }
              return Banners(bannerImages: data, showMargin: showMargin);
            }));
  }

  SliverToBoxAdapter _categoryOrOfferSliver(BuildContext context) {
    var isWeb = MediaQuery.of(context).size.width > 1000;
    return SliverToBoxAdapter(
        child: AsyncWidget<List<CategoryItem>>(
            fetchData: CategoryRepository().invoke,
            loadingWidget: const SizedBox(
                child: Center(
              child: CircularProgressIndicator(),
            )),
            errorWidget: (String error) {
              return Center(
                child: Text(error),
              );
            },
            successData: (List<CategoryItem> data) {
              if (data.isEmpty) {
                return const Center(
                  child: Text('No data found'),
                );
              }
              return OfferOrCategoryListView(categoryItems: data);
            }));
  }

  SliverToBoxAdapter _trendingSliver() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            ' Trending ',
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
          AsyncWidget<List<CategoryItem>>(
              fetchData: CategoryRepository().invoke,
              loadingWidget: const SizedBox(
                  child: Center(
                child: CircularProgressIndicator(),
              )),
              errorWidget: (String error) {
                return Center(
                  child: Text(error),
                );
              },
              successData: (List<CategoryItem> data) {
                if (data.isEmpty) {
                  return const Center(
                    child: Text('No data found'),
                  );
                }
                return LayoutBuilder(builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
                      // Adjust the number of columns based on screen width
                      childAspectRatio: constraints.maxWidth > 600 ? 1 : 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  CategoryScreen(categoryItem: data[index]),
                            ),
                          );
                        },
                        child: Hero(
                            tag: 'BestSeller-${data[index].name}',
                            child: BestSellerWidget(
                              imagePath: data[index].imagePath,
                              onTap: () {},
                            )),
                      );
                    },
                  );
                });
              }),
        ],
      ),
    );
  }

  SliverToBoxAdapter _bestSellerSliver() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            ' BestSeller ',
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
          AsyncWidget<List<CategoryItem>>(
              fetchData: CategoryRepository().invoke,
              loadingWidget: const SizedBox(
                  child: Center(
                child: CircularProgressIndicator(),
              )),
              errorWidget: (String error) {
                return Center(
                  child: Text(error),
                );
              },
              successData: (List<CategoryItem> data) {
                if (data.isEmpty) {
                  return const Center(
                    child: Text('No data found'),
                  );
                }
                return LayoutBuilder(builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
                      // Adjust the number of columns based on screen width
                      childAspectRatio: constraints.maxWidth > 600 ? 1 : 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  CategoryScreen(categoryItem: data[index]),
                            ),
                          );
                        },
                        child: Hero(
                            tag: 'BestSeller-${data[index].name}',
                            child: BestSellerWidget(
                              imagePath: data[index].imagePath,
                              onTap: () {},
                            )),
                      );
                    },
                  );
                });
              }),
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

  SliverToBoxAdapter _aboutSliver() {
    return SliverToBoxAdapter(
        child: AsyncWidget<AboutDetail>(
            fetchData: AboutRepository().invoke,
            loadingWidget: const SizedBox(
                child: Center(
              child: CircularProgressIndicator(),
            )),
            errorWidget: (String error) {
              return Center(
                child: Text(error),
              );
            },
            successData: (AboutDetail data) {
              return AboutPage(aboutDetail: data);
            }));
  }
}
