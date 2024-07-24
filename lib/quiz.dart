import 'package:flutter/material.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/results_screen.dart';
import 'package:quiz/start_page.dart';
import 'package:quiz/data/questions.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswers(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        // selectedAnswers= [];
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers= [];
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartPage(switchScreen);

    if(activeScreen == 'question_screen'){
      screenWidget =  QuestionScreen(chooseAnswers: chooseAnswers);
    }

    if(activeScreen == 'results_screen'){
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart : restartQuiz);
    }

    return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 78, 13, 151), Color.fromARGB(255, 107, 15, 168)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
            child:  screenWidget
          ),
    
    );
  }
}