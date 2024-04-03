import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Question',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          AnswerButton(content: 'Answer 1', onTap: () {}),
          AnswerButton(content: 'Answer 2', onTap: () {}),
          AnswerButton(content: 'Answer 3', onTap: () {}),
        ],
      ),
    );
  }
}
