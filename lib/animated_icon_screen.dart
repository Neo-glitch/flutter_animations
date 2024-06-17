import 'package:flutter/material.dart';

class AnimatedIconScreen extends StatefulWidget {
  const AnimatedIconScreen({super.key});

  @override
  State<AnimatedIconScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen>
    with TickerProviderStateMixin {
  bool _isPlay = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_isPlay) {
            _animationController
                .reverse(); // reverse the animation and get previous icon
            _isPlay = false;
          } else {
            _animationController
                .forward(); // forward animation and get the next icon
            _isPlay = true;
          }
        },
        // works with animated icons only
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _animationController,
          size: 100,
          color: Colors.blue,
          semanticLabel: "Play/Pause",
        ),
      ),
    );
  }
}
