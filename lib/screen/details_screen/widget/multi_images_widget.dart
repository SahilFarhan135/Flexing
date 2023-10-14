import 'package:flutter/material.dart';

class MultiImagesWidget extends StatefulWidget {
  final List<String> images;
  final double mHeight;
  final double mWidth;

  const MultiImagesWidget(
      {required this.images, required this.mHeight, required this.mWidth});

  @override
  _MultiImagesWidgetState createState() => _MultiImagesWidgetState();
}

class _MultiImagesWidgetState extends State<MultiImagesWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: widget.mHeight,
            width: widget.mWidth * 0.25,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.images.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _current = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index == _current
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      widget.images[index],
                      fit: BoxFit.contain,
                      width: widget.mWidth * 0.25,
                      height: 100,
                    ),
                  ),
                );
              },
            )),
        SizedBox(
          height: widget.mHeight,
          width: widget.mWidth * 0.7,
          child: Image.network(widget.images[_current], fit: BoxFit.contain),
        ),
      ],
    );
  }
}
