import 'package:flutter/material.dart';

class AnimatedSwitcherScreen extends StatefulWidget {
  const AnimatedSwitcherScreen({super.key});

  @override
  State<AnimatedSwitcherScreen> createState() => _AnimatedSwitcherScreenState();
}

class _AnimatedSwitcherScreenState extends State<AnimatedSwitcherScreen> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // gives fade animation when content of child changes e.g a Text value
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Text(
              "$_count",
              style: const TextStyle(fontSize: 40),
              key: ValueKey(_count),
            ),
            // optional: use if we want to use another animation apart from fade animation
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
