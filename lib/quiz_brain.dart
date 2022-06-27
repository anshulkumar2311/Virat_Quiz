import 'package:quizvirat/questions.dart';

class QuesBrain {
  int questionNo=0;
  List<Question> questionBank = [
    Question(q: 'Virat Kohli opened the batting with Gautam Gambhir on his India ODI debut v Sri Lanka, 2008', a: true),
    Question(
        q: 'Kohli started his World Cup journey with a century vs SriLanka.',
        a: false),
    Question(q: 'Kohli holds the record of the most runs scored in a bilateral ODI series with 558 v South Africa in 2017/18. ', a: true),
    Question(q: 'Virat has highest Run scorer of T20 International', a: false),
    Question(q: 'Virat Kohli scored consecutive Test double centuries in Nagpur and Delhi respectively in 2017', a: true),
    Question(q: 'Kohli failed to get a hundred in the 2019 World Cup.', a: true),
    Question(
        q: 'Kohli Made ODI debut in 2008',
        a: true),
    Question(q: 'Virat scored his first Test hundred vs WestIndies.', a: false),
    Question(q: 'Virat Kohli has won nine ICC awards .', a: true),
    Question(q: 'Virat highest score in T20 international is 95', a: false),
    Question(
        q: 'Virat Kohli is the only Indian batsman who got 890 rating points in the ICC ODI ranking.',
        a: true),
    Question(
        q: 'Virat Kohli scored seven double centuries as a captain in test matches. ',
        a: false),
    Question(
        q: 'Virat Kohli has the most number of 150+ scores as captain in Tests? ',
        a: true),
    Question(
        q: 'Virat Kohli scored more than 20,000 runs at an average of over 50 in all formats',
        a: true),
    Question(q: 'India lost just 2 bilateral T20 series under Virat captaincy?', a: true),
    Question(
        q: 'Virat Kohli took over the Test captaincy when India was ranked 7th and Virat steps down from Captaincy when India ranked No.2.',
        a: false),
    Question(
        q: 'Virat as captain won the T20I series in South Africa, England, New Zealand, and Australia',
        a: true),
  ];

  void nextques(){
    if(questionNo < questionBank.length-1){
      questionNo++;
    }
  }
  String getQuesText(){
    return questionBank[questionNo].quesTxt;
  }
  bool getcorrectans(){
    return questionBank[questionNo].quesAns;
  }
}