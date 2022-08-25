import 'package:bmicalculator/genderWidgets.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //these are the colors which is going to change when the user interacts with app
  Color toBeChangedWhenTappedMale = kSecondaryUIColor;
  Color toBeChangedWhenTappedFemale = kSecondaryUIColor;
  Color colorMale = Colors.white70;
  Color colorFemale = Colors.white70;

  int height = 180;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (Scaffold(
          backgroundColor: kPrimaryUIColor,
          appBar: AppBar(
            title: Text(
              'BMI Calculator',
            ),
            backgroundColor: kPrimaryUIColor,
          ),
          body: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: GenderWidget(Icons.male, 'MALE',
                            toBeChangedWhenTappedMale, colorMale),
                        onTap: () {
                          setState(() {
                            print('tapped male');
                            toBeChangedWhenTappedMale = Color(0xFF0096FF);
                            toBeChangedWhenTappedFemale = kSecondaryUIColor;
                            colorMale = Colors.limeAccent;
                            colorFemale = Colors.white70;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: GenderWidget(Icons.female, 'FEMALE',
                            toBeChangedWhenTappedFemale, colorFemale),
                        onTap: () {
                          setState(() {
                            print('tapped female');
                            toBeChangedWhenTappedFemale = Color(0xFFFF2E63);
                            toBeChangedWhenTappedMale = kSecondaryUIColor;
                            colorMale = Colors.white70;

                            colorFemale = Colors.limeAccent;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSecondaryUIColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Row(textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            Text('cm' ,style: TextStyle(color: Colors.white70,fontSize: 25),),
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ))),
    );
    ;
  }
}
