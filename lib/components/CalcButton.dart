import 'package:flutter/material.dart';
import 'package:BMI/constant.dart';

class CalButton extends StatelessWidget {
  CalButton({required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: bottomCardHeight,
        color: bottomCard,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
