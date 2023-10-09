import 'package:flutter/material.dart';

class MultiImagesWidget extends StatefulWidget {
  final List<String> images;

  const MultiImagesWidget({required this.images});

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
            height: 420,
            width: MediaQuery.of(context).size.width * 0.25,
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 100,
                    ),
                  ),
                );
              },
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 420,
          child: Image.network(widget.images[_current], fit: BoxFit.contain),
        ),
      ],
    );
  }
}
