import 'package:quiz/Models/Quiz_Questions.dart';
class Quizquestions{
  const Quizquestions(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String> getshuffleans(){
final shuffledlist=List.of(answers);
    shuffledlist.shuffle();
return shuffledlist;// we copied the list and apply shuffle on that one as inbuilt shuffle function bring changex to actual list as well
  }
}