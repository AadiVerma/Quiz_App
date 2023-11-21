import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/Models/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chooseAnswers, required this.onRestart});

  final List<String> chooseAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'questions_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answer': chooseAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summarys = getSummaryData();
    final NumTotalQuestions = questions.length;
    final NumCorrectQuestions = summarys.where((data) {
      return data['correct_answers'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered ${NumCorrectQuestions} out of ${NumTotalQuestions} Questions Correctly ! ',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(fontSize: 21, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Questions_Summary(summarys),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
