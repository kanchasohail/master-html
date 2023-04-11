import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/common_widgets/custom_button.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/screens/result_screen/widgets/result_container.dart';

import '../../constants/consts.dart';
import '../../cubits/quiz_cubit/quiz_cubit.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result-screen';

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argsData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<Map<String, dynamic>> playedQuiz = argsData['playedQuiz'];
    final int correctAnswersCount = argsData['correctAnswerCount'];
    final String resultText = argsData['resultText'];
    final resultCubit = BlocProvider.of<LessonCubit>(context);
    final bool didPassQuiz = resultCubit.didPassQuiz(resultText: resultText);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz Result"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 24),
                            child: Text(
                              resultText,
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, bottom: 18),
                            child: Text(
                              "You've got $correctAnswersCount out of ${playedQuiz.length} questions correct.",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification:
                                  (OverscrollIndicatorNotification overscroll) {
                                overscroll.disallowIndicator();
                                return true;
                              },
                              child: ListView.builder(
                                itemCount: playedQuiz.length,
                                itemBuilder: (context, index) {
                                  return resultContainer(
                                      isCorrect: playedQuiz[index]['isCorrect'],
                                      questionText:
                                          "${index + 1}. ${playedQuiz[index]['question']}",
                                      selectedAnswer: playedQuiz[index]
                                          [selectedAnswerConstString],
                                      context: context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: didPassQuiz
                          ? customButton(
                              text: "Next Lesson",
                              backgroundColor: orangeColor,
                              context: context,
                              onPressed: () {
                                resultCubit.nextLesson(context: context , lessonName:argsData['lessonName'] );
                              })
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: customButton(
                                    text: "Retake Lesson",
                                    backgroundColor: orangeColor,
                                    context: context,
                                    onPressed: () {
                                      resultCubit.retakeLesson(
                                          context: context,
                                          lessonName: argsData['lessonName']);
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: customButton(
                                    text: "Retake Quiz",
                                    backgroundColor: orangeColor,
                                    context: context,
                                    onPressed: () {
                                      resultCubit.retakeQuiz(
                                          context: context,
                                          lessonName: argsData['lessonName']);
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
