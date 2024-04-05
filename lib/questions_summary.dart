import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: data['correct_answer'] == data['user_answer']
                          ? const Color.fromARGB(255, 217, 142, 231)
                          : const Color.fromARGB(255, 138, 206, 225),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (data['question'] as String),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 231, 197, 236)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          (data['correct_answer'] as String),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 217, 142, 231),
                          ),
                        ),
                        Text(
                          (data['user_answer'] as String),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 138, 206, 225),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
