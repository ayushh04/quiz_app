import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assetss/Quiz.png',
            color: Color.fromARGB(150, 255, 255, 255),
            width: 450,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Click The Below Button To Begin!",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
              onPressed: switchScreen,
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white70, fontSize: 25),
              ))
        ],
      ),
    );
  }
}
