import 'package:flutter/material.dart';

import 'views/input_page.dart';
import 'views/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(
              interpretation: '',
              resultText: '',
              bmiResults: '',
            ),
      },
    );
  }
}
