import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/models/quiz_model.dart';
import '../../screens/result_screen/result_screen.dart';

//These are the frequently used strings
const String selectedAnswerConstString = "selectedAnswer";

const String isCorrectConstString = "isCorrect";

const String perfectConstString = "Perfect !";

const String almostThereConstString = "Almost There !";

const String pleaseStudyConstString = "Please Study !";

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
        selectedAnswerConstString: "",
        isCorrectConstString: false
      };
    }).toList();
  }

  //This method is for selecting any option
  void answerQuestion(
      {required String question,
      required String selectedAnswer,
      required String correctAnswer}) {
    currentSelectedAnswer = selectedAnswer;
    playedQuiz[currentQuestionIndex][selectedAnswerConstString] =
        selectedAnswer;

    playedQuiz[currentQuestionIndex][isCorrectConstString] = selectedAnswer == correctAnswer;
    emit(QuizAnsweredState());

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
    if (playedQuiz[currentQuestionIndex][selectedAnswerConstString] != "") {
      currentSelectedAnswer =
          playedQuiz[currentQuestionIndex][selectedAnswerConstString];
      emit(QuizAnsweredState());
    }
  }

  // This method is for getting the previous question
  void previousQuestion() {
    currentSelectedAnswer =
        playedQuiz[currentQuestionIndex][selectedAnswerConstString];
    if (currentQuestionIndex > 0) {
      currentQuestionIndex -= 1;
      emit(QuizPreviousQuestionState());
    } else {
      emit(QuizFirstQuestionState());
    }
    if (playedQuiz[currentQuestionIndex][selectedAnswerConstString] != "") {
      currentSelectedAnswer =
          playedQuiz[currentQuestionIndex][selectedAnswerConstString];
      emit(QuizAnsweredState());
    }
  }

  // This method is for finishing the quiz
  void submitAnswers(
      {required BuildContext context, required String lessonName}) {
    int correctAnswersCount = 0;
    String resultText = 'Hello There !';
    for (var element in playedQuiz) {
      if (element[isCorrectConstString] == true) {
        correctAnswersCount++;
      }
    }
    if (correctAnswersCount == playedQuiz.length) {
      resultText = perfectConstString;
    } else if (correctAnswersCount < playedQuiz.length &&
        correctAnswersCount > playedQuiz.length - 2) {
      resultText = almostThereConstString;
    } else {
      resultText = pleaseStudyConstString;
    }
    Navigator.of(context)
        .pushReplacementNamed(ResultScreen.routeName, arguments: {
      "playedQuiz": playedQuiz,
      "correctAnswerCount": correctAnswersCount,
      "resultText": resultText,
      "lessonName": lessonName,
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
