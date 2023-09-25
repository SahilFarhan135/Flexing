import 'package:flutter/material.dart';
import 'package:flexing/model/bag_item.dart';

class ItemDetailsScreen extends StatefulWidget {
  final BagItem category;

  ItemDetailsScreen({required this.category});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.category.imageUrls.isEmpty) {
      widget.category.imageUrls.add("assets/images/newbag1.jpeg");
      widget.category.imageUrls.add("assets/images/newbag2.jpeg");
      widget.category.imageUrls.add("assets/images/newbag3.jpeg");
      widget.category.imageUrls.add("assets/images/newbag4.jpeg");
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
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
            flex: 1,
            child: Stack(
              children: [
                Hero(
                  tag: 'category-${widget.category.name}',
                  child: Image.asset(
                    widget.category.imageUrls[selectedImageIndex],
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ItemImageList(
                      imageUrls: widget.category.imageUrls,
                      onImageTapped: (index) {
                        setState(() {
                          selectedImageIndex = index;
                        });
                      },
                    ), // <-- Removed extra semicolon here
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemImageList extends StatelessWidget {
  final List<String> imageUrls;
  final Function(int) onImageTapped;

  ItemImageList({required this.imageUrls, required this.onImageTapped});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            onImageTapped(index);
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: index == 0 ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                width: 100,
                height: 100,
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
