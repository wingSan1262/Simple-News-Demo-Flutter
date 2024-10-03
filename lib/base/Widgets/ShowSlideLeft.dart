import 'package:flutter/material.dart';

class ShowSlideLeft extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final bool isFromRight;

  const ShowSlideLeft({
    Key? key,
    required this.child,
    required this.delay,
    this.isFromRight = false,
  }) : super(key: key);

  @override
  _ShowSlideLeftState createState() => _ShowSlideLeftState();
}

class _ShowSlideLeftState extends State<ShowSlideLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(widget.isFromRight ? 1 : -1, 0),
      end: Offset.zero,
    ).animate(
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
        child: widget.child,
      ),
    );
  }
}
