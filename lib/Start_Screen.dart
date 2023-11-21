import 'package:flutter/material.dart';
import 'package:quiz/Quiz.dart';
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget {
  const StartScreen(this.QuizStart,{super.key});
  final void Function() QuizStart;

  @override
  Widget build( context) {
    return Center(
      child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Opacity(
                //   opacity:0.6,
                //   child: Image.asset('assets/images/quiz-logo.png',
                //   width:300),
                // ), // another approach
                Image.asset('assets/images/quiz-logo.png',
                    width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
                const SizedBox(height: 80),
                 Text(
                  'Learn Flutter the Fun Way !',
                  style: GoogleFonts.lato(
                    color:Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 30),
                OutlinedButton.icon(
                  onPressed:QuizStart,
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 3,
                      )),
                  icon: const Icon(Icons.arrow_right_alt_outlined),
                  label: const Text('Start Quiz'),
                ),
              ],

      ),
    );
  }
}
