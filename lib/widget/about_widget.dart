import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flexing/utils/PlatformUtils.dart';

import '../model/bag_item.dart';

class AboutPage extends StatelessWidget {
  // Replace with your Instagram profile link
  final String instagramLink =
      'https://instagram.com/flexingbags?igshid=MzRlODBiNWFlZA';

  // Replace with your map link (Google Maps, for example)
  final String mapLink = 'https://maps.google.com/maps?q=your+address';

  // Replace with your phone number
  final String phoneNumber = '+91 6362058488';

  @override
  Widget build(BuildContext context) {
    var isAndroid = MediaQuery.of(context).size.width < 600;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/flexing_logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'About',
                  style: GoogleFonts.mulish(
                    fontSize: isAndroid ? 30 : 40,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: isAndroid ? 10 : 20,
                ),
                Text(
                  'Us',
                  style: GoogleFonts.mulish(
                    color: Colors.black,
                    fontSize: isAndroid ? 30 : 40,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: isAndroid ? 20 : 30,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Experience the epitome of elegance and functionality with our deluxe FLEXING BAGS. These stunning signature pieces are meticulously crafted, promising durability that aligns with high-end fashion. Showcasing an array of styles that effortlessly matches any outfit or mood, each bag is an embodiment of sheer luxury.',
                style: GoogleFonts.mulish(
                  fontSize: isAndroid ? 14 : 22,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Contact Us:',
            style: GoogleFonts.mulish(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'Email: flexingbags001@gmail.com',
              style: GoogleFonts.mulish(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'Phone: $phoneNumber',
              style: GoogleFonts.mulish(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'Address: 15 3rd Cross, JM Ln, Balepete, Bengaluru, Karnataka 560053',
              style: GoogleFonts.mulish(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    ); // Removed the extra closing parenthesis here
  }
}
