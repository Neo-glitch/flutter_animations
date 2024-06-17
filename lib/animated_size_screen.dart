import 'package:flutter/material.dart';

class AnimatedSizeScreen extends StatefulWidget {
  const AnimatedSizeScreen({super.key});

  @override
  State<AnimatedSizeScreen> createState() => _AnimatedSizeScreenState();
}

class _AnimatedSizeScreenState extends State<AnimatedSizeScreen> {
  double _size = 300;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _size = _size == 300 ? 100 : 300;
          });
        },
        child: Container(
          color: Colors.white,
          child: AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(seconds: 1),
            child: FlutterLogo(
              size: _size,
            ),
          ),
        ),
      ),
    );
  }
}
