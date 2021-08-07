import 'package:flutter/material.dart';

import 'Question.dart';

void main() {
  runApp(QuizeApp());
}

class QuizeApp extends StatefulWidget {
  const QuizeApp({Key? key}) : super(key: key);
  @override
  _QuizeAppState createState() => _QuizeAppState();
}

class _QuizeAppState extends State<QuizeApp> {
  static List<Question> questions = <Question>[
    new Question("Chaimae is the most cutest Girl Ever", true),
    new Question("Chaimae is rude", false),
    new Question("Chaimae is the wife of issam boutissante", true),
    new Question("Chaimae Doesn't love issam", false),
  ];
  int currentQuestionNumber = 0;
  List<Icon> answers = <Icon>[];
  bool isGameOver = false;
  void nextQuestion(bool answer) {
    if (isGameOver == false) {
      if (questions[currentQuestionNumber].answer == answer) {
        setState(() {
          answers.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        });
      } else {
        setState(() {
          answers.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        });
      }
    }
    if (currentQuestionNumber == questions.length - 1) {
      isGameOver = true;
    } else {
      setState(() {
        currentQuestionNumber++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      questions[currentQuestionNumber].question,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            nextQuestion(true);
                          },
                          child: Text(
                            "True",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            nextQuestion(false);
                          },
                          child: Text(
                            "False",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: answers,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
