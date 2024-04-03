import 'package:flutter/material.dart';
import 'package:flutter_quiz/question_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF32053A), Color(0xF44A1853)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
