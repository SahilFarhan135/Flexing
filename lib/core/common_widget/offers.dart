import 'package:flexing/data/model/category_item.dart';
import 'package:flexing/screen/category_screen/category_screen.dart';
import 'package:flutter/material.dart';

class OfferOrCategoryListView extends StatelessWidget {
  final List<CategoryItem> categoryItems;

  const OfferOrCategoryListView({Key? key, required this.categoryItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          return OfferCard(categoryItem: categoryItems[index]);
        },
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final CategoryItem categoryItem;

  OfferCard({required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => CategoryScreen(categoryItem: categoryItem),
          ),
        );
      },
      child: Hero(
          tag: 'Category-${categoryItem.name}',
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.teal.shade200),
                    image: DecorationImage(
                      image: NetworkImage(categoryItem.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  categoryItem.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}
