import 'package:flutter/material.dart';

// similar to animated cross fade, but works for just a single child and not
// having to fade and show the second widget.
class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            child: const FlutterLogo(size: 60),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _opacity = _opacity == 0 ? 1 : 0;
              });
            },
            child: const Text("Fade Logo"),
          )
        ],
      ),
    );
  }
}
