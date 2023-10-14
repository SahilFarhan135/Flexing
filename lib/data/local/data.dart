import 'package:flexing/data/model/category_item.dart';

import '../model/bag_item.dart';

final bagItems = [
  BagItem(
      'Bag 1',
      'Description of Bag 1',
      'https://firebasestorage.googleapis.com/v0/b/flexing-a499f.appspot.com/o/bags%2FCOLLEGE%2Funisex_bag_black%2Funisex_bag_black1.webp?alt=media&token=74fac786-fc5c-47b7-b436-20a927a447fe&_gl=1*1x3c2zl*_ga*MjM4MTYxODMwLjE2OTMwMzM2Mzg.*_ga_CW55HF8NVT*MTY5NjM1MzMwOS44LjEuMTY5NjM1Mzg2NS4yNS4wLjA.',
      " 990.99",
      'SCHOOL',
      colorCodes: ['BAG1_RED']),
  BagItem('Bag 12', 'Description of Bag 1', 'assets/images/newbag2.jpeg',
      "7349.99", 'SCHOOL',
      colorCodes: ['BAG12_RED']),
  /* BagItem('Bag 3', 'Description o4444f Bag 1', 'assets/images/newbag3.jpeg',
      379.99),
  BagItem('Bag 44jhfjd4444', 'Description of Bag 1',
      'assets/images/newbag4.jpeg', 849.99),
  BagItem(
      'Bag 3y', 'Description of Bag 1', 'assets/images/newbag5.jpeg', 849.99),
  BagItem('Bag 4dkjh44444', 'Description of Bag 1',
      'assets/images/newbag6.jpeg', 849.99),
  BagItem('Bag 444d,h444', 'Description of Bag 1', 'assets/images/bag2.png',
      849.99),
  BagItem('Bag 44diuieod4444', 'Description of Bag 1', 'assets/images/bag4.png',
      849.99),
  BagItem('Bag 4/;djh44444', 'Description of Bag 1', 'assets/images/bag4.png',
      849.99),
  BagItem('Bag 444dko444', 'Description of Bag 1', 'assets/images/bag4.png',
      849.99),*/
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
  'assets/images/banner1.jpg',
  'assets/images/banner2.jpeg',
  'assets/images/banner3.jpeg',
  'assets/images/banner4.jpeg',
  'assets/images/banner5.jpg',
  'assets/images/banner6.jpg',
  'assets/images/banner7.jpg',
  'assets/images/banner8.jpg',
];

final bagCategories = [
  CategoryItem(
      name: 'BackPack',
      description: 'Your daily essential, organized and stylish',
      imagePath: 'assets/images/bag1.png',
      color: '0xFFFFC1C1'),
  CategoryItem(
      name: 'Hiking',
      description: 'Fun and functional for explorers.',
      imagePath: 'assets/images/newbag5.jpeg',
      color: '0xFFCB9B00'),
  CategoryItem(
      name: 'School',
      description: 'Study smart, carry comfortably.',
      imagePath: 'assets/images/newbag4.jpeg',
      color: '0xFF049833'),
  CategoryItem(
      name: 'Corporate',
      description:
          'Elevate your professional presence with style and organization.',
      imagePath: 'assets/images/newbag1.jpeg',
      color: '0xFFFFC600'),
  CategoryItem(
      name: 'Travel',
      description: 'Explore the world with ease',
      imagePath: 'assets/images/newbag2.jpeg',
      color: '0xFF047ABD'),
  CategoryItem(
    name: 'Laptop',
    description: 'Safeguard your tech on the go.',
    imagePath: 'assets/images/newbag3.jpeg',
    color: '0xF90CAF9FF',
  ),
];
