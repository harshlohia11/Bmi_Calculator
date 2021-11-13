import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/components/bottombutton.dart';
import 'package:flutter/painting.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiresult, this.result, this.interpretation});
  var bmiresult;
  var result;
  var interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0D22),
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  result,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Color(0xFF24D876),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  bmiresult,
                  style:
                      TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      "Normal body range:",
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "18.5-25 kg/m2",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            )),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: "RE-CALCULATE YOUR BMI")
        ],
      ),
    );
  }
}
