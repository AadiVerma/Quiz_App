import 'package:flutter/material.dart';
import 'package:quiz/Start_Screen.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/Models/Result_Screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activescreen;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   activescreen= StartScreen(SwitchScreen);
  //   super.initState();
  // } // alternative way
  var activescreen = 'start-screen';
   List<String> slectedAnswers=[];
   void Restart(){
     setState(() {
       slectedAnswers=[];
       activescreen='question-screen';
     });
   }
  void SwitchScreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    void chooseAnswer(String answer){
      slectedAnswers.add(answer);
      if(slectedAnswers.length==questions.length){ // my addition to keep going
      setState(() {
        activescreen='results-screen';
      });
      }
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(207, 167, 25, 232),
            Color.fromARGB(255, 220, 39, 225),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: activescreen == 'start-screen'
              ? StartScreen(SwitchScreen)
              : activescreen=='question-screen'?Questions(chooseanswer: chooseAnswer):ResultScreen(chooseAnswers: slectedAnswers,onRestart: Restart,),
        ),
      ),
    );
  }
}
