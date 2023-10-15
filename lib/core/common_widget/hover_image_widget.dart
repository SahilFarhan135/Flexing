import 'package:flutter/material.dart';

class HoverImageWidget extends StatefulWidget {
  final String imagePath;
  final Function onTap;

  HoverImageWidget({required this.imagePath, required this.onTap});

  @override
  _HoverImageWidgetState createState() => _HoverImageWidgetState();
}

class _HoverImageWidgetState extends State<HoverImageWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isHovered ? 240 : 200, // Adjust the width as needed
        height: isHovered ? 240 : 200, // Adjust the height as needed
        child: Image.network(
          widget.imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  void onHover(bool hovering) {
    setState(() {
      isHovered = hovering;
    });
  }
}
