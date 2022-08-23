import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const DiceRoller());
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);
  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _dice_number = 1;
  var player=AudioCache();
  void _changeDice() {
    player.play('audios/dice_roll.mp3');
    setState(() {
      _dice_number = Random().nextInt(6)+1;
      print(_dice_number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          title: Text(
            'Dice Roller',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ElevatedButton(
          child: Center(
            child: Image(
              image: AssetImage('assets/images/$_dice_number.png'),
            ),
          ),
          onPressed: _changeDice,
        ),
      ),
    );
  }
}
