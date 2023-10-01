import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  CommonAppBar({required this.showBackButton});

  @override
  Size get preferredSize =>
      const Size.fromHeight(70.0); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10, // You may want to adjust this based on your design
      automaticallyImplyLeading: false, // Remove back button
      flexibleSpace: Container(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.01,
                  ),

                  showBackButton
                      ? IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, icon: const Icon(Icons.arrow_back_sharp))
                      : SizedBox.shrink(),

                  showBackButton
                      ?  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.005,
                  )
                      : SizedBox.shrink(),
                  Image.asset(
                    "assets/images/logo_new.png",
                    scale: 1.0,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.03,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
