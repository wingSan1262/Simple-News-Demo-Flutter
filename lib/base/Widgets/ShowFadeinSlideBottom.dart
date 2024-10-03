import 'package:flutter/material.dart';

class ShowFadeInSlideBottom extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final BoxDecoration? decoration; // Optional for more customization

  const ShowFadeInSlideBottom({
    Key? key,
    required this.child,
    required this.delay,
    this.decoration,
  }) : super(key: key);

  @override
  _ShowFadeInSlideBottomState createState() => _ShowFadeInSlideBottomState();
}

class _ShowFadeInSlideBottomState extends State<ShowFadeInSlideBottom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animation after the specified delay
    Future.delayed(widget.delay, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          decoration: widget.decoration,
          child: widget.child,
        ),
      ),
    );
  }
}
