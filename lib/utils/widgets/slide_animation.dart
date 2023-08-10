// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    required this.child,
    required this.animation,
    super.key,
  }) : super();
  final Widget child;
  final Animation<double> animation;

  @override
  SlideAnimationState createState() => SlideAnimationState();
}

class SlideAnimationState extends State<SlideAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _position = Tween(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _position,
      child: widget.child,
    );
  }
}
