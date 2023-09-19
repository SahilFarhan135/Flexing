import 'package:flutter/material.dart';

class RotatingImage extends StatefulWidget {
  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Adjust the rotation speed here
      vsync: this,
    )..repeat(period: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        "assets/images/flex.png", // Replace with your image path
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
    );
  }
}
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
            child: widget.child,
          ),
        ),
      )
          : Container(), // Empty container when not visible
    );
  }
}