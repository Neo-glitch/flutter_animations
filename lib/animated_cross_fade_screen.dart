import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({super.key});

  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
          height: 100,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: const Text(
            "Switch",
            style: TextStyle(color: Colors.white),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const FlutterLogo(
            size: 300,
            style: FlutterLogoStyle.stacked,
          ),
          secondChild: const FlutterLogo(
            size: 300,
            style: FlutterLogoStyle.markOnly,
          ),
          crossFadeState: _isSelected
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),
        )
      ],
    );
  }
}
