import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final bool isMale;
  final double height;
  final double weight;

  const BmiResult({
    super.key,
    required this.isMale,
    required this.height,
    required this.weight,
  });
double calculateBmi() {
    double bmi;
    if (isMale) {
      // Formula for men: BMI = weight (kg) / (height (m))^2
      bmi = weight / ((height / 100) * (height / 100));
    } else {
      // Formula for women: BMI = weight (kg) / (height (m))^2 * 0.9
      bmi = (weight / ((height / 100) * (height / 100))) * 0.9;
    }
    return bmi;
  }

  double calculatorBmi() {
    return weight / ((height / 100) * (height / 100));
  }

  String getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25.0) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBmi();
    String category = getCategory(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is: ${bmi.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Category: $category',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            // Add an icon based on the category
            getIcon(category),
          ],
        ),
      ),
    );
  }

  Widget getIcon(String category) {
    if (category == 'Underweight') {
      return const Icon(Icons.adjust, color: Colors.blue);
    } else if (category == 'Normal') {
      return const Icon(Icons.sentiment_satisfied, color: Colors.green);
    } else {
      return const Icon(Icons.warning, color: Colors.red);
    }
  }
}
