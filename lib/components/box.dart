import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  Box({required this.colour, this.cardChild,this.onPress});

  final Color colour;
  final VoidCallback? onPress;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
