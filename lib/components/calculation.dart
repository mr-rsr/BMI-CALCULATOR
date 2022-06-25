import 'dart:math';

import '../Screens/input_page.dart';

class Calculate {
  Calculate({required this.height, required this.weight});
  final height;
  final weight;
  double _bmi = 0;

  String calcBmi() {
    _bmi = weight /( pow((height / 100), 2));
    return _bmi.toStringAsFixed(1);
  }

  String category() {
    if (_bmi <= 18.5) {
      return 'Underweight';
    } else if (_bmi > 18.5 && _bmi<25) {
      return 'Normal';
    } else if (_bmi >= 25 && _bmi<=30) {
      return 'Overweight';
    } else if (_bmi > 30 && _bmi<40) {
      return 'Obese';
    } else {
      return "Extremely Obese";
    }
  }

  String feed() {
    if (_bmi < 18.5) {
      return 'You are underweight. You need to eat more.';
    } else if (_bmi > 18.5 && _bmi<25) {
      return 'Congrats! You are Fit';
    } else {
      return 'You are Overweight! You need to exercise';
    }
  }
}
