import 'dart:collection';

class BagItem {
  final String name;
  final String description;
  final String imagePath;
  final String price;
  final List<String> colorCodes;
  final String categoryCode;

  BagItem(
    this.name,
    this.description,
    this.imagePath,
    this.price,
    this.categoryCode, {
    List<String>? colorCodes,
  }) : colorCodes = colorCodes ?? [];

  // Named constructor to create BagItem from JSON
  factory BagItem.fromJson(Map<String, dynamic> json) {
    return BagItem(
      json['name'],
      json['description'],
      json['imagePath'],
      json['price'],
      json['categoryCode'],
      colorCodes: List<String>.from(json['colorCodes']),
    );
  }
}

class ColorCodes {
  final HashMap<String, List<String>> colors;

  ColorCodes(this.colors);
}
