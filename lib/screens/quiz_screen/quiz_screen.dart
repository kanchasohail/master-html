import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/quiz_cubit/quiz_cubit.dart';
import 'package:master_html/resources/quizes.dart';
import 'package:master_html/screens/quiz_screen/widgets/back_confirmation_dialogue.dart';
import 'package:master_html/common_widgets/custom_button.dart';
import 'package:master_html/screens/quiz_screen/widgets/option_container.dart';

import '../../constants/consts.dart';
import '../../resources/models/quiz_model.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz-screen';

  const QuizScreen({Key? key , required this.lessonName}) : super(key: key);
  final String lessonName ;

  @override
  Widget build(BuildContext context) {
    final List<QuizModel> quiz = allQuiz[lessonName]!
        .map((e) => QuizModel(
            question: e['question'],
            options: e['options'].toList(),
            correctAnswer: e['correct_answer']))
        .toList();
    final quizCubit = BlocProvider.of<QuizCubit>(context);
    quizCubit.quizInitialSetup(quiz);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
                context: context,
                builder: (context) =>
                    backConfirmationDialogue(context: context)) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              final bool willPop = await showDialog(
                      context: context,
                      builder: (context) =>
                          backConfirmationDialogue(context: context)) ??
                  false;
              willPop ? Navigator.of(context).pop() : () {};
            },
            icon: const Icon(
              CupertinoIcons.xmark,
              size: 28,
            ),
          ),
          centerTitle: true,
          title: Text(
            "$lessonName Quiz",
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle
                ?.copyWith(fontSize: 21),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 440,
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: BlocBuilder<QuizCubit, QuizState>(
                          builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Question ${quizCubit.currentQuestionIndex + 1} of ${quiz.length}"),
                            const SizedBox(height: 20),
                            Text(
                              quiz[quizCubit.currentQuestionIndex].question,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      fontSize: 19, fontFamily: 'Poppins'),
                            ),
                            const SizedBox(height: 20),
                            ...quiz[quizCubit.currentQuestionIndex]
                                .options
                                .map(
                                  (option) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: optionContainer(
                                        context: context,
                                        text: option,
                                        isChecked:
                                            quizCubit.currentSelectedAnswer ==
                                                option,
                                        onTap: () {
                                          quizCubit.answerQuestion(
                                              question: quiz[quizCubit
                                                      .currentQuestionIndex]
                                                  .question,
                                              selectedAnswer: option,
                                              correctAnswer: quiz[quizCubit
                                                      .currentQuestionIndex]
                                                  .correctAnswer);
                                        }),
                                  ),
                                )
                                .toList(),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: customButton(
                                    text: "Previous",
                                    backgroundColor:
                                        quizCubit.currentQuestionIndex == 0
                                            ? Colors.grey
                                            : Colors.blue,
                                    context: context,
                                    onPressed: () {
                                      quizCubit.previousQuestion();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: quizCubit.currentQuestionIndex !=
                                          quiz.length - 1
                                      ? customButton(
                                          text: "Next",
                                          backgroundColor:
                                              state is QuizAnsweredState
                                                  ? orangeColor
                                                  : Colors.grey,
                                          context: context,
                                          onPressed: () {
                                            state is QuizAnsweredState
                                                ? quizCubit
                                                    .nextQuestion(quiz.length)
                                                : () {};
                                          },
                                        )
                                      : customButton(
                                          text: "Submit",
                                          backgroundColor:
                                              state is QuizAnsweredState
                                                  ? greenColor
                                                  : Colors.grey,
                                          context: context,
                                          onPressed: () {
                                            state is QuizAnsweredState
                                                ? quizCubit.submitAnswers(
                                                    context: context,
                                                    lessonName: lessonName,
                                                  )
                                                : () {};
                                          }),
                                ),
                              ],
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
