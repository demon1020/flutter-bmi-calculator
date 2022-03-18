import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;
  double _bmi = 0;

  CalculateBMI({required this.height, required this.weight});

  String calculateResultBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'Over Weight';
    } else if (_bmi >= 18.5 && _bmi <= 25) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'Your Over Weight.\n\n Try exercise more.';
    } else if (_bmi >= 18.5 && _bmi <= 25) {
      return 'You are normal.\n\n Stay fit.';
    } else {
      return 'You are Under Weight.\n\n Eat more & exercise regularly.';
    }
  }
}
