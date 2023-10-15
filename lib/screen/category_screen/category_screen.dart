import 'package:flexing/core/common_widget/AppBar.dart';
import 'package:flexing/core/common_widget/async_widget.dart';
import 'package:flexing/core/extension/build_context_extension.dart';
import 'package:flexing/data/model/bag_item.dart';
import 'package:flexing/data/model/category_item.dart';
import 'package:flexing/data/repository/bags_repository.dart';
import 'package:flexing/screen/details_screen/detail_screen.dart';
import 'package:flutter/material.dart';

import '../../core/common_widget/best_seller_widget.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryItem categoryItem;

  CategoryScreen({required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CommonAppBar(showBackButton: true, onTapped: () {}),
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
                        child: BestSellerWidget(
                          imagePath: data[index].imagePath,
                          onTap: () {},
                        ),
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
