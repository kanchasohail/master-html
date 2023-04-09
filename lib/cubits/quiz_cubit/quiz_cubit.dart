import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/quiz_screen/widgets/result_screen.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitialState());
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  String currentSelectedAnswer = '';
  bool isCorrect = false;


  //This method is for selecting any option
  void answerQuestion(
      {required String selectedAnswer, required String correctAnswer}) {
    currentSelectedAnswer = selectedAnswer;
    if (selectedAnswer == correctAnswer) {
      // correctAnswers += 1 ;
      isCorrect = true;
      emit(QuizAnsweredState());
    } else {
      isCorrect = false;
      emit(QuizAnsweredState());
    }
  }

  // This method is for getting the next question
  void nextQuestion(int questionsLength) {
    if (currentQuestionIndex == questionsLength - 1) {
      emit(QuizLastQuestionState());
      return;
    } else {
      if (isCorrect) {
        correctAnswers += 1;
      }
      currentQuestionIndex += 1;
      emit(QuizNextQuestionState());
    }
  }

  // This method is for getting the previous question
  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      correctAnswers -= 1;
      currentQuestionIndex -= 1;
      emit(QuizPreviousQuestionState());
    } else {
      correctAnswers = 0;
      emit(QuizFirstQuestionState());
    }
  }

  // This method is for finishing the quiz
  void submitAnswers({required BuildContext context, required int quizLength}) {
    if (isCorrect) {
      correctAnswers += 1;
    }
    Navigator.of(context).pushReplacementNamed(ResultScreen.routeName,
        arguments: {
          "total_questions": quizLength,
          "correct_answers": correctAnswers
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
