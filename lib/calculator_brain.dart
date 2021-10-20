import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(
      {required this.height, required this.weight, required this.age});

  final int height;
  final int weight;
  final int age;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Your result is quite high.";
    } else if (_bmi > 18.5) {
      return "Your weight is perfectly normal.";
    } else {
      return "Your result is quite low.";
    }
  }
}
