import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain(this.height, this.weight);

  double _calculateBMI() {
    return weight / pow(height, 2) * 703;
  }

  String calculateBMI() {
    return _calculateBMI().toStringAsFixed(1);
  }

  String getResult() {
    double bmi = _calculateBMI();
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    double bmi = _calculateBMI();
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat as bit more.';
    }
  }
}
