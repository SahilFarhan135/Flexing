import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const CategoryWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
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
    _imageProvider = AssetImage(widget.imagePath);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
  }

  double getTextSize() {
    if (screenWidth < 600) {
      return 12.0;
    } else if (screenWidth < 1200) {
      return 16.0;
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

    return Card(
      elevation: isHovered ? 10 : 5,
      color: Colors.indigo.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Transform.scale(
          scale: containerScale,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: _imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
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
                    fontFamily: 'Proxima Nova',
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(widget.description,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontSize: textSize,
                      decoration: TextDecoration.none,
                    )),
                const SizedBox(height: 4.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
