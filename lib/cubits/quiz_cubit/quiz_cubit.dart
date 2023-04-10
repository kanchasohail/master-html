import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/models/quiz_model.dart';
import '../../screens/quiz_screen/widgets/result_screen.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitialState());
  int currentQuestionIndex = 0;
  String currentSelectedAnswer = 'null';
  List<Map<String, dynamic>> playedQuiz = [];

  //This method is for initial quizSetup
  void quizInitialSetup(List<QuizModel> quiz) {
    playedQuiz = quiz.map((element) {
      return {
        "question": element.question,
        "selectedAnswer": "",
        "isCorrect": false
      };
    }).toList();
  }

  //This method is for selecting any option
  void answerQuestion(
      {required String question,
      required String selectedAnswer,
      required String correctAnswer}) {
    currentSelectedAnswer = selectedAnswer;
    playedQuiz[currentQuestionIndex]["selectedAnswer"] = selectedAnswer;
    if (selectedAnswer == correctAnswer) {
      playedQuiz[currentQuestionIndex]["isCorrect"] = true;
      emit(QuizAnsweredState());
    } else {
      playedQuiz[currentQuestionIndex]["isCorrect"] = false;
      emit(QuizAnsweredState());
    }
  }

  // This method is for getting the next question
  void nextQuestion(int questionsLength) {
    if (currentQuestionIndex == questionsLength - 1) {
      emit(QuizLastQuestionState());
      return;
    } else {
      currentQuestionIndex += 1;
      emit(QuizNextQuestionState());
    }
    if (playedQuiz[currentQuestionIndex]['selectedAnswer'] != "") {
      currentSelectedAnswer =
          playedQuiz[currentQuestionIndex]['selectedAnswer'];
      emit(QuizAnsweredState());
    }
  }

  // This method is for getting the previous question
  void previousQuestion() {
    currentSelectedAnswer = playedQuiz[currentQuestionIndex]['selectedAnswer'];
    if (currentQuestionIndex > 0) {
      currentQuestionIndex -= 1;
      emit(QuizPreviousQuestionState());
    } else {
      emit(QuizFirstQuestionState());
    }
    if (playedQuiz[currentQuestionIndex]['selectedAnswer'] != "") {
      currentSelectedAnswer =
          playedQuiz[currentQuestionIndex]['selectedAnswer'];
      emit(QuizAnsweredState());
    }
  }

  // This method is for finishing the quiz
  void submitAnswers({required BuildContext context}) {
    int correctAnswersCount = 0;
    String resultText = 'Hello There !';
    for (var element in playedQuiz) {
      if (element['isCorrect'] == true) {
        correctAnswersCount++;
      }
    }
    if(correctAnswersCount == playedQuiz.length){
      resultText = "Perfect !";
    }else if(correctAnswersCount < playedQuiz.length && correctAnswersCount > playedQuiz.length - 2){
      resultText = "Almost There !" ;
    }else {
      resultText = "Please Study !";
    }
    Navigator.of(context).pushReplacementNamed(ResultScreen.routeName,
        arguments: {
          "playedQuiz": playedQuiz,
          "correctAnswerCount": correctAnswersCount ,
          "resultText" : resultText
        });
  }
}

//These are the state classes for this cubit
abstract class QuizState {}

class QuizInitialState extends QuizState {}

class QuizAnsweredState extends QuizState {}

class QuizNextQuestionState extends QuizState {}

class QuizPreviousQuestionState extends QuizState {}

class QuizFirstQuestionState extends QuizState {}

class QuizLastQuestionState extends QuizState {}
