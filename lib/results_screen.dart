import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartScreen,
  });

  final List<String> chosenAnswers;
  final void Function() restartScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final numTotalQuestions = summary.length;
    final numCorrectQuestions = summary
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 217, 142, 231),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summary),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: restartScreen,
                icon: const Icon(Icons.rotate_right),
                label: Text(
                  'Restart Quiz!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 217, 142, 231),
                    fontSize: 17,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
