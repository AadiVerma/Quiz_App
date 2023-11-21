import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Models/questions_Identifier.dart';

class Summary_Item extends StatelessWidget {
  const Summary_Item(this.itemdata, {super.key});

  final Map<String, Object> itemdata;

  @override
  Widget build(BuildContext context) {
    final correctans = itemdata['user_answer'] == itemdata['correct_answers'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Question_Identifier(
          questionindex: itemdata['questions_index'] as int,
          correctans: correctans,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (itemdata['question']) as String,
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                (itemdata['user_answer']) as String,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                (itemdata['correct_answers']) as String,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
