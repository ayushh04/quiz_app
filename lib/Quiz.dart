// Quiz.dart
import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionScreen.dart';
import 'package:quiz_app/StartScreen.dart';
import 'Question.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  void switchScreen() {
    setState(() {
      screenHolder = 2;
    });
  }

  int screenHolder = 1;

  Widget? activeScreen;

  @override
  Widget build(BuildContext context) {
    activeScreen = StartScreen(switchScreen);
    if (screenHolder == 2) {
      activeScreen =
          QuestionScreen(question); // Pass question list to QuestionScreen
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade300, Colors.pink.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
