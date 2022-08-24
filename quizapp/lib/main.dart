import 'package:flutter/material.dart';
import 'question.dart';
import 'package:cool_alert/cool_alert.dart'; //package to display alert

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Question> questions = [
    Question('The atomic number for lithium is 17', false),
    Question('The unicorn is the national animal of Scotland', true),
    Question(
        'The Great Wall of China is longer than the distance between London and Beijing',
        true),
  ];
  int totalquestions = 3;
  List<Icon> score =
      []; // this will display the tick/cross at the bottom of screen depending on correct or wrong answer
  int questionnumber = 0; // this will keep track of the question number
  int marks = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Quiz App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                questions[questionnumber].questionText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 380,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    elevation: 3,
                  ),
                  onPressed: () {
                    setState(() {
                      if (questions[questionnumber].answer == true) {
                        score.add(
                          Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        );
                        marks++;
                      } else
                        score.add(
                          Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        );
                      questionnumber++;
                      if (questionnumber >= totalquestions) {
                        runApp(ScoreCard(marks,totalquestions));
                        questionnumber = 0;
                        score = [];
                      }
                    });
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 380,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    elevation: 3,
                  ),
                  onPressed: () {
                    setState(() {
                      if (questions[questionnumber].answer == false)
                        score.add(
                          Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        );
                      else
                        score.add(
                          Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        );
                      questionnumber++;
                      if (questionnumber >= totalquestions) {
                        runApp(ScoreCard(marks,totalquestions));
                        questionnumber = 0;
                        score = [];
                      }
                    });
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: score,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  // const ScoreCard({Key? key}) : super(key: key);
  int score = 0, total = 0;
  ScoreCard(int score, int total) {
    this.score = score;
    this.total = total;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Quiz App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You scored $score out of $total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
