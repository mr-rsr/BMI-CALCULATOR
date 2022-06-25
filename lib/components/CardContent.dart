import 'package:flutter/material.dart';
import '../constant.dart';
class CardContent extends StatelessWidget {
  CardContent({required this.lable, this.icon});
  final String lable; 
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          lable,
          style: labelStyle,
        )
      ],
    );
  }
}