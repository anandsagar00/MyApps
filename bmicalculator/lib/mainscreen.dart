import 'package:bmicalculator/genderWidgets.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'resultScreen.dart';

//these are the colors which is going to change when the user interacts with app
//I've made all these app as global so that other widgets in other classes can interact with these var and can change them
Color toBeChangedWhenTappedMale = kSecondaryUIColor;
Color toBeChangedWhenTappedFemale = kSecondaryUIColor;
int selected = 0; //this variable denotes which gender is selected
Color colorMale = Colors.white70;
Color colorFemale = Colors.white70;
int height = 180;
int age = 30;
int weight = 65;

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/second' : (context) => SecondScreen(height,weight,selected,toBeChangedWhenTappedMale,toBeChangedWhenTappedFemale),
      },
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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
              Expanded(child: HeightWidget()),
              Expanded(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: AgeWeight('WEIGHT', 1)),
                    Expanded(child: AgeWeight('AGE', 2)),
                  ],
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
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                  ),
                  child: Text(
                    'CALCULATE BMI',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,
                      color: (selected==0)?Colors.white70:(Colors.lightGreenAccent),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: ()
                {
                  Navigator.pushNamed(context, '/second',);
                  print('calculate button pressed');
                },
              )
            ],
          ),
        ));
  }
}


//This widget is responsible for the slider in middle
class HeightWidget extends StatefulWidget {
  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kSecondaryUIColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 10,width: double.infinity,),
          Text(
            'HEIGHT',
            style: TextStyle(color: Colors.white70, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,width: double.infinity,),
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(height.toString(), style: kNumberTextStyle),
              Text(
                'cm',
                style: TextStyle(color: Colors.white70, fontSize: 25),
              ),
            ],
          ),
          SizedBox(height: 10,width: double.infinity,),
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
            inactiveColor:
                (selected == 0) ? Colors.white70 : Colors.limeAccent,
          ),
          SizedBox(height: 10,width: double.infinity,),
        ],
      ),
    );
  }
}


//This widget is responsible for the Age and Weight widgets in the bottom
class AgeWeight extends StatefulWidget {

  int variable;//the parameter which will vary
  final String text;//the text to be displayed
  AgeWeight(@required this.text,@required this.variable);
  @override
  State<AgeWeight> createState() => _AgeWeightState(text,variable);
}

class _AgeWeightState extends State<AgeWeight> {

  int variable;//the parameter which will vary
  final String text;//the text to be displayed
  _AgeWeightState(@required this.text,@required this.variable);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kSecondaryUIColor,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,style: TextStyle(color: Colors.white70, fontSize: 20),
            textAlign: TextAlign.center,),
          Text(variable==1?weight.toString():age.toString(),style: kNumberTextStyle,textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(onPressed:()
              {
                setState(() {
                  if(variable==1)
                  weight--;
                  else
                    age--;
                });
              },
                heroTag: 'button1',
                child: Icon(Icons.remove),
                backgroundColor: Color(0x291D1F32),
                elevation: 3,
              ),
              SizedBox(width: 10,),
              FloatingActionButton(heroTag:'button2',onPressed:()
              {
                setState(() {
                  if(variable==1)
                    weight++;
                  else
                    age++;
                });
              },
                child: Icon(Icons.add),
                backgroundColor: Color(0x291D1F32),
                elevation: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
