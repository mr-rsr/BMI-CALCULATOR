import 'package:flutter/material.dart';

import 'Screens/input_page.dart';

void main() => runApp(const BMI());

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff0a0e21),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0x00000000),
          )),
      home: const InputApp(),
    );
  }
}

