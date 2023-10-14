import 'package:flutter/material.dart';

class OfferListView extends StatelessWidget {
  final List<Offer> offers = [
    Offer(
      title: 'Laptop Bags',
      description: 'Get exciting discounts on electronics. Limited time offer!',
      imageUrl: 'assets/images/newbag1.jpeg',
    ),
    Offer(
      title: 'School Bags',
      description:
          'Hurry! Grab the latest fashion trends at unbeatable prices.',
      imageUrl: 'assets/images/newbag1.jpeg',
    ),
    Offer(
      title: 'School Bags',
      description:
          'Hurry! Grab the latest fashion trends at unbeatable prices.',
      imageUrl: 'assets/images/newbag1.jpeg',
    ),
    Offer(
      title: 'School Bags',
      description:
          'Hurry! Grab the latest fashion trends at unbeatable prices.',
      imageUrl: 'assets/images/newbag1.jpeg',
    ),
    Offer(
      title: 'School Bags',
      description:
          'Hurry! Grab the latest fashion trends at unbeatable prices.',
      imageUrl: 'assets/images/newbag1.jpeg',
    ),
    // Add more offers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return OfferCard(offer: offers[index]);
        },
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final Offer offer;

  OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.teal.shade200),
              image: DecorationImage(
                image: AssetImage(offer.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            offer.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Offer {
  final String title;
  final String description;
  final String imageUrl;

  Offer({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
