import 'package:flutter/material.dart';
import 'constants.dart';

class SecondScreen extends StatefulWidget {
  int height, weight;
  final Color toBeChangedWhenTappedMale;
  final Color toBeChangedWhenTappedFemale;
  final int selected;
  SecondScreen(
      @required this.height,
      @required this.weight,
      @required this.selected,
      @required this.toBeChangedWhenTappedMale,
      @required this.toBeChangedWhenTappedFemale);

  @override
  State<SecondScreen> createState() => _SecondScreenState(height, weight,
      selected, toBeChangedWhenTappedMale, toBeChangedWhenTappedFemale);
}

class _SecondScreenState extends State<SecondScreen> {
  int height, weight;
  final Color toBeChangedWhenTappedMale;
  final Color toBeChangedWhenTappedFemale;
  final int selected;
  _SecondScreenState(
      @required this.height,
      @required this.weight,
      @required this.selected,
      @required this.toBeChangedWhenTappedMale,
      @required this.toBeChangedWhenTappedFemale);

  @override
  Widget build(BuildContext context) {
    return MySecondHome(height, weight, selected, toBeChangedWhenTappedMale,
        toBeChangedWhenTappedFemale);
  }
}

class MySecondHome extends StatefulWidget {
  int height, weight;
  final Color toBeChangedWhenTappedMale;
  final Color toBeChangedWhenTappedFemale;
  final int selected;
  MySecondHome(
      @required this.height,
      @required this.weight,
      @required this.selected,
      @required this.toBeChangedWhenTappedMale,
      @required this.toBeChangedWhenTappedFemale);
  @override
  State<MySecondHome> createState() => _MySecondHomeState(height, weight,
      selected, toBeChangedWhenTappedMale, toBeChangedWhenTappedFemale);
}

class _MySecondHomeState extends State<MySecondHome> {
  int height, weight;
  final Color toBeChangedWhenTappedMale;
  final Color toBeChangedWhenTappedFemale;
  final int selected;
  _MySecondHomeState(
      @required this.height,
      @required this.weight,
      @required this.selected,
      @required this.toBeChangedWhenTappedMale,
      @required this.toBeChangedWhenTappedFemale);
  double _bmi = 1;
  String calculateBMI() {
    _bmi = (weight * 10000) / (height * height);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    calculateBMI();
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    calculateBMI();
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryUIColor,
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
          ),
          backgroundColor: kPrimaryUIColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSecondaryUIColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getResult(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: getResult() == 'Normal'
                              ? Colors.green
                              : Colors.red.shade400,
                          letterSpacing: 2),
                    ),
                    Text(
                      calculateBMI(),
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(getInterpretation(),style: TextStyle(color: Colors.tealAccent,fontWeight: FontWeight.w900,fontSize: 30),textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: (selected == 0)
                      ? toBeChangedWhenTappedFemale
                      : (selected == 1
                          ? toBeChangedWhenTappedMale
                          : toBeChangedWhenTappedFemale),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  'RE-CALCULATE BMI',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: (selected == 0)
                        ? Colors.white70
                        : (Colors.lightGreenAccent),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                print('calculate button pressed');
              },
            )
          ],
        ));
  }
}
