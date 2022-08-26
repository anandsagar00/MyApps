import 'package:flutter/material.dart';
import 'constants.dart';

class GenderWidget extends StatelessWidget {

  final IconData icon;
  final String txt;
  final Color widgetColor;
  final Color colour;

  GenderWidget(@required this.icon,@required this.txt,@required this.widgetColor,@required this.colour);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: widgetColor),
      // color: kSecondaryUIColor, giving this would create conflict
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            icon,
            size: 60,
            color: colour,
          ),
          Text(
            txt,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: colour),
          ),
        ],
      ),
    );
  }
}
