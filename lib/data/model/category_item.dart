class CategoryItem {
  final String name;
  final String description;
  final String imagePath;
  final String color;
  final String key;

  CategoryItem({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.color,
    this.key="",
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imagePath: json['imagePath'] ?? '',
      color: json['color'] ?? '',
      key: json['key'] ?? '',
    );
  }
}
