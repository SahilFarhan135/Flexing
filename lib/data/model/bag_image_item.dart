class BagImageItem {
  final String name;
  final String value;

  BagImageItem(
    this.name,
    this.value,
  );

  // Named constructor to create BagItem from JSON
  factory BagImageItem.fromJson(Map<String, dynamic> json) {
    return BagImageItem(
      json['name'],
      json['value'],
    );
  }
}
