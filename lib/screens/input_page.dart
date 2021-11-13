import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/ReusableCard.dart';
import '../components/IconContent.dart';
import '../components/bottombutton.dart';
import './results_page.dart';
import 'package:bmi_calculator/calculate_bmi.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int age = 18;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0D22),
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kTextStyleString,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kTextStyleNumber,
                        ),
                        Text("cm", style: kTextStyleString)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF888993),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          }),
                    )
                  ],
                ),
              )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextStyleString,
                      ),
                      Text(
                        weight.toString(),
                        style: kTextStyleNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: FaIcon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                            backgroundColor: Color(0xFF111428),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            backgroundColor: Color(0xFF111428),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kTextStyleString,
                      ),
                      Text(
                        age.toString(),
                        style: kTextStyleNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: FaIcon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                            backgroundColor: Color(0xFF111428),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            backgroundColor: Color(0xFF111428),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          BottomButton(
              onTap: () {
                CalcutorBrain calc =
                    CalcutorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiresult: calc.CalculateBmi(),
                      result: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              buttonTitle: "CALCULATE BMI")
        ],
      ),
    );
  }
}
