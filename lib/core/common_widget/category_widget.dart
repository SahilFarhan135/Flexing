import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/category_item.dart';

class CategoryWidget extends StatefulWidget {
  final VoidCallback onTap;
  final CategoryItem categoryItem;

  const CategoryWidget({
    Key? key,
    required this.categoryItem,
    required this.onTap,
  }) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool isHovered = false;
  late ImageProvider _imageProvider;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    _imageProvider = AssetImage(widget.categoryItem.imagePath);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
  }

  double getTextSize() {
    if (screenWidth < 600) {
      return 15.0;
    } else if (screenWidth < 1200) {
      return 20.0;
    } else {
      return 20.0;
    }
  }

  double getContainerScale() {
    if (isHovered) {
      return 1;
    } else {
      return 0.90;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double textSize = getTextSize();
    final double containerScale = getContainerScale();
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
          color: Color(int.parse(widget.categoryItem.color)),
        ),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Transform.scale(
              scale: containerScale,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.categoryItem.name,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: textSize,
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.white,
                        ),
                      ],
                      fontWeight: FontWeight.bold,
                      decorationThickness: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(widget.categoryItem.description,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: textSize,
                        decoration: TextDecoration.none,
                        fontFamily: 'Lato',
                      )),
                  const SizedBox(height: 4.0),
                ],
              )),
        ));
  }
}
