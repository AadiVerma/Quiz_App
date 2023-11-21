import 'package:flutter/material.dart';
import 'Models/answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.chooseanswer});

  final void Function(String answer) chooseanswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  var currentquestionindex = 0;

  void answerQuestion(String selectedanswer) {
    widget.chooseanswer(selectedanswer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                currentquestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 53, 5, 77),
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 30),
            ...currentquestion.getshuffleans().map((answer) {
              return AnswerButton(answertext: answer, onTap: () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
