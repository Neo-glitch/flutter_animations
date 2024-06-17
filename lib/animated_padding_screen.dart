import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  const AnimatedPaddingScreen({super.key});

  @override
  State<AnimatedPaddingScreen> createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen> {
  double _padding = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
          onPressed: () {
            setState(() {
              _padding = _padding == 0 ? 100 : 0;
            });
          },
          child: Text("Change Padding"),
        ),
        Text(
          "padding=  $_padding",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        AnimatedPadding(
          padding: EdgeInsets.all(_padding),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            color: Colors.orangeAccent,
          ),
        )
      ],
    );
  }
}
