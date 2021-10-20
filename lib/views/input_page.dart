import 'package:bmi_calculator/views/results_page.dart';
import 'package:bmi_calculator/components/roundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/calculator_brain.dart';

import '../components/bottom_button.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { female, male, none }
enum IntUpdater { increase, decrease }

class _InputPageState extends State<InputPage> {
  late Gender chosenGender = Gender.none;

  int height = 180;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerWindow(
                      color: chosenGender == Gender.male
                          ? kOnTapColor
                          : kReusableColor,
                      cardChild: const IconCard(
                        iconType: FontAwesomeIcons.mars,
                        gender: "MALE",
                      ),
                      setNewGender: () {
                        setNewGender(Gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: ContainerWindow(
                      color: chosenGender == Gender.female
                          ? kOnTapColor
                          : kReusableColor,
                      cardChild: const IconCard(
                        iconType: FontAwesomeIcons.venus,
                        gender: "FEMALE",
                      ),
                      setNewGender: () {
                        setNewGender(Gender.female);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ContainerWindow(
                color: kReusableColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white38,
                          thumbColor: Colors.redAccent,
                          overlayColor: Color(0x240FF8A80),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerWindow(
                      color: kReusableColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: increaseWeight,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: decreaseWeight,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerWindow(
                      color: kReusableColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: increaseHeight,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: decreaseHeight,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATE",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight, age: age);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      interpretation: calc.getInterpretation(),
                      bmiResults: calc.calculateBMI(),
                      resultText: calc.getResults(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }

  void setNewGender(Gender gender) {
    setState(() {
      chosenGender = gender;
    });
  }

  void decreaseWeight() {
    setState(() {
      weight--;
    });
  }

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseHeight() {
    setState(() {
      age--;
    });
  }

  void increaseHeight() {
    setState(() {
      age++;
    });
  }
}
