import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;

  const SlideDots(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // total height = 20 + 12
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff216FEA): Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}
