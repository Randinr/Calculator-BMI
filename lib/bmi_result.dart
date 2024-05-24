import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  
  final bool isMale;
  final double height;
  final double weight;

  const BMIResult({
    super.key,
    required this.isMale,
    required this.weight,
    required this.height,
    });

  @override
  Widget build(BuildContext context) {
    double BMI = calculateBmi();
    String category = getCategory(BMI);

    return Scaffold(
      appBar: AppBar(title: Text('BMIResult:'),
      ),

      body: Center (
        child: Column(
          children: [
            Text('Hasil BMI Kamu Adalah: ${BMI.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 24.0),
            ),

            SizedBox(height: 16.0),
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
  
  double calculateBmi() {
    return weight / ((height/100)*(height/100));
  }
  
  String getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Terlalu Kecil';
    } else if (bmi < 25.0) {
      return 'Normal';
    } else if (bmi < 30.0) {
      return 'Terlalu Besar';
    } else {
      return 'Terlalu Besar';
    }
  } 
}