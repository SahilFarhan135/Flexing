import 'package:flexing/core/common_widget/AppBar.dart';
import 'package:flexing/core/common_widget/async_widget.dart';
import 'package:flexing/core/extension/build_context_extension.dart';
import 'package:flexing/data/model/bag_item.dart';
import 'package:flexing/data/model/category_item.dart';
import 'package:flexing/data/repository/bags_repository.dart';
import 'package:flexing/screen/details_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryItem categoryItem;

  CategoryScreen({required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CommonAppBar(showBackButton: true),
          body: Hero(
            tag: 'CategoryScreen-${categoryItem.name}',
            child: AsyncWidget<List<BagItem>>(
                fetchData: BagsRepository(categoryItem.key).invoke,
                loadingWidget: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )),
                errorWidget: (String error) {
                  return Center(
                    child: Text(error),
                  );
                },
                successData: (List<BagItem> data) {
                  if (data.isEmpty) {
                    return Center(
                      child: Text('No Bags found'),
                    );
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio:
                          MediaQuery.of(context).size.width > 1100 ? 1 : 0.85,
                      crossAxisCount: context.getResponsiveColumnCount(),
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemCount: data.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        child: ItemCard(bagItem: data[index]),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  DetailsScreen(bagItem: data[index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
          )),
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
      margin: EdgeInsets.all(5),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight =
              constraints.maxWidth * 0.9; // Maintain a 16:9 aspect ratio
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(height: imageHeight, bagItem.imagePath),
              Text(
                bagItem.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
