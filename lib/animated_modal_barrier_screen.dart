import 'package:flutter/material.dart';

// helps prevent users from interacting with widget behind this animated barrier
class AnimateModalBarrierScreen extends StatefulWidget {
  const AnimateModalBarrierScreen({super.key});

  @override
  State<AnimateModalBarrierScreen> createState() =>
      _AnimateModalBarrierScreenState();
}

class _AnimateModalBarrierScreenState extends State<AnimateModalBarrierScreen>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late Widget _animatedModalBarrier;

  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    ColorTween _colorTween = ColorTween(
        begin: Colors.orangeAccent.withOpacity(0.5),
        end: Colors.blueGrey.withOpacity(0.5));

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _colorAnimation = _colorTween.animate(_animationController);

    _animatedModalBarrier = AnimatedModalBarrier(
      color: _colorAnimation,
      dismissible: true,
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () {
                      setState(() {
                        _isPressed = true;
                      });

                      // reset animation and move animation forward
                      _animationController.reset();
                      _animationController.forward();

                      // after 3 secs it makes the animatedModalBarrier to disappear
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _isPressed = false;
                        });
                      });
                    },
                    child: const Text("Press"),
                  ),
                  if (_isPressed) _animatedModalBarrier
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
