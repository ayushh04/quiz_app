// QuestionScreen.dart
import 'package:flutter/material.dart';
import 'package:quiz_app/FinalScreen.dart';
import 'Question.dart';
import 'dart:async';

class QuestionScreen extends StatefulWidget {
  final List<QuestionModal> questions;

  QuestionScreen(this.questions);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  Color feedbackColor = Colors.transparent;
  Timer? _timer;
  int _remainingTime = 10; // 10 seconds for each question
  bool showNextQuestion = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _remainingTime = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
          checkAnswer(-1); // Auto select wrong answer
        }
      });
    });
  }

  void checkAnswer(int selectedIndex) {
    _timer?.cancel();
    if (selectedIndex ==
        widget.questions[currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        feedbackColor = Colors.green;
        score++;
      });
    } else {
      setState(() {
        feedbackColor = Colors.red;
      });
    }

    Future.delayed(Duration(seconds: 1), () {
      if (currentQuestionIndex < widget.questions.length - 1) {
        setState(() {
          feedbackColor = Colors.transparent;
          showNextQuestion = false;
          currentQuestionIndex++;
          startTimer(); // Restart the timer for the next question
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FinalScreen(score: score, total: widget.questions.length)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Time Remaining: $_remainingTime',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: feedbackColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: feedbackColor == Colors.transparent
                      ? Colors.black12
                      : feedbackColor,
                  width: 2,
                ),
              ),
              child: Text(
                question.question,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ...List.generate(question.options.length, (index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: ElevatedButton(
                  onPressed: showNextQuestion ? null : () => checkAnswer(index),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    question.options[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
