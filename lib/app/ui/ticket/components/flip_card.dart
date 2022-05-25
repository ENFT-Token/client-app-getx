  import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardController {
  FlipCardState? _state;

  Future flipCard() async => _state?.flipCard();
}

class FlipCard extends StatefulWidget {
  final FlipCardController controller;
  final Widget front;
  final Widget back;

  const FlipCard(
      {required this.controller,
      required this.front,
      required this.back,
      Key? key})
      : super(key: key);

  @override
  FlipCardState createState() => FlipCardState();
}

class FlipCardState extends State<FlipCard>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool _isFront = true;
  double _anglePlus = 0;

  @override
  void initState() {
    super.initState();
    // Flip ticket animation
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    widget.controller._state = this;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future flipCard() async {
    if (controller.isAnimating) return;
    _isFront = !_isFront;

    await controller.forward(from: 0).then((value) => _anglePlus = pi);
  }

  bool isFront(double angle) {
    final degrees90 = pi / 2;
    final degress270 = 3 * pi / 2;

    return angle <= degrees90 || angle >= degress270;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: flipCard,
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double angle = controller.value * -pi;
              if (_isFront) angle += _anglePlus;
              final transform = Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle);

              return Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: isFront(angle.abs())
                      ? widget.front
                      : Transform(
                          transform: Matrix4.identity()..rotateY(pi),
                          alignment: Alignment.center,
                          child: widget.back));
            }));
  }
}
