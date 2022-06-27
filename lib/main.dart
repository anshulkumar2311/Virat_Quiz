import 'package:flutter/material.dart';
import 'package:quizvirat/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:math';
import 'quiz_brain.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audio_cache.dart';
QuesBrain quizBrain = QuesBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViratPage(),
    );
  }
}

class ViratPage extends StatefulWidget {
  const ViratPage({Key? key}) : super(key: key);
  @override
  State<ViratPage> createState() => _ViratPageState();
}

class _ViratPageState extends State<ViratPage> {
  void playSound(){

  }
  List<Widget> scoreKeeper=[];
  void checkAnswer(bool userAnswer){
    bool ans = quizBrain.getcorrectans();
    setState(() {
      if ( quizBrain.questionNo == 15) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.questionNo=0;

        scoreKeeper = [];
      }
      else {
        if (userAnswer == ans) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        }
        else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextques();
      };
    });
  }
  int imgno= Random().nextInt(33)+1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virat Quiz' , style: TextStyle(
          fontFamily: 'pacifico',
          fontSize: 30,
        ),),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/virat$imgno.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      quizBrain.getQuesText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SourceSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: (){
                    final player = AudioCache();
                    player.play('kahani.mp3');
                  },
                child:  Icon(
                  Icons.music_off,
                  color: Colors.black,
                ),
              ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: TextButton(
                    child: Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                      imgno= Random().nextInt(33)+1;
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      primary: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: TextButton(
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                      imgno= Random().nextInt(33)+1;
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      primary: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
