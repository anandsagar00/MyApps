import 'package:bmicalculator/genderWidgets.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

//these are the colors which is going to change when the user interacts with app
//I've made all these app as global so that other widgets in other classes can interact with these var and can change them
Color toBeChangedWhenTappedMale = kSecondaryUIColor;
Color toBeChangedWhenTappedFemale = kSecondaryUIColor;
int selected = 0; //this variable denotes which gender is selected
Color colorMale = Colors.white70;
Color colorFemale = Colors.white70;
int height = 180;



class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
                            selected = 1;
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
                            selected = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                HeightWidget()
              ],
            ),
          ))),
    );
    ;
  }
}


//This stateful Height Widget is responsible for the change in height , responsible for all the changes in slider
class HeightWidget extends StatefulWidget {

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  height.toString(),
                  style: kHeightWeightAgeTextStyle),
                Text(
                  'cm',
                  style: TextStyle(
                      color: Colors.white70, fontSize: 25),
                ),
              ],
            ),
            Slider(
              value: height.toDouble(),
              onChanged: (double valueOnSlider) {
                setState(() {
                  height = valueOnSlider.round();
                });
              },
              min: 100,
              max: 220,
              thumbColor: (selected == 0)
                  ? Colors.white70
                  : (selected == 1
                  ? toBeChangedWhenTappedMale
                  : toBeChangedWhenTappedFemale),
              activeColor: (selected == 0)
                  ? Colors.white70
                  : (selected == 1
                  ? toBeChangedWhenTappedMale
                  : toBeChangedWhenTappedFemale),
              inactiveColor: (selected == 0)
                  ? Colors.white70
                  : Colors.limeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
