// for explicit animations (where much work is done)

import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderScreen extends StatefulWidget {
  const AnimatedBuilderScreen({super.key});

  @override
  State<AnimatedBuilderScreen> createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat(); // to repeat the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // anytime the ticker ticks this animation runs
      child: AnimatedBuilder(
        animation: _animationController,
        child: const FlutterLogo(
          size: 100,
        ),
        builder: (context, child) {
          // print("${_animationController.value}");
          return Transform.rotate(
            angle: _animationController.value * 2.0 * math.pi,
            child: child,
          );
        },
      ),
    );
  }
}
