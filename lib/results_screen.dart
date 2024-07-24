import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List <Map<String,Object>> getSummaryData(){
    final List <Map<String,Object>> summary = [];

    for(var i =0; i<chosenAnswers.length; i++){
      summary.add({
        'question_index' : i,
        'question' : questions[i].question,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Answered $numOfCorrectQuestions out of $numOfTotalQuestions Questions Correctly"),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(onPressed: onRestart, child: const Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }

}