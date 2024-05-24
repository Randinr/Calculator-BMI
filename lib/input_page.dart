import 'package:flutter/material.dart';
import 'bmi_result.dart';

class UserInput extends StatefulWidget {
  final String title;
  const UserInput({super.key, required this.title});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool _isMale = true;
  double _height = 170.0;
  double _weight = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Gender: ${_isMale ? 'Male' : 'Female'}',
            ),
            const SizedBox(height: 16.0),
            ToggleButtons(
              isSelected: [_isMale, !_isMale],
              onPressed: (index) => setState(() => _isMale = index == 0),
              children: const [
                Icon(Icons.male),
                Icon(Icons.female),
              ],
            ),
            const SizedBox(height: 16.0),
            Text('Height (cm): ${_height.toStringAsFixed(1)}'),
            Slider(
              value: _height,
              min: 100.0,
              max: 250.0,
              onChanged: (value) => setState(() => _height = value),
            ),
            const SizedBox(height: 16.0),
            Text('Weight (kg): ${_weight.toStringAsFixed(1)}'),
            Slider(
              value: _weight,
              min: 30.0,
              max: 150.0,
              onChanged: (value) => setState(() => _weight = value),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiResult(
                    isMale: _isMale,
                    height: _height,
                    weight: _weight,
                  ),
                ),
              ),
              child: const Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
