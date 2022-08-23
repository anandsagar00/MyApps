import 'package:flutter/material.dart';

void main() {
  runApp(CardApp());
}

class CardApp extends StatelessWidget {
  const CardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: Text(
            "MyCard",
              style: TextStyle(
                color: Colors.blueGrey.shade900,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 105,
                  backgroundColor: Colors.red.shade500,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('images/photo.jpeg'),
                  ),
                ),
                SizedBox(
                  height: 3,
                  width: double.infinity,
                ),
                Text(
                  'Monkee The Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                  ),
                ),
                // SizedBox(
                //   height: 10,
                //   width: double.infinity,
                // ),
                Text(
                  'Phlutter Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 3.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                  child: Divider(color: Colors.teal,),
                ),
                Card(margin: EdgeInsets.all(5),
                  elevation: 50,
                  surfaceTintColor: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.perm_phone_msg,
                          color: Colors.teal,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '+91 123 4567 89',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: double.infinity,
                ),
                Card(margin: EdgeInsets.all(5),
                  elevation: 50,
                  surfaceTintColor: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.teal,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'developer_monkee@monkee.com',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
