import 'model/bag_item.dart';
import 'model/category_item.dart';

final bagItems = [
  BagItem(
      'Bag 1', 'Description of Bag 1', 'assets/images/newbag1.jpeg', 990.99),
  BagItem(
      'Bag 1', 'Description of Bag 1', 'assets/images/newbag2.jpeg', 7349.99),
  BagItem('Bag 3', 'Description o4444f Bag 1', 'assets/images/newbag3.jpeg',
      379.99),
  BagItem('Bag 444444', 'Description of Bag 1', 'assets/images/newbag4.jpeg',
      849.99),
  BagItem('Bag 444444', 'Description of Bag 1', 'assets/images/newbag5.jpeg',
      849.99),
  BagItem('Bag 444444', 'Description of Bag 1', 'assets/images/newbag6.jpeg',
      849.99),
  BagItem(
      'Bag 444444', 'Description of Bag 1', 'assets/images/bag2.png', 849.99),
  BagItem(
      'Bag 444444', 'Description of Bag 1', 'assets/images/bag4.png', 849.99),
  BagItem(
      'Bag 444444', 'Description of Bag 1', 'assets/images/bag4.png', 849.99),
  BagItem(
      'Bag 444444', 'Description of Bag 1', 'assets/images/bag4.png', 849.99),
  // Add more bag items here
];
final List<String> buttonOptions = [
  "BackPack",
  "Hiking",
  "School",
  "Corporate"
];

final List<String> images = [
  'assets/images/cover1.jpg',
  'assets/images/cover2.png',
  'assets/images/cover3.webp',
];

final bagCategories = [
  CategoryItem('BackPack', 'Your daily essential, organized and stylish',
      'assets/images/bag1.png', 0xFFFFC1C1),
  CategoryItem('Hiking', 'Fun and functional for explorers.',
      'assets/images/newbag5.jpeg', 0xFFCB9B00),
  CategoryItem('School', 'Study smart, carry comfortably.',
      'assets/images/newbag4.jpeg', 0xFF049833),
  CategoryItem(
      'Corporate',
      'Elevate your professional presence with style and organization.',
      'assets/images/newbag1.jpeg',
      0xFFFFC600),
  CategoryItem("Travel", "Explore the world with ease",
      "assets/images/newbag2.jpeg", 0xFF047ABD),
  CategoryItem(
    "Laptop",
    "Safeguard your tech on the go.",
    "assets/images/newbag3.jpeg",
    0xF90CAF9FF,
  ),
];
