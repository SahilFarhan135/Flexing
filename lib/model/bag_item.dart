class BagItem {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final List<String> imageUrls;

  BagItem(this.name, this.description, this.imagePath, this.price,
      {List<String>? imageUrls})
      : imageUrls = imageUrls ?? [];
}
