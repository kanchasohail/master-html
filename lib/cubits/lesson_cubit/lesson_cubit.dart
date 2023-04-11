import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/constants/consts.dart';
import 'package:master_html/resources/lists/lessons_list.dart';
import 'package:master_html/screens/learning_screen/learning_screen.dart';
import 'package:master_html/screens/quiz_screen/quiz_screen.dart';

import '../../main.dart';
import '../quiz_cubit/quiz_cubit.dart';

//These strings are for shared preferences
const String onGoingLessonIndexKey = 'onGoingLessonIndex';
const String completedLessonsListKey = 'completedLessonsList';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit() : super(ResultInitialState());


  List<String> completedLessonsList = [];
  //This method gets the list of completed lessons
  List<String> getListOfCompletedLessons(){
    completedLessonsList =  pref.getStringList(completedLessonsListKey) ?? [];
    return completedLessonsList ;
  }

  //This method check if the use passed or failed the quiz
  bool didPassQuiz({required String resultText}) {
    if (resultText == perfectConstString) {
      return true;
    } else {
      return false;
    }
  }

  // This method is for retaking the quiz when the user fails to pass the quiz
  void retakeQuiz({required BuildContext context, required String lessonName}) {
    Navigator.of(context)
        .popAndPushNamed(QuizScreen.routeName, arguments: lessonName);
  }

  // This method is for retaking the lesson when the user fails to pass the quiz
  void retakeLesson(
      {required BuildContext context, required String lessonName}) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .popAndPushNamed(LearningScreen.routeName, arguments: lessonName);
  }

  //This method is for moving forward to the next lesson
  void nextLesson({required BuildContext context , required String lessonName}) {
    final int currentOngoingLesson = onGoingLesson;
    pref.setInt(onGoingLessonIndexKey, currentOngoingLesson + 1);
    completedLessonsList.add(lessonName);
    pref.setStringList(completedLessonsListKey, completedLessonsList);
    Navigator.of(context).pop();
    Navigator.of(context).popAndPushNamed(LearningScreen.routeName);
  }

  int get onGoingLesson {
    return pref.getInt(onGoingLessonIndexKey) ?? 0;
  }
}

//These are the state classes for this cubit
abstract class LessonState {}

class ResultInitialState extends LessonState {}
