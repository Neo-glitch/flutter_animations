import 'package:flutter/material.dart';

class AnimatedRotationScreen extends StatefulWidget {
  const AnimatedRotationScreen({super.key});

  @override
  State<AnimatedRotationScreen> createState() => _AnimatedRotationScreenState();
}

class _AnimatedRotationScreenState extends State<AnimatedRotationScreen> {
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: AnimatedRotation(
            turns: turns,
            duration: const Duration(seconds: 1),
            child: const FlutterLogo(
              size: 100,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                turns += 1 / 4;
              });
            },
            child: const Text("Rotate Logo"))
      ],
    ));
  }
}
