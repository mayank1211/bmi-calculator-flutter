import 'package:flutter/material.dart';
import 'theme/constants.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColour,
        scaffoldBackgroundColor: scaffoldBackgroundColour,
        appBarTheme: AppBarTheme(
          backgroundColor: appBarBackgroundColour,
        ),
      ),
      home: InputPage(),
    );
  }
}
