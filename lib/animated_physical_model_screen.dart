import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatefulWidget {
  const AnimatedPhysicalModelScreen({super.key});

  @override
  State<AnimatedPhysicalModelScreen> createState() =>
      _AnimatedPhysicalModelScreenState();
}

class _AnimatedPhysicalModelScreenState
    extends State<AnimatedPhysicalModelScreen> {
  bool _isFlat = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // animates change in physical model like elevation, color, shadow color etc
          AnimatedPhysicalModel(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            elevation: _isFlat ? 0 : 6,
            shape: BoxShape.rectangle,
            shadowColor: Colors.black,
            color: Colors.white,
            child: const SizedBox(
              height: 120,
              width: 120,
              child: Icon(Icons.android_outlined),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text("Click"),
            onPressed: () {
              setState(() {
                _isFlat = !_isFlat;
              });
            },
          )
        ],
      )),
    );
  }
}
