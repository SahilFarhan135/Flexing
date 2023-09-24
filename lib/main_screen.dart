import 'package:flexing/utils/PlatformUtils.dart';
import 'package:flexing/utils/dialog_utils.dart';
import 'package:flexing/utils/UrlUtils.dart';
import 'package:flexing/widget/bag_widget.dart';
import 'package:flexing/widget/banners.dart';
import 'package:flexing/widget/category_widget.dart';
import 'package:flexing/widget/my_persistent_header_delegate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';
import 'model/bag_item.dart';

class BagStoreHomePage extends StatelessWidget {
  // In your Flutter app
  final MethodChannel channel = const MethodChannel("com.zoyel.mobile");

  BagStoreHomePage({Key? key}) : super(key: key);

  int getResponsiveColumnCount(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200
          ? 6
          : MediaQuery.of(context).size.width >= 600
              ? 4
              : 2;

  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  void openJitsiMeet(String link, String videoMeetingServerURL, String title,
      String subject, String token, String userId) {
    var jitsiData = <String, String>{};
    jitsiData["link"] = link;
    jitsiData["serverUrl"] = videoMeetingServerURL;
    jitsiData["subject"] = title;
    jitsiData["token"] = token;
    jitsiData["isAudioMuted"] = "true";
    jitsiData["isVideoMuted"] = "true";
    jitsiData["isAudioOnly"] = "null";
    jitsiData["userDisplayName"] = title;
    jitsiData["userEmail"] = userId;
    jitsiData["featureFlags"] = "";
    channel.invokeMethod("open_jitsi", jitsiData);
  }

  @override
  Widget build(BuildContext context) {
    channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'disconnect') {
        // Show the Flutter dialog
        print(call.arguments.toString());
        showToast(context, "disconnect paused");

        return;
      }
      if (call.method == 'resumed') {
        // Show the Flutter dialog
        print(call.arguments.toString());
        showToast(context, "resumed paused");

        return;
      }
      if (call.method == 'paused') {
        // Show the Flutter dialog
        print(call.arguments.toString());
        showToast(context, "meeting paused");

        return;
      }
    });
    openJitsiMeet("", "", "title", "subject", "token", "userId");

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000000),
              Color(0xFF434343),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                pinned: true, delegate: MyPersistentHeaderDelegate()),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverSafeArea(sliver: SliverToBoxAdapter(child: Banners())),
            const SliverToBoxAdapter(
                child: SizedBox(
                    height: 30,
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.black12,
                    ))),
            _trendingItem(context),
            _trendingItemsGrid(context),
            _categoriesSliver(),
            _instagramSliver(),
            _aboutUsSliver(context),
            SliverToBoxAdapter(
                child: Container(
              color: Colors.pinkAccent.withOpacity(0.2),
              height: 400,
            )),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _categoriesSliver() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            '---------',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' Categories ',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '----------',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
                  // Adjust the number of columns based on screen width
                  childAspectRatio: constraints.maxWidth > 600 ? 1.5 : 1,
                  // Adjust aspect ratio based on screen width
                  mainAxisSpacing: 10,
                ),
                itemCount: bagCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      DialogUtil.showCustomSizedDialog(context,
                          widthPercentage: 0.9,
                          heightPercentage:
                              MediaQuery.of(context).size.height > 600
                                  ? 0.9
                                  : 0.5,
                          content: SizedBox(
                              width: 400,
                              height: 400,
                              child: Center(
                                child: Image.asset(
                                  bagCategories[index].imagePath,
                                  fit: BoxFit.cover,
                                ),
                              )));
                    },
                    child: CategoryWidget(
                      description: bagCategories[index].description,
                      title: bagCategories[index].name,
                      imagePath: bagCategories[index].imagePath,
                      onTap: () {},
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _instagramSliver() {
    return SliverToBoxAdapter(
        child: Column(children: [
      const SizedBox(
        height: 50,
      ),
      Center(
        child: TextButton(
          onPressed: () {
            launchInstagram();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Follow Us on ',
                style: GoogleFonts.lato(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.white,
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
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                launchInstagram();
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(bagItems[index].imagePath),
                      fit: BoxFit.contain,
                    ),
                  )),
            );
          })
    ]));
  }

  SliverToBoxAdapter _trendingItem(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        highlightColor: Colors.red,
        hoverColor: Colors.blue,
        onTap: () {
          print("Trending Item Clicked");
          channel.invokeMethod('start');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              '---------',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Trending",
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              '---------',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _trendingItemsGrid(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getResponsiveColumnCount(context),
        childAspectRatio: 0.78,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // Replace with your grid item widgets
          return ProductCard(
            bagItem: bagItems[index],
          );
        },
        childCount: bagItems.length, // Number of grid items
      ),
    );
  }

  SliverToBoxAdapter _aboutUsSliver(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            '-----------',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'About',
                  style: GoogleFonts.lato(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Us',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Text(
            '-----------',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'FLEXING BAGS',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: isAndroid(context) ? 18 : 26,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Experience the epitome of elegance and functionality with our deluxe FLEXING BAGS. These stunning signature pieces are meticulously crafted, promising durability that aligns with high-end fashion. Showcasing an array of styles that effortlessly matches any outfit or mood, each bag is an embodiment of sheer luxury.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: isAndroid(context) ? 14 : 22,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    ));
  }
}

class MyOverlayDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Add any background content here, if needed
        Scaffold(
          backgroundColor: Colors.transparent,
        ),
        Center(
          child: AlertDialog(
            title: Text('Flutter Dialog'),
            content: Text('This is a Flutter dialog.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
