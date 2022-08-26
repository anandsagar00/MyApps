//This code hasn't been used anywhere

import 'package:flutter/material.dart';
import 'constants.dart';

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
          Text(variable.toString(),style: kNumberTextStyle,textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(onPressed:()
              {
                setState(() {
                  variable--;
                });
              },
                child: Icon(Icons.remove),
                backgroundColor: Color(0x291D1F32),
                elevation: 3,
              ),
              SizedBox(width: 10,),
              FloatingActionButton(onPressed:()
              {
                setState(() {
                  variable++;
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
