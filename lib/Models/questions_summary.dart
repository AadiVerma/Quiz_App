import 'package:flutter/material.dart';
import 'package:quiz/Models/Result_Screen.dart';
import 'package:quiz/Models/questions_Identifier.dart';
import 'package:quiz/Models/summary_item.dart';

class Questions_Summary extends StatelessWidget {
  Questions_Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Summary_Item(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
