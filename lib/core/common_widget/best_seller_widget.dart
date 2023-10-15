import 'dart:core';

import 'package:flutter/material.dart';

class BestSellerWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String imagePath;

  const BestSellerWidget({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  _BestSellerWidgetState createState() => _BestSellerWidgetState();
}

class _BestSellerWidgetState extends State<BestSellerWidget> {
  bool isHovered = false;
  late ImageProvider _imageProvider;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    _imageProvider = AssetImage(widget.imagePath);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
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
    return Container(
        child: MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: Transform.scale(
              scale: getContainerScale(),
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: Matrix4.identity()..scale(getContainerScale()),
                  child: Stack(
                    children: [
                      Image.network(
                        widget.imagePath,
                        fit: BoxFit.contain,
                      ),
/*                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                shape: BoxShape.rectangle,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: Text(
                                'Best Seller',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )))*/
                    ],
                  )),
            )));
  }
}
