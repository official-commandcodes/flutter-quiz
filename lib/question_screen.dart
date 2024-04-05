import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    void onAnswerButtonTap(String selectedAnswer) {
      widget.onSelectedAnswer(selectedAnswer);

      setState(() {
        if (questions.length - 1 == currentQuestion) {
          currentQuestion = 0;
        } else {
          currentQuestion++;
        }
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 222, 162, 244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...question.getShuffledAnswer().map(
                  (answer) => AnswerButton(
                      content: answer, onTap: () => onAnswerButtonTap(answer)),
                ),
          ],
        ),
      ),
    );
  }
}
