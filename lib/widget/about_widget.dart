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

  final String webText =
      'Experience the epitome of elegance and functionality with our deluxe FLEXING BAGS. These stunning signature pieces are meticulously crafted, promising durability that aligns with high-end fashion. Showcasing an array of styles that effortlessly matches any outfit or mood, each bag is an embodiment of sheer luxury. Look no further than Flexing Bags! Our high-quality bags are designed to withstand the wear and tear of everyday use, whether you re hitting the gym, traveling, or just running errands. With a variety of sizes and styles to choose from, youre sure to find the perfect bag to fit your needs. So why settle for anything less than the best? Choose Flexing Bags for your next adventure Look no further than Flexing Bags! Our high-quality bags are designed to withstand the wear and tear of everyday use, whether youre hitting the gym, traveling, or just running errands. With a variety of sizes and styles to choose from, youre sure to find the perfect bag to fit your needs. So why settle for anything less than the best? Choose Flexing Bags for your next adventure';
  final String androidText =
      'Experience the epitome of elegance and functionality with our deluxe FLEXING BAGS. These stunning signature pieces are meticulously crafted, promising durability that aligns with high-end fashion. Showcasing an array of styles that effortlessly matches any outfit or mood, each bag is an embodiment of sheer luxury. Look no further than Flexing Bags! Our high-quality bags are designed to withstand the wear and tear of everyday use, whether you re hitting the gym, traveling, or just running errands.';

  // Replace with your phone number
  final String phoneNumber = '+91 6362058488';

  bool isSmallSizeDevice(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  String aboutText(BuildContext context) {
    return isSmallSizeDevice(context) ? androidText : webText;
  }

  @override
  Widget build(BuildContext context) {
    var isAndroid = MediaQuery.of(context).size.width < 600;
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/logo_new.png",
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          SizedBox(
            height: isSmallSizeDevice(context) ? 5 : 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'About',
                  style: GoogleFonts.mulish(
                    fontSize: isSmallSizeDevice(context) ? 30 : 40,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: isSmallSizeDevice(context) ? 10 : 20,
                ),
                Text(
                  'Us',
                  style: GoogleFonts.mulish(
                    color: Colors.black,
                    fontSize: isSmallSizeDevice(context) ? 30 : 40,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: isSmallSizeDevice(context) ? 20 : 30,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                aboutText(context),
                style: GoogleFonts.mulish(
                  fontSize: isAndroid ? 14 : 22,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(height: isSmallSizeDevice(context) ? 10.0 : 20.0),
          Text(
            'Contact Us:',
            style: GoogleFonts.mulish(
              fontSize: isSmallSizeDevice(context) ? 17.0 : 20.0,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          //SizedBox(height: isSmallSizeDevice(context) ? 10.0 : 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'Email: flexingbags001@gmail.com',
              style: GoogleFonts.mulish(
                fontSize: isSmallSizeDevice(context) ? 15.0 : 20.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //SizedBox(height: isSmallSizeDevice(context) ? 10.0 : 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'Phone: $phoneNumber',
              style: GoogleFonts.mulish(
                fontSize: isSmallSizeDevice(context) ? 17.0 : 20.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //SizedBox(height: isSmallSizeDevice(context) ? 10.0 : 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'Address: 15 3rd Cross, JM Ln, Balepete, Bengaluru, Karnataka 560053',
              style: GoogleFonts.mulish(
                fontSize: isSmallSizeDevice(context) ? 17.0 : 20.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //SizedBox(height: isSmallSizeDevice(context) ? 10.0 : 20.0),
        ],
      ),
    ); // Removed the extra closing parenthesis here
  }
}
