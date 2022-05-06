import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/constants.dart';
import '../components/navigation_button.dart';
import 'results_page.dart';
import '../components/reusable_card.dart';
import '../components/reusable_icon_content_card.dart';
import '../components/round_icon_button.dart';
import '../models/bmi_calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  Gender selectedGender;
  int _height = 180;
  int _weight = 60;
  int _age = 23;

  int _sliderMinValue = 120;
  int _sliderMaxValue = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () => setState(() => selectedGender = Gender.male),
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableIconContentCard(
                        genderIcon: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () =>
                        setState(() => selectedGender = Gender.female),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableIconContentCard(
                        genderIcon: FontAwesomeIcons.venus, gender: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$_height', style: kNumberTextStyle),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kActiveTrackColor,
                      inactiveTrackColor: kInactiveTrackColor,
                      thumbColor: kThumbColor,
                      overlayColor: kOverlayColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: _sliderMinValue.toDouble(),
                      max: _sliderMaxValue.toDouble(),
                      onChanged: (double value) =>
                          setState(() => _height = value.toInt()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableBottomCardText(
                            textTitle: 'WEIGHT', number: _weight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconType: FontAwesomeIcons.minus,
                              onPressed: () => setState(() => _weight--),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconType: FontAwesomeIcons.plus,
                              onPressed: () => setState(() => _weight++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableBottomCardText(textTitle: 'AGE', number: _age),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconType: FontAwesomeIcons.minus,
                              onPressed: () => setState(() => _age--),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconType: FontAwesomeIcons.plus,
                              onPressed: () => setState(
                                () => _age++,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          NavButton(
            buttonText: 'CALCUATE',
            onTap: () {
              CalculatorBrain bmi =
                  CalculatorBrain(height: _height, weight: _weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmi.calculateBMI(),
                    resultText: bmi.getResult(),
                    interpretation: bmi.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ReusableBottomCardText extends StatelessWidget {
  ReusableBottomCardText({@required this.number, @required this.textTitle});

  String textTitle;
  int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$textTitle',
          style: kLabelTextStyle,
        ),
        Text(
          '$number',
          style: kNumberTextStyle,
        )
      ],
    );
  }
}
