import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final Function onTapped;

  CommonAppBar({required this.showBackButton, required this.onTapped});

  @override
  Size get preferredSize =>
      const Size.fromHeight(65.0); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10, // You may want to adjust this based on your design
      automaticallyImplyLeading: false, // Remove back button
      flexibleSpace: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        margin: const EdgeInsets.all(0.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 65.0,
          padding: const EdgeInsets.only(right: 0.0, top: 1.0, bottom: 1.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                showBackButton
                    ? IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_sharp))
                    : SizedBox.shrink(),
                showBackButton
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.005,
                      )
                    : SizedBox.shrink(),
                Image.asset(
                  scale: 1.0,
                  width: 40,
                  height: 40,
                  filterQuality: FilterQuality.high,
                  "assets/images/flex.png",
                  fit: BoxFit.cover,
                ),
                Text(
                  "FLEXiNG",
                  style: GoogleFonts.zcoolKuaiLe(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.search)),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
