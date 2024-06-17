import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Center(
        // animates changes to it's parameter
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: _selected ? 200 : 100,
          height: _selected ? 100 : 200,
          color: _selected ? Colors.blueGrey : Colors.white,
          alignment: _selected ? Alignment.center : Alignment.topCenter,
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}
