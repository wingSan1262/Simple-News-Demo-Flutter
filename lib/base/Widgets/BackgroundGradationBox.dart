import 'package:flutter/material.dart';

class BackgroundGradationBox extends StatelessWidget {
  final Widget child;
  final bool isRight;
  final BoxDecoration? style;

  const BackgroundGradationBox({
    Key? key,
    required this.child,
    required this.isRight,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xCC007AFF), // rgba(0, 122, 255, 0.8)
            Colors.transparent,
          ],
          begin: isRight ? Alignment.centerRight : Alignment.centerLeft,
          end: isRight ? Alignment.centerLeft : Alignment.centerRight,
        ),
      ),
      child: child,
    );
  }
}