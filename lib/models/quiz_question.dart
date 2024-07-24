class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  //Shuffle the copy list so that it doesn't hamper the original list
  List<String>getShuffledAnswer(){
    final shuffledList =  List.of(answers); //copy
    shuffledList.shuffle(); //shuffle
    return shuffledList; //return
  }
}