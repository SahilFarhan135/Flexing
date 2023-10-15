// ignore: unused_import
import 'package:flexing/core/utils/PlatformUtils.dart';
import 'package:flexing/data/model/about_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  final AboutDetail aboutDetail;

  const AboutPage({
    required this.aboutDetail,
    super.key,
  });

  bool isSmallSizeDevice(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  String aboutText(BuildContext context) {
    return isSmallSizeDevice(context)
        ? aboutDetail.androidText
        : aboutDetail.webText;
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
          ///LOGO
          Image.asset(
            "assets/images/logo_new.png",
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          SizedBox(
            height: isSmallSizeDevice(context) ? 5 : 15,
          ),

          ///About Us Text
          Center(
            child: Text(
              aboutDetail.headerText,
              style: GoogleFonts.mulish(
                fontSize: isSmallSizeDevice(context) ? 30 : 40,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: isSmallSizeDevice(context) ? 20 : 30,
          ),

          ///About Us description

          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width * 0.7,
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

          SizedBox(height: isSmallSizeDevice(context) ? 12.0 : 20.0),

          ///Contact Us
          Text(
            'Contact Us:',
            style: GoogleFonts.mulish(
              fontSize: isSmallSizeDevice(context) ? 20.0 : 25.0,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: isSmallSizeDevice(context) ? 12.0 : 20.0),

          ///Email
          TextButton(
            onPressed: () {},
            child: Text(
              textAlign: TextAlign.center,
              'Email: ${aboutDetail.email}',
              style: GoogleFonts.mulish(
                fontSize: isSmallSizeDevice(context) ? 15.0 : 25.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: isSmallSizeDevice(context) ? 12.0 : 20.0),

          ///Phone Number
          TextButton(
            onPressed: () {},
            child: Text(
              textAlign: TextAlign.center,
              'Phone: ${aboutDetail.phoneNumber}',
              style: GoogleFonts.mulish(
                fontSize: isSmallSizeDevice(context) ? 17.0 : 25.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: isSmallSizeDevice(context) ? 12.0 : 20.0),

          ///Address
          TextButton(
            onPressed: () {},
            child: Text(
              textAlign: TextAlign.center,
              'Address: ${aboutDetail.address}',
              style: GoogleFonts.mulish(
                fontSize: isSmallSizeDevice(context) ? 17.0 : 25.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: isSmallSizeDevice(context) ? 12.0 : 20.0),

          ///insta
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Follow Us on ',
                style: GoogleFonts.mulish(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/images/insta.png",
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '@FlexingBags',
                style: GoogleFonts.mulish(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          SizedBox(height: isSmallSizeDevice(context) ? 12.0 : 20.0),
        ],
      ),
    ); // Removed the extra closing parenthesis here
  }
}
