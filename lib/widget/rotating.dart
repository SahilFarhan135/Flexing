import 'package:flutter/material.dart';


class AnimatedTopWidget extends StatefulWidget {
  final Widget child;

  AnimatedTopWidget({required this.child});

  @override
  _AnimatedTopWidgetState createState() => _AnimatedTopWidgetState();
}

class _AnimatedTopWidgetState extends State<AnimatedTopWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    // Delay for the animation to start
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true; // Set to true to make the widget visible
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1), // Animation duration
      child: _isVisible
          ? SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -1), // Start above the screen
                end: Offset(0, 0), // End at its final position
              ).animate(CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.easeInOut,
              )),
              child: Center(
                child: Container(
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 1), // Animation duration
                    child: _isVisible
                        ? SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0, 1), // Start below the screen
                              end: Offset(0, 0), // End at its final position
                            ).animate(CurvedAnimation(
                              parent: ModalRoute.of(context)!.animation!,
                              curve: Curves.easeInOut,
                            )),
                            child: widget.child,
                          )
                        : Container(), // Empty container when not visible
                  ),
                ),
              ),
            )
          : Container(), // Empty container when not visible
    );
  }
}
